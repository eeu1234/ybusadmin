package com.test.spring.user;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	@RequestMapping(method={RequestMethod.GET},value="/getBusStopLine.action")
	public String getBusStopLine(HttpServletRequest request, HttpSession session, HttpServletResponse response, String universitySeq,String busStopCategorySeq, String busStopDetailCategorySeq,UniversityDTO universityDTO){
		try {
		    
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
		    
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("busStopCategorySeq", busStopCategorySeq);
			map.put("universitySeq", universitySeq);
			
			if(busStopDetailCategorySeq==null||busStopDetailCategorySeq.equals("")){
				busStopDetailCategorySeq = dao.getDefaultBusStopDetailCategory(map);
			}
			map.put("busStopDetailCategorySeq", busStopDetailCategorySeq);
			
			
		
			List<BusStopDetailCategoryDTO> bsdcList = dao.getAllBusStopDetailCategory(map);
			
			BusStopAvgLatLonDTO avgBSdto = dao.getSpecipicAvgBusStopLatLon(map);
			List<BusStopDTO> bsList= dao.getSpecipicBusStop(map);
			List<CurrBusLocationDTO> cblList = dao.getCurrBusLocation(map);
			UniversityDTO unidto = dao.getUniversityArea(universitySeq);
			
			//request.setAttribute("bsdcdto", bsdcdto);
			request.setAttribute("busStopCategorySeq", busStopCategorySeq);
			request.setAttribute("busStopDetailCategorySeq", busStopDetailCategorySeq);
			request.setAttribute("bsdcList", bsdcList);
			request.setAttribute("cblList", cblList);
			request.setAttribute("avgBSdto", avgBSdto);
			request.setAttribute("unidto", unidto);
			request.setAttribute("bsList", bsList);
			
	
	         
	        // 미터(Meter) 단위
	        double distancekilometer =
	            distance(Double.parseDouble(avgBSdto.getMinLat()), Double.parseDouble(avgBSdto.getMinLon()), Double.parseDouble(avgBSdto.getMaxLat()), Double.parseDouble(avgBSdto.getMaxLon()), "kilometer");
			System.out.println("distanceMeter="+distancekilometer);
			
	        request.setAttribute("distancekilometer", distancekilometer);
			
		 } catch (Exception e) {
		    session.invalidate();
		    try {
		       
		    	response.sendRedirect("/spring/user/selectUniversity.action");
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
