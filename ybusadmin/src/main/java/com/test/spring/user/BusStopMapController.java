package com.test.spring.user;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.spring.android.Controller.location;
import com.test.spring.android.DAO.androidDAO;
import com.test.spring.dto.AroundPlaceDTO;
import com.test.spring.dto.BusStopAvgLatLonDTO;
import com.test.spring.dto.BusStopDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;
import com.test.spring.dto.CurrBusLocationDTO;
import com.test.spring.dto.UniversityDTO;

/*******************************************
 * @author 이대원
 * --20170327
 * 정류장 약도서비스 최초설계
 * 
 * 
 * 
 *******************************************/


@Controller("busStopMapController")
public class BusStopMapController {
	
	@Autowired
	BusStopMapDAO dao;
	
	@Autowired
	androidDAO anDao;
	
	@Autowired
	location locationClass;
	
	//테스트용 뷰
	
	@RequestMapping(method={RequestMethod.GET},value="/getAllBusStop.action")
	public String getBusStop(HttpServletRequest request, HttpSession session, HttpServletResponse response, String universitySeq,String busStopSeq){
		try {
		    
			universitySeq = request.getParameter("universitySeq");
			//busStopSeq="4";
			//System.out.println(universitySeq);
			
			BusStopDTO bsdto= dao.busStop(busStopSeq);
			
			UniversityDTO unidto = dao.getUniversityArea(universitySeq);
			
			
			request.setAttribute("unidto", unidto);
			request.setAttribute("bsdto", bsdto);
    
		 } catch (Exception e) {
		    session.invalidate();
		    try {
		       
		    	response.sendRedirect("/spring/user/selectUniversity.action");
		    	return "user/selectUniversity";

 
		    } catch (Exception e2) {
		       // TODO: handle exception
		    }
		 }
				
		return "user/getBusStop";
	}
	
	
	//로드뷰
	//정류장번호 받아다가 정류장 주변 위치들 보내줌
	//정류장번호 받아다가 정류장 위경도 보내줌
	@RequestMapping(method={RequestMethod.GET},value="/getBusStopRoadView.action")
	public String getBusStopRoadView(HttpServletRequest request, HttpSession session, HttpServletResponse response, String universitySeq,String busStopSeq,String busStopCategorySeq){
		
		//busStopSeq="4";
		try {
			List<AroundPlaceDTO> apList = dao.getAroundPlace(busStopSeq);
			BusStopDTO bsdto= dao.busStop(busStopSeq);
			
			request.setAttribute("busStopCategorySeq", busStopCategorySeq);
			request.setAttribute("apList", apList);
			request.setAttribute("bsdto", bsdto);
			    
		 } catch (Exception e) {
		    session.invalidate();
		    try {
		       
		    	response.sendRedirect("/spring/user/selectUniversity.action");
		    	return "user/selectUniversity";
		    } catch (Exception e2) {
		       // TODO: handle exception
		    }
		 }
		
		return "user/getBusStopRoadView";
	}
	
	
	//지도뷰
	//정류장번호 받아다가 정류장 주변 위치들 보내줌
	//정류장번호 받아다가 정류장 위경도 보내줌
	@RequestMapping(method={RequestMethod.GET},value="/getBusStopMapView.action")
	public String getBusStopMapView(HttpServletRequest request, HttpSession session, HttpServletResponse response, String universitySeq,String busStopSeq,String busStopCategorySeq){
		
		//busStopSeq="4";
		try {
		    
			List<AroundPlaceDTO> apList = dao.getAroundPlace(busStopSeq);
			BusStopDTO bsdto= dao.busStop(busStopSeq);
			
			request.setAttribute("busStopCategorySeq", busStopCategorySeq);
			request.setAttribute("apList", apList);
			request.setAttribute("bsdto", bsdto);
			
		 } catch (Exception e) {
		    session.invalidate();
		    try {
		       
		    	response.sendRedirect("/spring/user/selectUniversity.action");
		    	return "user/selectUniversity";
		    } catch (Exception e2) {
		       // TODO: handle exception
		    }
		 }
		
		
		return "user/getBusStopMapView";
	}
	
	
	//학교 정류장뷰 - 테이블
	//학교 번호를 받아서 학교의 위경도를 들고가서 지도의 중앙을 찾아줘야함.
	//해당 노선의 정류장 번호를 받아서 모든 정류장의 위경도 받아다가 지도에 마커 찍어줘야함.
	//현재 해당 노선에서 운행중인 버스의 실시간 위치를 찍어줘야함.
	//타임라인 페이지
	@RequestMapping(method={RequestMethod.GET},value="/getBusStopLine.action")
	public String getBusStopLine(HttpServletRequest request
			, HttpSession session
			, HttpServletResponse response
			, String universitySeq
			, String busStopCategorySeq
			, String busStopDetailCategorySeq
			,UniversityDTO universityDTO){
		
		try {
			
			/*2019-05-11 Gper 단말기 연산을 위해 객체 선언
			 
			  GPER은 사용자가 요청시  API로 단말기 위경도를 불러와 현재 정류장을 삽입하도록 한다.
			*/

		
		
		    //GPER에 등록되지 않은 노선은 건너 뜀. 2019-05-13
		    if(locationClass.getAPICertKey(busStopCategorySeq) !=null) {
			    JSONArray busgroup =  locationClass.getAPICertKey(busStopCategorySeq);
			    {
			    	
				    for(int i=0;i<busgroup.size();i++){
		      
				    	JSONObject tmp=(JSONObject)busgroup.get(i);
				    	
				    	String member_pin=tmp.get("member_pin").toString();//단말기 모델번호
				    	String last_latitude=tmp.get("last_latitude").toString();
				    	String last_longitude=tmp.get("last_longitude").toString();
				    	String lastCheckDate = tmp.get("last_check_date").toString(); //마지막 체크 시간
				    	/*
				    	System.out.println(member_pin);
				    	System.out.println("last_latitude : "+last_latitude); 
		         		System.out.println("last_longitude : "+last_longitude);
				    	System.out.println("last_check_date : "+lastCheckDate);
		         		
		         		*/
				   
		         	
		     			
		         		
		         		try {
		         			//GPER 핀번호로 seq 찾기 -> 단 사전에 GPER 기기 등록을 진행해야 가능
		         			String deviceSeq = anDao.findDeviceSeq(member_pin);
		         			
		         			
		         			//GPER 단말기 마지막 작동 시간 비교 
		         			//5분이 넘은 데이터라면 삽입하지 않음
		         			long L = System.currentTimeMillis() / 1000;
		         			
		        		

		        			 // System.out.println("현재시간:"+L+"/////"+"마지막조회시간:"+Long.parseLong(lastCheckDate));
		        			  
		        			  /*
		        			  
		        			  시간 검사기
		        			  long LL=L-300;
		        			  Date date = new Date(LL*1000L);

		        			  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss z");

		        			  // GMT(그리니치 표준시 +9 시가 한국의 표준시

		        			  sdf.setTimeZone(TimeZone.getTimeZone("GMT+9"));

		        			  String formattedDate = sdf.format(date);

		        			  System.out.println(formattedDate);
		        			*/
		        			  
		         			
		         			//GPER 단말기 최종 조회 시간이 현재 시간에서 5분을 뺀 것보다 더 최신일 때 수행함 // 위경도 삽입
		         			if(L-300 < Long.parseLong(lastCheckDate)){
		         			//단말기 정류장 계산식 삽입
		         				locationClass.locationCalculate(deviceSeq,last_latitude,last_longitude,lastCheckDate);	
		         			}
		         			
		         			
		         			
		         			
		         			
		         			
		         			
						} catch (Exception e) {
							System.out.println(e.toString());
							// TODO: handle exception
						}
		         		
		         		
		         		
		         		
		         	}
			    }
		    } 
		    
		    
		    
		    /*
		     * 기존 방식
		     * 
		     * */
		    
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("busStopCategorySeq", busStopCategorySeq);
			map.put("universitySeq", universitySeq);
			
			//System.out.println("busStopCategorySeq+++"+map.get("busStopCategorySeq"));
			//System.out.println(map.get("universitySeq"));
			//System.out.println(busStopCategorySeq);
			//System.out.println(universitySeq);
			//System.out.println("$$$$$"+universitySeq);
			if(busStopDetailCategorySeq==null||busStopDetailCategorySeq.equals("")){
				busStopDetailCategorySeq = dao.getDefaultBusStopDetailCategory(map);
				//System.out.println("?????="+busStopDetailCategorySeq);
			}
			map.put("busStopDetailCategorySeq",busStopDetailCategorySeq);
			
			BusStopAvgLatLonDTO avgBSdto = dao.getSpecipicAvgBusStopLatLon(map);//지정된 노선의 맵 중앙
			List<BusStopDTO> bsList= dao.getSpecipicBusStop(map);//지정된 정류장
			List<CurrBusLocationDTO> cblList = dao.getCurrBusStopLocation(map);//현재 버스 위치
			List<BusStopDetailCategoryDTO> bsdcList = dao.getAllBusStopDetailCategory(map);
			UniversityDTO unidto = dao.getUniversityArea(universitySeq);
			/*
			for(int i =0; i<bsList.size(); i++){
				System.out.println("bsList"+i+"bsOrder"+bsList.get(i).getBusStopOrder());
			}
			*/
			request.setAttribute("busStopCategorySeq", busStopCategorySeq);
			request.setAttribute("busStopDetailCategorySeq", busStopDetailCategorySeq);
			request.setAttribute("bsdcList", bsdcList);
			request.setAttribute("cblList", cblList);
			request.setAttribute("avgBSdto", avgBSdto);
			request.setAttribute("unidto", unidto);
			request.setAttribute("bsList", bsList);   
			
			
		 } catch (Exception e) {
		    session.invalidate();
		    try {
		       
		    	response.sendRedirect("/spring/user/selectUniversity.action");
		    	return "user/selectUniversity";
		    } catch (Exception e2) {
		       // TODO: handle exception
		    }
		 }
		//busStopCategorySeq ="2";
		//System.out.println("getBusStopLine="+busStopCategorySeq);

		
		return "user/getBusStopLine";
	}
	
	
	//학교 정류장뷰 - 지도
	//학교 번호를 받아서 학교의 위경도를 들고가서 지도의 중앙을 찾아줘야함.
	//해당 노선의 정류장 번호를 받아서 모든 정류장의 위경도 받아다가 지도에 마커 찍어줘야함.
	//현재 해당 노선에서 운행중인 버스의 실시간 위치를 찍어줘야함.
	//정류장들의 위,경도의 평균을 내서 지도의 중앙을 잡아줘야함	
	@RequestMapping(method={RequestMethod.GET},value="/getBusStopLocation.action")
	public String getBusStopLocation(HttpServletRequest request, HttpSession session, HttpServletResponse response, String universitySeq,String busStopCategorySeq,String busStopDetailCategorySeq){
		
		try {
			/*2019-05-11 Gper 단말기 연산을 위해 객체 선언
			 
			  GPER은 사용자가 요청시  API로 단말기 위경도를 불러와 현재 정류장을 삽입하도록 한다.
			*/

		
		
		    //GPER에 등록되지 않은 노선은 건너 뜀. 2019-05-13
		    if(locationClass.getAPICertKey(busStopCategorySeq) !=null) {
			    JSONArray busgroup =  locationClass.getAPICertKey(busStopCategorySeq);
			    {
			    	
				    for(int i=0;i<busgroup.size();i++){
		      
				    	JSONObject tmp=(JSONObject)busgroup.get(i);
				    	
				    	String member_pin=tmp.get("member_pin").toString();//단말기 모델번호
				    	String last_latitude=tmp.get("last_latitude").toString();
				    	String last_longitude=tmp.get("last_longitude").toString();
				    	String lastCheckDate = tmp.get("last_check_date").toString(); //마지막 체크 시간
				    	/*
				    	System.out.println(member_pin);
				    	System.out.println("last_latitude : "+last_latitude); 
		         		System.out.println("last_longitude : "+last_longitude);
				    	System.out.println("last_check_date : "+lastCheckDate);
		         		
		         		
				   */
		         	
		     			
		         		
		         		try {
		         			//GPER 핀번호로 seq 찾기 -> 단 사전에 GPER 기기 등록을 진행해야 가능
		         			String deviceSeq = anDao.findDeviceSeq(member_pin);
		         			
		         			
		         			//GPER 단말기 마지막 작동 시간 비교 
		         			//5분이 넘은 데이터라면 삽입하지 않음
		         			long L = System.currentTimeMillis() / 1000;
		         			
		        		

		        			  System.out.println("현재시간:"+L+"/////"+"마지막조회시간:"+Long.parseLong(lastCheckDate));
		        			  
		        			 /* 
		        			  
		        			  //시간 검사기
		        			  long LL=L-300;
		        			  Date date = new Date(LL*1000L);

		        			  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss z");

		        			  // GMT(그리니치 표준시 +9 시가 한국의 표준시

		        			  sdf.setTimeZone(TimeZone.getTimeZone("GMT+9"));

		        			  String formattedDate = sdf.format(date);

		        			  System.out.println(formattedDate);
		        			*/
		        			  
		         			
		         			//GPER 단말기 최종 조회 시간이 현재 시간에서 5분을 뺀 것보다 더 최신일 때 수행함 // 위경도 삽입
		         			if(L-300 < Long.parseLong(lastCheckDate)){
		         			//단말기 정류장 계산식 삽입
		         				locationClass.locationCalculate(deviceSeq,last_latitude,last_longitude,lastCheckDate);	
		         			}
		         			
		         			
		         			
		         			
		         			
		         			
		         			
						} catch (Exception e) {
							System.out.println(e.toString());
							// TODO: handle exception
						}
		         		
		         		
		         		
		         		
		         	}
			    }
		    } 
		    
			
			
			
			
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("busStopCategorySeq", busStopCategorySeq);
			map.put("universitySeq", universitySeq);
			
			if(busStopDetailCategorySeq==null||busStopDetailCategorySeq.equals("")){
				busStopDetailCategorySeq = dao.getDefaultBusStopDetailCategory(map);
			}
			map.put("busStopDetailCategorySeq", busStopDetailCategorySeq);
			
			/*
			System.out.println("busstop:"+busStopCategorySeq);
			System.out.println("대학교SEQ"+universitySeq);
			System.out.println("정류장소분류"+busStopDetailCategorySeq);
		*/
			List<BusStopDetailCategoryDTO> bsdcList = dao.getAllBusStopDetailCategory(map);
			
			BusStopAvgLatLonDTO avgBSdto = dao.getSpecipicAvgBusStopLatLon(map);
			List<BusStopDTO> bsList= dao.getSpecipicBusStop(map);
			List<CurrBusLocationDTO> cblList = dao.getCurrBusLocation(map);
			UniversityDTO unidto = dao.getUniversityArea(universitySeq);
			
			//request.setAttribute("bsdcdto", bsdcdto);
			
			
	
			double distancekilometer =0;
	        // 미터(Meter) 단위
			if(avgBSdto!=null){
				distancekilometer =
	            distance(Double.parseDouble(avgBSdto.getMinLat()), Double.parseDouble(avgBSdto.getMinLon()), Double.parseDouble(avgBSdto.getMaxLat()), Double.parseDouble(avgBSdto.getMaxLon()), "kilometer");
				System.out.println("distanceMeter="+distancekilometer);
			}else{
				avgBSdto = new BusStopAvgLatLonDTO();
				avgBSdto.setAvgLat(unidto.getUniversityLatitude());
				avgBSdto.setAvgLon(unidto.getUniversityLongitude());
				avgBSdto.setMaxLat(unidto.getUniversityLatitude());
				avgBSdto.setMaxLon(unidto.getUniversityLongitude());
				avgBSdto.setMinLat(unidto.getUniversityLatitude());
				avgBSdto.setMinLon(unidto.getUniversityLongitude());
				distancekilometer =
			            distance(Double.parseDouble(avgBSdto.getMinLat()), Double.parseDouble(avgBSdto.getMinLon()), Double.parseDouble(avgBSdto.getMaxLat()), Double.parseDouble(avgBSdto.getMaxLon()), "kilometer");
			}
	        request.setAttribute("distancekilometer", distancekilometer);
	        request.setAttribute("busStopCategorySeq", busStopCategorySeq);
			request.setAttribute("busStopDetailCategorySeq", busStopDetailCategorySeq);
			request.setAttribute("bsdcList", bsdcList);
			request.setAttribute("cblList", cblList);
			request.setAttribute("avgBSdto", avgBSdto);
			request.setAttribute("unidto", unidto);
			request.setAttribute("bsList", bsList);
	        
		 } catch (Exception e) {
			 System.out.println(e.toString());
		    session.invalidate();
		    try {
		       
		    	response.sendRedirect("/spring/user/selectUniversity.action");
		    	return "user/selectUniversity";
		    } catch (Exception e2) {
		       // TODO: handle exception
		    }
		 }
		//busStopCategorySeq ="2";
		

		
		return "user/getBusStopLocation";
	}
	
    
	
	private static double distance(double lat1, double lon1, double lat2, double lon2, String unit) {
        
        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
         
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
         
        if (unit == "kilometer") {
            dist = dist * 1.609344;
        } else if(unit == "meter"){
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
