package com.test.spring.map;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.spring.dto.AroundPlaceDTO;

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
	
	//학교 정류장뷰
	//학교 번호를 받아서 학교의 위경도를 들고가서 지도의 중앙을 찾아줘야함.
	//정류장 번호를 받아서 모든 정류장의 위경도 받아다가 지도에 마커 찍어줘야함.
	@RequestMapping(method={RequestMethod.GET},value="/getAllBusStop.action")
	public String getBusStop(HttpServletRequest request, HttpServletResponse response, String universitySeq,String busStopSeq){
		universitySeq = "1";
		busStopSeq="4";
		System.out.println(universitySeq);
		
		BusStopDTO bsdto= dao.busStop(busStopSeq);
		
		UniversityDTO unidto = dao.getUniversityArea(universitySeq);
		
		
		request.setAttribute("unidto", unidto);
		request.setAttribute("bsdto", bsdto);
		
		return "getBusStop";
	}
	
	
	//로드뷰
	//정류장번호 받아다가 정류장 주변 위치들 보내줌
	//정류장번호 받아다가 정류장 위경도 보내줌
	@RequestMapping(method={RequestMethod.GET},value="/getBusStopRoadView.action")
	public String getBusStopRoadView(HttpServletRequest request, HttpServletResponse response, String universitySeq,String busStopSeq){
		universitySeq = "1";
		busStopSeq="4";
		
		List<AroundPlaceDTO> apList = dao.getAroundPlace(busStopSeq);
		BusStopDTO bsdto= dao.busStop(busStopSeq);
		
		
		request.setAttribute("apList", apList);
		request.setAttribute("bsdto", bsdto);
		
		return "getBusStopRoadView";
	}
	
	
	//지도뷰
	//정류장번호 받아다가 정류장 주변 위치들 보내줌
	//정류장번호 받아다가 정류장 위경도 보내줌
	@RequestMapping(method={RequestMethod.GET},value="/getBusStopMapView.action")
	public String getBusStopMapView(HttpServletRequest request, HttpServletResponse response, String universitySeq,String busStopSeq){
		universitySeq = "1";
		busStopSeq="4";
		
		List<AroundPlaceDTO> apList = dao.getAroundPlace(busStopSeq);
		BusStopDTO bsdto= dao.busStop(busStopSeq);
		
		
		request.setAttribute("apList", apList);
		request.setAttribute("bsdto", bsdto);
		
		return "getBusStopMapView";
	}
	
	
	//학교 정류장뷰 - 테이블
	//학교 번호를 받아서 학교의 위경도를 들고가서 지도의 중앙을 찾아줘야함.
	//해당 노선의 정류장 번호를 받아서 모든 정류장의 위경도 받아다가 지도에 마커 찍어줘야함.
	//현재 해당 노선에서 운행중인 버스의 실시간 위치를 찍어줘야함.
	@RequestMapping(method={RequestMethod.GET},value="/getBusStopLine.action")
	public String getBusStopLine(HttpServletRequest request, HttpServletResponse response, String universitySeq,String busStopCategorySeq){
		universitySeq = "1";
		busStopCategorySeq ="2";
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("busStopCategorySeq", busStopCategorySeq);
		map.put("universitySeq", universitySeq);
		
		BusStopAvgLatLonDTO avgBSdto = dao.getAvgBusStopLatLon(map);
		List<BusStopDTO> bsList= dao.getAllBusStop(map);
		List<CurrBusLocationDTO> cblList = dao.getCurrBusStopLocation(map);
		
		UniversityDTO unidto = dao.getUniversityArea(universitySeq);
		
		request.setAttribute("cblList", cblList);
		request.setAttribute("avgBSdto", avgBSdto);
		request.setAttribute("unidto", unidto);
		request.setAttribute("bsList", bsList);
		
		return "getBusStopLine";
	}
	
	
	//학교 정류장뷰 - 지도
	//학교 번호를 받아서 학교의 위경도를 들고가서 지도의 중앙을 찾아줘야함.
	//해당 노선의 정류장 번호를 받아서 모든 정류장의 위경도 받아다가 지도에 마커 찍어줘야함.
	//현재 해당 노선에서 운행중인 버스의 실시간 위치를 찍어줘야함.
	//정류장들의 위,경도의 평균을 내서 지도의 중앙을 잡아줘야함	
	@RequestMapping(method={RequestMethod.GET},value="/getBusStopLocation.action")
	public String getBusStopLocation(HttpServletRequest request, HttpServletResponse response, String universitySeq,String busStopCategorySeq){
		universitySeq = "1";
		busStopCategorySeq ="2";
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("busStopCategorySeq", busStopCategorySeq);
		map.put("universitySeq", universitySeq);
		
		BusStopAvgLatLonDTO avgBSdto = dao.getAvgBusStopLatLon(map);
		List<BusStopDTO> bsList= dao.getAllBusStop(map);
		List<CurrBusLocationDTO> cblList = dao.getCurrBusLocation(map);
		
		UniversityDTO unidto = dao.getUniversityArea(universitySeq);
		
		request.setAttribute("cblList", cblList);
		request.setAttribute("avgBSdto", avgBSdto);
		request.setAttribute("unidto", unidto);
		request.setAttribute("bsList", bsList);
		
		return "getBusStopLocation";
	}
}
