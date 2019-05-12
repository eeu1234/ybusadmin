package com.test.spring.android.Controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.test.spring.android.DAO.androidDAO;
import com.test.spring.dto.BusLogDTO;
import com.test.spring.dto.BusStopDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;
import com.test.spring.dto.LocationDTO;
import com.test.spring.dto.VirtualBusStopDTO;
import com.test.spring.user.BusStopMapDAO;

@Controller("location")
public class location {
		
		
		@Autowired
		androidDAO androidDao;
		
		@Autowired
		BusStopMapDAO busStopMapDao; 
		
		//거리 오차 조정
		double gap = 50;
		//2.위경도 전송 주소
		
		String newUrl = "http://cambus.kr/spring/android/location.action";
	//	String newUrl = "http://eeu1234.iptime.org:8080/spring/android/location.action";
//		String newUrl = "http://192.168.1.243:8080/spring/android/location.action";
		
		String path = "";   //업로드 경로!!
		
		
		
		@RequestMapping(value = "/android/ajaxFirst.action", method = {RequestMethod.POST})
		public void ajaxFirst(HttpServletRequest request,HttpServletResponse response,String deviceId) throws IOException {

			//1.기기 seq
			String deviceSeq = androidDao.findDeviceSeq(deviceId);
			System.out.println(deviceSeq);
			
			
			
			//3.버스 상세 구역 intervalTime
			BusStopDetailCategoryDTO busDetailDto = androidDao.findDeviceInterval(deviceId);
			String intervalTime = busDetailDto.getBusStopDetailCategoryInterval();
			String intervalDistance = busDetailDto.getBusStopDetailCategoryIntervalDistance();
			
			
			JSONObject obj = new JSONObject();
			JSONObject businfo = new JSONObject();
			
			
			obj.put("deviceSeq", deviceSeq);
			obj.put("intervalTime", intervalTime);
			obj.put("intervalDistance", intervalDistance);
			obj.put("newUrl", newUrl);
			
			
			businfo.put("businfo",obj);
			response.setCharacterEncoding("utf-8");
			//System.out.println(businfo.toJSONString());
			response.getWriter().print(businfo.toJSONString());
					
			
			
			
			
		}
		
		
		@ResponseBody
		@RequestMapping(value = "/android/signLog.action", headers=("content-type=multipart/*"),method=RequestMethod.POST)	
		public void  signLog(HttpServletRequest  request
								,HttpServletResponse response
									,String staffName
									,String driverName
									,String distance
									,String destination
									,String purpose
									,String startTime
									,String endTime
									,String deviceSeq
									,String imgName
									
							) throws IOException {
//,File imgName
			

			try {
				
				System.out.println("staffName:"+staffName);
				System.out.println("driverName:"+driverName);
				System.out.println("distance:"+distance);
				System.out.println("destination:"+destination);
				System.out.println("purpose:"+purpose);
				System.out.println("startTime:"+startTime);
				System.out.println("endTime:"+endTime);
				System.out.println("imgName:"+imgName);
				System.out.println("deviceSeq:"+deviceSeq);
				
				
			
				BusLogDTO logDto = new BusLogDTO();
				logDto.setBusLogStaff(staffName);
				logDto.setBusLogDriver(driverName);
				logDto.setBusLogDistance(distance);
				logDto.setBusLogDestination(destination);
				logDto.setBusLogPurpose(purpose);
				logDto.setBusLogStartTime(startTime);	
				logDto.setBusLogEndTime(endTime);
				logDto.setBusLogSignimg(imgName);
				logDto.setDeviceSeq(deviceSeq);
				//logDto.setBusLogLastDistance(lastDistance);
				MultipartRequest multi = (MultipartRequest) request;
				
				MultipartFile mfile = ((MultipartRequest) multi).getFile("signImg");
				 System.out.println(multi.getFile("signImg").getName()); 
				 System.out.println(multi.getFile("signImg").getSize());
			 
			 
			    path = request.getRealPath("/images/sign/");
	               System.out.println("path:"+path);

	            //   fileName = getFileName(mfile.getOriginalFilename());

	               File file = new File(path + imgName);
	               // DB -> temp(물리명)
	               // -> mfile.getOriginalFilename()(원본명)

	               mfile.transferTo(file); // 파일 업로드 실행

	               //1.기기 seq와 함게 insert
	               int key = androidDao.insertBusLog(logDto);
	               
			 
			} catch (Exception e) {
				System.out.println(e);
				System.out.println("예외 상황 발생..! ");
			}
		}
		
		
		
		
		
		@RequestMapping(value = "/android/location.action", method = {RequestMethod.POST})
		@Transactional
		public void getLocation(HttpServletRequest request
									,HttpServletResponse response
										,String deviceSeq
											,String deviceLat
												,String deviceLng) {
			
			locationCalculate(deviceSeq,deviceLat,deviceLng);
			
			
			
		}

		
		
