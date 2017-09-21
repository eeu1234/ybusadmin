package com.test.spring.android.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.spring.android.DAO.androidDAO;
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
		
	//	String newUrl = "http://cambus.kr/spring/android/location.action";
		String newUrl = "http://192.168.1.243:8080/spring/android/location.action";
		
		
		
		
		
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
		
		
		@RequestMapping(value = "/android/signLog.action", method = {RequestMethod.POST})
		@Transactional
		public void signLog(HttpServletRequest request
								,HttpServletResponse response
								,String busLogPerson
								,String busLogDistance
								,String busLogSignimg
								,String busLogStartTime
								,String busLogEndTime
								,String deviceSeq) throws IOException {

			//1.기기 seq와 함게 insert
			int key = androidDao.insertBusLog(busLogPerson,busLogDistance,busLogSignimg,busLogStartTime,busLogEndTime,deviceSeq);
			
			
			
			
			
			
			JSONObject obj = new JSONObject();
			JSONObject confirmKey = new JSONObject();
			
			
			obj.put("key", key);
	
			
			confirmKey.put("confirmKey",obj);
			response.setCharacterEncoding("utf-8");
			//System.out.println(businfo.toJSONString());
			response.getWriter().print(confirmKey.toJSONString());
					
			
			
			
			
		}
		
		
		
		
		
		@RequestMapping(value = "/android/location.action", method = {RequestMethod.POST})
		@Transactional
		public void getLocation(HttpServletRequest request
									,HttpServletResponse response
										,String deviceSeq
											,String deviceLat
												,String deviceLng) {
			
		
			//1.기기 seq와 함게 insert
			androidDao.insertBusLocation(deviceSeq,deviceLat,deviceLng);
			
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
}
