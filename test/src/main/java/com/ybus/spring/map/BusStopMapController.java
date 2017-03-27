package com.ybus.spring.map;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	//학교 번호를 받아서 학교의 위경도를 들고가서 지도의 중앙을 찾아줘야함.
	//정류장 번호를 받아서 정류장의 위경도 받아다가 지도에 마커 찍어줘야함.
	@RequestMapping(method={RequestMethod.GET},value="/getBusStop.action")
	public String getBusStop(HttpServletRequest request, HttpServletResponse response, String universitySeq,String busStopSeq){
		universitySeq = "1";
		busStopSeq="3";
		System.out.println(universitySeq);
		//테스트용 나중에 앞단으로 감.
		BusStopDTO bsdto= dao.busStop(busStopSeq);
		//학교 위경도 들고감
		UniversityDTO unidto = dao.getUniversityArea(universitySeq);
		
		
		request.setAttribute("unidto", unidto);
		request.setAttribute("bsdto", bsdto);
		
		return "getBusStop";
	}
	
	
}
