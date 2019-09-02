package com.test.spring.android.Controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
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

@Controller("location")
public class location {
		
		
		@Autowired
		androidDAO androidDao;
		
		
		
		//거리 오차 조정
		double gap = 50;
		//2.위경도 전송 주소
		
		String newUrl = "http://cambus.kr/spring/android/location.action";
	//	String newUrl = "http://eeu1234.iptime.org:8080/spring/android/location.action";
//		String newUrl = "http://192.168.1.243:8080/spring/android/location.action";
		
		String path = "";   //업로드 경로!!
		
		
		
		@RequestMapping(value = "/android/ajaxFirst.action", method = {RequestMethod.POST})
		public void ajaxFirst(HttpServletRequest request,HttpServletResponse response,String deviceId)  {

			
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
			try {
				response.getWriter().print(businfo.toJSONString());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				System.out.println(e.toString());
			}
					
			
		
			
		}
		
		
		@RequestMapping(value = "/android/gperFirst.action", method = {RequestMethod.POST})
		public String gperFirst(HttpServletRequest request,HttpServletResponse response,String deviceId)  {

			
			//1.기기 seq
			String deviceSeq = androidDao.findDeviceSeq(deviceId);
			System.out.println("ajaxFirst deviceSeq:"+deviceSeq);
			
			
			
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
			
			try {
				response.getWriter().print(businfo.toJSONString());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				System.out.println(e.toString());
			}
			
			return businfo.toJSONString();
			
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
			
			System.out.println("location 삽입 시행");
			//1.기기 seq와 함게 insert
			androidDao.insertBusLocation(deviceSeq,deviceLat,deviceLng);
			System.out.println("location 삽입 완료");
			//2.방금 insert 한 데이터 들고옴
			//현재 위도,경도, deviceSeq 
			LocationDTO locationDto = androidDao.getRecentLocation(deviceSeq,deviceLat,deviceLng);
			System.out.println("위치seq:"+locationDto.getLocationSeq());
			String locationSeq = locationDto.getLocationSeq();
			double myLat = Double.parseDouble(locationDto.getLocationLatitude());
			double myLng = Double.parseDouble(locationDto.getLocationLongitude());
			
			
			
			
			 
			 //3. 기기id 가지고오기
			 String deviceId = androidDao.findDeviceId(deviceSeq);
			 
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

		
		@RequestMapping(value = "/android/gper.action", method = {RequestMethod.POST})
		
		@Transactional
		public void getGper(HttpServletRequest request
				,HttpServletResponse response
				,@RequestBody String data) {//Gper 인자 data 수신 
				try {
				
					//JSONObject tmp= "{\"data\":[{\"api_code\":\"api.push.member.location\",\"partner_key\":\"xxxxxxxxxxxxxxxxxxx\",\"member_key\":\"xxxxxxxxxxxxxxxxxxx\",\"location_date\":1556636391,\"latitude\":37.401782989502,\"longitude\":126.7320098877,\"speed\":13.1,\"distance\":9614673,\"function_enable\":0,\"reg_date\":1556636400,\"battery\":100}]}";
					//JSONObject tmp= new JSONObject();
					
					Date today = new Date();
					   

				 System.out.println(today+"data:"+data.toString());
				//String 객체를 Json 객체로 변환
				 JSONParser jsonParser = new JSONParser(); //json 파서 선언
				 
				 //System.out.println("잡자");
				 //Object jsObj = tmp; //오브젝트로 파씽
				 System.out.println("catch1");
				 JSONObject jsonObject1 = (JSONObject) jsonParser.parse(data); //스트링을  json오브젝트로 변경
				 //

				 System.out.println("catch2");
				 
				 
				 JSONObject jsonObject2 = (JSONObject) jsonObject1.get("data");
				/* JSONArray jsonArray =  (JSONArray) jsonParser.parse(jsonObject1.get("data").toString());// 1차 array에서 data에 해당하는 애들 json배열 첫번째에 담음
				 System.out.println("catch3");
				 JSONObject jsonObject2 = (JSONObject) jsonArray.get(0);//배열에서 첫번째 칸 뽑아서 객체에 담음
				 */
				 
				 System.out.println("catch4");
				 
				//  System.out.println(jsonObject2.get("api_code"));//객체에서 꺼냄
			
			
				//Json에서 꺼내서 변수에 담음
	         		
	         		String deviceId = (String)jsonObject2.get("member_key"); //gper key
	         		String deviceLat = jsonObject2.get("latitude").toString(); //위도
	         		String deviceLng = jsonObject2.get("longitude").toString(); //경도
	         		

	         		
	         	System.out.println("gper:단말기 등록여부 체킹 만약 없다면 삽입함");
	         	//DeviceSeq를 찾기 위해 ajaxFirst 페이지로 보냄
	         	String object = gperFirst(request, response, deviceId);	//return type String 이지만  Json 형태임.
	         	System.out.println("gper 단말기 busInfo 불러옴 : "+object);
				JSONObject busInfo = (JSONObject)jsonParser.parse(object);//따라서 Json object로 변환
				
				
				
				System.out.println("ajaxFirst에서 단말기 시퀀스를 불러옴:"+busInfo.toJSONString());//{"businfo":{"newUrl":"http:\/\/cambus.kr\/spring\/android\/location.action","deviceSeq":"122","intervalDistance":"50","intervalTime":"2000"}}
				
			
				
				
				JSONObject jsonBusInfo = (JSONObject) busInfo.get("businfo");// DeviceSeq 얻기위한 json 까기
         		String deviceSeq = (String) jsonBusInfo.get("deviceSeq");
         		System.out.println("gper:방금 삽입한 단말기 시퀀스 불러왔음 : "+deviceSeq);
         		
         		
         		
			
				//1.기기 seq와 함게 insert
				androidDao.insertBusLocation(deviceSeq,deviceLat,deviceLng);
				
				System.out.println("gper:이 문구는 Location테이블 정상삽입됨을 의미함");
				
				
				//2.방금 insert 한 데이터 들고옴
				//현재 위도,경도, deviceSeq 
				LocationDTO locationDto = androidDao.getRecentLocation(deviceSeq,deviceLat,deviceLng);
				System.out.println("위치seq:"+locationDto.getLocationSeq());
				String locationSeq = locationDto.getLocationSeq();
				double myLat = Double.parseDouble(locationDto.getLocationLatitude());
				double myLng = Double.parseDouble(locationDto.getLocationLongitude());
				
				
				
				
				
			
				
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
				
				
				
				
				} catch (Exception e) {
					// TODO: handle exception
					
					System.out.println("Gper예외발생"+e.toString()); 
					
				}//전체 try/catch 구문
				
				
				
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
}
