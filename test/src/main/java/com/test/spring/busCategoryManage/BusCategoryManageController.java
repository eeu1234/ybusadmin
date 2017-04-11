package com.test.spring.busCategoryManage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.spring.dto.AdminUniversityDTO;
import com.test.spring.dto.BusCategoryInfoDTO;
import com.test.spring.dto.BusStopCategoryDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;

@Controller("busCategoryManageController")
public class BusCategoryManageController {

	@Autowired
	private BusCategoryManageDAO dao;
	
	
	//버스와 대분류,중분류를 매칭시켜주는 페이지
	@RequestMapping(method = { RequestMethod.GET }, value = "/busCategoryManage/busCategoryManage.action")
	public String busCategoryManage(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		
		AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
		
		//버스정보가 show인 모든 리스트를 가져온다(세션에 있는 대학교 seq를 이용하여)
		List<BusCategoryInfoDTO> busInfo = dao.getShowBusInfo(adto.getUniversitySeq());
		
		
		request.setAttribute("busInfo", busInfo);
		
		
		
		return "busCategoryManage/busCategoryManage";

	}
	
	//버스 매핑 수정 페이지
	@RequestMapping(method = { RequestMethod.GET }, value = "/busCategoryManage/updateBusCategoryManage.action")
	public String updateBusCategoryManage(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		
		AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
		//넘어온 버스 인포 seq
		String seq = request.getParameter("seq");
		
		//버스정보가 show인 모든 리스트를 가져온다(세션에 있는 대학교 seq를 이용하여)
		BusCategoryInfoDTO busInfo = dao.getBusInfo(seq);
		
		// 버스 종류 가져오기
		List<BusStopCategoryDTO> busStopCategory = dao.busStopCategory(adto.getUniversitySeq());
		
		
		request.setAttribute("busInfo", busInfo);
		request.setAttribute("busStopCategory", busStopCategory);
		
		
		return "busCategoryManage/updateBusCategoryManage";

	}
	
	//중분류 가져오는 AJAX
	@RequestMapping(method = { RequestMethod.GET }, value = "/busCategoryManage/detailCategory.action")
	public String DetailCategory(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		
		//넘어온 대분류 seq
		String seq = request.getParameter("seq");
		
		//대분류 SEQ를 이용하여 중분류 리스트를가져온다
		List<BusStopDetailCategoryDTO> detailCategory = dao.getDetailCategory(seq);
		
		
		
		request.setAttribute("detailCategory", detailCategory);
		
		
		return "busCategoryManage/detailCategory";

	}
	
	//매핑결과 수정하기
	@RequestMapping(method = { RequestMethod.GET }, value = "/busCategoryManage/updateBusCategory.action")
	public String updateBusCategory(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		
		//넘어온 대분류,중분류 seq
		String seq = request.getParameter("seq");
		String busCategorySel = request.getParameter("busCategorySel");
		String busDetailCategorySel = request.getParameter("busDetailCategorySel");
		
		
		System.out.println("busCategorySel"+busCategorySel);
		System.out.println("busDetailCategorySel"+busDetailCategorySel);
		//버스인포 테이블에 대분류,중분류 seq수정하기
		int updateResult = dao.updateBusCategory(seq,busCategorySel,busDetailCategorySel);
		
		
		
		request.setAttribute("updateResult", updateResult);
		
		
		return "busCategoryManage/updateBusCategoryOK";

	}
	

}
