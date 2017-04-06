package com.test.spring.polyline;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.spring.dto.AdminUniversityDTO;
import com.test.spring.dto.BusInfoDTO;
import com.test.spring.dto.BusStopCategoryDTO;
import com.test.spring.dto.BusStopDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;
import com.test.spring.dto.LocationDTO;
import com.test.spring.dto.UniversityDTO;

@Controller("polyLineController")
public class PolyLineController {

	@Autowired
	private PolyLineDAO dao;

	// 메인페이지
	// 대학교 가져오기
		
		@RequestMapping(method = { RequestMethod.GET }, value = "/polyline/polyline.action")
		public String polyline(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
	
			
			
			return "polyline/polyline";
		}

	    //초기화
		@RequestMapping(method = { RequestMethod.POST }, value = "/polyline/polyline.action")
		public String reset(HttpServletRequest request,HttpSession session,HttpServletResponse response, String universityName) {

	
		return "polyline/polyline";

	}

	// MAP페이지
	// 대학교 가져오기
	@RequestMapping(method = { RequestMethod.GET }, value = "/polyline/universityMap.action")
	public String universityMap(HttpServletRequest request,HttpSession session,HttpServletResponse response, String seq) {

		List<UniversityDTO> universityMap = dao.universityMap(seq);

		request.setAttribute("universityMap", universityMap);

		return "polyline/universityMap";

	}

	// 버스 종류 가져오기
	@RequestMapping(method = { RequestMethod.GET }, value = "/polyline/busStopCategory.action")
	public String busStopCategory(HttpServletRequest request,HttpSession session,HttpServletResponse response, String seq) {

		List<BusStopCategoryDTO> busStopCategory = dao.busStopCategory(seq);

		request.setAttribute("busStopCategory", busStopCategory);

		return "polyline/busStopCategory";
	}

	// 노선 종류 가져오기
	@RequestMapping(method = { RequestMethod.GET }, value = "/polyline/busStopDetailCategory.action")
	public String busStopDetailCategory(HttpServletRequest request,HttpSession session,HttpServletResponse response, String seq) {

		List<BusStopDetailCategoryDTO> busStopDetailCategory = dao.busStopDetailCategory(seq);

		request.setAttribute("busStopDetailCategory", busStopDetailCategory);

		return "polyline/busStopDetailCategory";
	}

	// 버스 번호 가져오기
	@RequestMapping(method = { RequestMethod.GET }, value = "/polyline/busInfo.action")
	public String busInfo(HttpServletRequest request,HttpSession session,HttpServletResponse response, String seq) {

		List<BusInfoDTO> busInfo = dao.busInfo(seq);

		request.setAttribute("busInfo", busInfo);

		return "polyline/busInfo";
	}


	@RequestMapping(method = { RequestMethod.GET }, value = "/polyline/location.action")
	public String location(HttpServletRequest request,HttpSession session,HttpServletResponse response, String seq, String start, String end) {

		// 대학교 다시 가져오기
		List<UniversityDTO> university = dao.list();
		request.setAttribute("university", university);

		// 버스 정보 가져오기
		List<LocationDTO> location = dao.location(seq, start, end);

		request.setAttribute("location", location);

		return "polyline/location";
	}

	// 정류장 가져오기
	@RequestMapping(method = { RequestMethod.GET }, value = "/polyline/busStop.action")
	public String busStop(HttpServletRequest request,HttpSession session,HttpServletResponse response, String seq) {

		List<BusStopDTO> busStop = dao.busStop(seq);

		request.setAttribute("busStop", busStop);

		return "polyline/busStop";
	}

}