		/*2019-05-11 GPER 연동을 위해 기존 location.action에서 알고리즘 분리*/
		public void locationCalculate(String deviceSeq,String deviceLat,String deviceLng ) {
			
		
			
			
			//1.기기 seq와 함게 insert
			androidDao.insertBusLocation(deviceSeq,deviceLat,deviceLng);
			
			//2.방금 insert 한 데이터 들고옴
			//현재 위도,경도, deviceSeq 
			LocationDTO locationDto = androidDao.getRecentLocation(deviceSeq,deviceLat,deviceLng);
			System.out.println("위치seq:"+locationDto.getLocationSeq());
			String locationSeq = locationDto.getLocationSeq();
			double myLat = Double.parseDouble(locationDto.getLocationLatitude());
			double myLng = Double.parseDouble(locationDto.getLocationLongitude());
			
			
			
			
			// System.out.println("3.DeviceSeq");
			 //3. 기기id 가지고오기
			 String deviceId = androidDao.findDeviceId(deviceSeq);
			 System.out.println("deviceId:"+deviceId);
			 //해당 기기 정류장 리스트 
			 List<VirtualBusStopDTO> busStopList = androidDao.getMyBusStop(deviceId);
			
			 
			 
			 
			 
			 ArrayList<Integer> tempList = new ArrayList();
			 //50m이내 정류장만 구함
			 System.out.println(myLat+":"+myLng);
			for(int i=0;i<busStopList.size();i++){
				//내위치와정류장 위치사이 거리구하기
				double distance = distance(myLat, myLng,Double.parseDouble(busStopList.get(i).getVirtualBusStopLatitude()), Double.parseDouble(busStopList.get(i).getVirtualBusStopLongitude()), "meter");
				
				System.out.println(i+"번째 정류장 : "+ distance);
				
				if(distance < gap){
					tempList.add(i);
				}
				
			}//for문
			
			
			if(tempList.size() ==1){//50m 이하인 정류장이 1개이면

				//정류장 리스트 중 해당 정류장seq를 가져온다.
				int tempNum =tempList.get(0);
				
				
				String myBusStop = busStopList.get(tempNum).getVirtualBusStopSeq();//정류장 seq 호출
				
				//업데이트 한다.
				int result = androidDao.updateBusStop(locationSeq,myBusStop);
				System.out.println("***********************************");
				System.out.println(myBusStop);
				
				
			}else if(tempList.size() == 2 ){
				
				try {

					
				//2개이상
				int tempNum1 =tempList.get(0)+1;//첫정류장 order번호
				int tempNum2 =tempList.get(1)+1;//두번째정류장order번호
				
				
					BusStopDTO busStopDto = androidDao.myLastBusStop(deviceSeq);
					int myLastBusStop = Integer.parseInt(busStopDto.getBusStopOrder());//이기기의 최신 이전 정류장
					
					System.out.println("*********************************************************************************************");
					System.out.println("myLastBusStop:"+myLastBusStop);
					System.out.println(tempNum1);
					System.out.println(tempNum2);
					
					if(myLastBusStop == tempNum1 ||myLastBusStop == tempNum2){
						//이전정류장이랑 같은놈이있으면 작동을 끝낸다.
						/*
						  ex)myLastBusStop ==3
						  tempNum1 이나 tempNum2 가 3이있을 때
						 
						 */
						return;
					}
					
					
					if(myLastBusStop<tempNum1 && myLastBusStop<tempNum2){//가지고있던 정류장보다 새로운 정류장이 클 때
						if(tempNum1 < tempNum2){
							System.out.println("tempNum1:" + tempNum1);
							String myBusStop = busStopList.get(tempNum1-1).getVirtualBusStopSeq();//정류장 seq 호출
							androidDao.updateBusStop(locationSeq,myBusStop);
						}else{
							
							String myBusStop = busStopList.get(tempNum2-1).getVirtualBusStopSeq();//정류장 seq 호출
							System.out.println("tempNum2:" + tempNum2);
							androidDao.updateBusStop(locationSeq,myBusStop);
							
						}
				
					}else if(myLastBusStop<tempNum1){
						String myBusStop = busStopList.get(tempNum1-1).getVirtualBusStopSeq();//정류장 seq 호출 배열은 0부터 시작이라 다시 -1 해준다
						androidDao.updateBusStop(locationSeq,myBusStop);
						System.out.println("tempNum1:" + tempNum1);
					}else if( myLastBusStop<tempNum2){
						String myBusStop = busStopList.get(tempNum2-1).getVirtualBusStopSeq();//정류장 seq 호출
						androidDao.updateBusStop(locationSeq,myBusStop);
						System.out.println("tempNum2:" + tempNum2);
					
					
					}else{
					//둘다 작을땐 할게없다. 버스는 작은데서 크게 발전하기때문
					System.out.println("둘다작음");	
				
					}
					
					
					
					
				
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				
			}else{
				//3개이상
				
				
			}
			
		}
		
		

		
		
		
		
		/**
		 * 두 지점간의 거리 계산
		 * 
		 * @param lat1
		 *            지점 1 위도
		 * @param lon1
		 *            지점 1 경도
		 * @param lat2
		 *            지점 2 위도
		 * @param lon2
		 *            지점 2 경도
		 * @param unit
		 *            거리 표출단위
		 * @return
		 */
		public static double distance(double lat1, double lon1, double lat2, double lon2, String unit) {

			double theta = lon1 - lon2;
			double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2))
					+ Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));

			dist = Math.acos(dist);
			dist = rad2deg(dist);
			dist = dist * 60 * 1.1515;

			if (unit == "kilometer") {
				dist = dist * 1.609344;
			} else if (unit == "meter") {
				dist = dist * 1609.344;
			}

			return (dist);
		}

		// This function converts decimal degrees to radians
		private static double deg2rad(double deg) {
			return (deg * Math.PI / 180.0);
		}

		// This function converts radians to decimal degrees
		private static double rad2deg(double rad) {
			return (rad * 180 / Math.PI);
		}
		
		
		
		
		//중복되지 않는 파일명 얻어오기
		   public String getFileName(String filename) {
		   
		      int n = 1;
		      
		      int index = filename.lastIndexOf(".");
		      String oname = filename.substring(0, index);
		      String ext = filename.substring(index);
		      
		      
		      while(true) {
		         File file = new File(path + filename);

		         if (file.exists()) {
		            //홍길동.txt
		            filename = oname + "_" + n + ext; //홍길동_1.txt
		            n++;
		         } else {
		            return file.getName();
		         }
		      }
		      
		   }
		   
		   
		   
		
			
			
		   
		   
		   //GPER 위경도 요청
			public  JSONArray getAPICertKey(String busStopCategorySeq) {
			    String api= "api.common.group.get.group.object.list";
					//그룹으로 된 단말리스트 불러오는 api 주소//
				String api_key= "ae113180b09d8e3180913218039c03605d30febc";
					
				String server_key="1d1c2e20aed289dcea01c3150bc30ee04d406016";
					
				long timestamp = new Date().getTime();
				
				
				
				
				//인증 Cert_key 받는 부분
				String hash_in = timestamp+"|"+api_key+"|"+server_key;
			    String cert_key = "";
			    byte[] input = hash_in.getBytes();

			    try {
			        MessageDigest messageDigest = MessageDigest.getInstance("SHA1");
			        messageDigest.update(input, 0, input.length);
			        cert_key = new BigInteger(1, messageDigest.digest()).toString(16);
			    } catch (NoSuchAlgorithmException e) {
			        // TODO Auto-generated catch block
			        e.printStackTrace();
			    }
			    
			    
			    //여기서 busStopCategorySeq 가지고 그룹키를받야아함  
			    
			    
			    
			    
//			    String group_key = "da4c8768d4def293944f4f613e3089bb4e42124e";
			    String group_key = busStopMapDao.getGroupHashKey(busStopCategorySeq);
			    
	
				// GPER그룹키 - 현재 : 큰셔틀버스 그룹키   ->  추후 노란셔틀버스도 추가할것
				
			    
			    
			    
			    
			    
				BufferedReader in = null;
				try {
					String url = "http://cms.catchloc.com/api.partner.common.php";
					
					//System.out.println(url +"?api="+api+"&"+"api_key="+api_key+"&"+"timestamp="+timestamp	+"&"+"cert_key="+cert_key+"&"+"group_key="+group_key);
					
					
					URL obj = new URL(url +"?api="+api+"&"+"api_key="+api_key+"&"+"timestamp="+timestamp
							+"&"+"cert_key="+cert_key+"&"+"group_key="+group_key); //호출할 url 
			         
					HttpURLConnection con = (HttpURLConnection)obj.openConnection();
			         
			         	con.setRequestMethod("GET");
			         	in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			         	String line = in.readLine();
			         	
			         	
			         	JSONParser memberparser = new JSONParser();
			         	JSONArray busgroup = (JSONArray) memberparser.parse(line);
			         	
			         	//삭제 될 부분 2019-05-11 23:48
			         	for(int i=0;i<busgroup.size();i++){
			         		JSONObject tmp=(JSONObject)busgroup.get(i);
			         		String member_name = (String)tmp.get("member_name"); //gper 단말기 이름
			         		String member_key = (String)tmp.get("member_key"); //gper 버스분류
			         		double last_latitude = (Double)tmp.get("last_latitude"); //위도
			         		double last_longitude = (Double)tmp.get("last_longitude"); //경도
			         		long last_check_date = (Long)tmp.get("last_check_date"); //마지막 체크 시간
/*

			         		System.out.println("member_key : "+member_key);
			         		System.out.println("member_name : "+member_name);
			         		System.out.println("last_latitude : "+last_latitude); 
			         		System.out.println("last_longitude : "+last_longitude);
			         		System.out.println("last_check_date : "+last_check_date);
*/			         		
			         		
			         	}
			         	
			         	  return busgroup;
			         	
			         	
			         	
			    //예외 처리
				}catch(Exception e) { 
					e.printStackTrace();
		         } 
		          
	            finally {
	               if(in != null) try { in.close();
	               } catch(Exception e) {
	                  e.printStackTrace(); 
	                  } 
	               } 

			    
			    
				 return null;
		         	
			    
			    
			    
			    
			    
			    
			    
			  
			    
			    
			    
			    
			    
			    
			   
			}

		  
}
