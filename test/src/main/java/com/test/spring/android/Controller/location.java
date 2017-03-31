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
import com.test.spring.dto.BusStopDetalCategoryDTO;
import com.test.spring.dto.LocationDTO;

@Controller("location")
public class location {
		
		
		@Autowired
		androidDAO androidDao;
		
		
		
		//거리 오차 조정
		double gap = 50;
		
		
		
		
		
		
		@RequestMapping(value = "/android/ajaxFirst.action", method = {RequestMethod.POST})
		public void ajaxFirst(HttpServletRequest request,HttpServletResponse response,String deviceId) throws IOException {

			//1.기기 seq
			String deviceSeq = androidDao.findDeviceSeq(deviceId);
			System.out.println(deviceSeq);
			
			//2.위경도 전송 주소
							
			String newUrl = "http://211.63.89.33:8090/spring/android/location.action";
			
			//3.버스 상세 구역 intervalTime
			BusStopDetalCategoryDTO busDetailDto = androidDao.findDeviceInterval(deviceId);
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
			
			String locationSeq = locationDto.getLocationSeq();
			double myLat = Double.parseDouble(locationDto.getLocationLatitude());
			double myLng = Double.parseDouble(locationDto.getLocationLongitude());
			
			
			
			
			 
			 //3. 기기id 가지고오기
			 String deviceId = androidDao.findDeviceId(deviceSeq);
			 
			 //해당 기기 정류장 리스트 
			 List<BusStopDTO> busStopList = androidDao.getMyBusStop(deviceId);
			
			 
			 
			 
			 
			 ArrayList<Integer> tempList = new ArrayList();
			 //50m이내 정류장만 구함
			 System.out.println(myLat+":"+myLng);
			for(int i=0;i<busStopList.size();i++){
				//내위치와정류장 위치사이 거리구하기
				double distance = distance(myLat, myLng,Double.parseDouble(busStopList.get(i).getBusStopLatitude()), Double.parseDouble(busStopList.get(i).getBusStopLongitude()), "meter");
				
				System.out.println(i+"번째 정류장 : "+ distance);
				
				if(distance < gap){
					tempList.add(i);
				}
				
			}//for문
			
			
			if(tempList.size() ==1){//50m 이하인 정류장이 1개이면
				
				//정류장 리스트 중 해당 정류장seq를 가져온다.
				int tempNum =tempList.get(0);
				
				String myBusStop = busStopList.get(tempNum).getBusStopSeq();
				
				//업데이트 한다.
				int result = androidDao.updateBusStop(locationSeq,myBusStop);
				System.out.println("***********************************");
				System.out.println(myBusStop);
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
