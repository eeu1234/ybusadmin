package com.test.spring.admin.detailcategory;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.spring.dto.AdminUniversityDTO;
import com.test.spring.dto.BusStopCategoryDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;

@Controller("adminDetailCategoryController")
public class AdminDetailCategoryController {

	@Autowired
	private AdminDetailCategoryDAO dao;
	
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/detailCategory/adminDetailCategory.action")
	public String adminDetailCategory(HttpServletRequest request,HttpSession session) {
		
		AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
		
		//카테고리에 버스 종류 출력
		List<BusStopCategoryDTO> categoryList = dao.categoryList(adto.getUniversitySeq());
		
		//show인 세부분류 리스트 가져오기
		List<BusStopDetailCategoryDTO> showDetailCategoryList = dao.showDetailCategoryList(adto.getUniversitySeq());
		
		//hide인 세부분류 리스트 가져오기
		List<BusStopDetailCategoryDTO> hideDetailCategoryList = dao.hideDetailCategoryList(adto.getUniversitySeq());
		
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("showDetailCategoryList", showDetailCategoryList);
		request.setAttribute("hideDetailCategoryList", hideDetailCategoryList);
		
		return "admin/detailCategory/adminDetailCategory";

	}
	
	
	
	//카테고리 추가 페이지
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/detailCategory/addDetailCategory.action")
	public String addDetailCategory(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		
		AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
		
		//카테고리에 버스 종류 출력
		List<BusStopCategoryDTO> categoryList = dao.categoryList(adto.getUniversitySeq());
		
		
		request.setAttribute("categoryList", categoryList);
		
		return "admin/detailCategory/addDetailCategory";

	}
	
	//카테고리 추가 처리 페이지
	@RequestMapping(method = { RequestMethod.POST }, value = "/admin/detailCategory/addDetailCategoryOK.action")
	public String addDetailCategoryOK(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		
		//입력한 값들 dto로 묶기
		String categorySel = request.getParameter("categorySel");
		String detailCategoryName = request.getParameter("detailCategoryName");
		String interverTime = request.getParameter("interverTime");
		String interverDistance = request.getParameter("interverDistance");
		String stat = request.getParameter("stat");
		
		BusStopDetailCategoryDTO dto = new BusStopDetailCategoryDTO();
		dto.setBusStopCategorySeq(categorySel);
		dto.setBusStopDetailCategoryName(detailCategoryName);
		dto.setBusStopDetailCategoryInterval(interverTime);
		dto.setBusStopDetailCategoryIntervalDistance(interverDistance);
		dto.setBusStopDetailCategoryStat(stat);
		//insert쿼리
		int result = dao.addDetailCategory(dto);
		
		
		request.setAttribute("result", result);
		
		return "admin/detailCategory/addDetailCategoryOK";

	}
	
	//카테고리 수정 페이지
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/detailCategory/updateDetailCategory.action")
	public String updateDetailCategory(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		
		AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
		
		//세부분류 seq를 받아서 컬럼값들을 받아온다
		String seq = request.getParameter("seq");
		
		BusStopDetailCategoryDTO getDetailCategory = new BusStopDetailCategoryDTO();
		
		getDetailCategory = dao.getDetailcategory(seq);
		
		//카테고리에 버스 종류 출력
		List<BusStopCategoryDTO> categoryList = dao.categoryList(adto.getUniversitySeq());
		
		request.setAttribute("categoryList", categoryList);
		
		request.setAttribute("getDetailCategory",getDetailCategory);
		request.setAttribute("categoryList", categoryList);
		
		return "admin/detailCategory/updateDetailCategory";

	}
	
	//카테고리 수정 처리페이지
	@RequestMapping(method = { RequestMethod.POST }, value = "/admin/detailCategory/updateDetailCategoryOK.action")
	public String updateDetailCategoryOK(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		
		//수정한 값들을 받아온다
		String seq = request.getParameter("seq");
		String categorySel = request.getParameter("categorySel");
		String detailCategoryName = request.getParameter("detailCategoryName");
		String interverTime = request.getParameter("interverTime");
		String interverDistance = request.getParameter("interverDistance");
		String stat = request.getParameter("stat");
		
		//수정할값들을 넣을 DTO
		BusStopDetailCategoryDTO updateDetailCategory = new BusStopDetailCategoryDTO();
		
		updateDetailCategory.setBusStopDetailCategorySeq(seq);
		updateDetailCategory.setBusStopCategorySeq(categorySel);
		updateDetailCategory.setBusStopDetailCategoryName(detailCategoryName);
		updateDetailCategory.setBusStopDetailCategoryInterval(interverTime);
		updateDetailCategory.setBusStopDetailCategoryIntervalDistance(interverDistance);
		updateDetailCategory.setBusStopDetailCategoryStat(stat);
		
		int result = dao.updateDetailCategory(updateDetailCategory);
		
		request.setAttribute("result", result);
		
		return "admin/detailCategory/updateDetailCategoryOK";

	}
	
	//카테고리 삭제 페이지
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/detailCategory/deleteDetailCategory.action")
	@Transactional
	public String deleteDetailCategory(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		
		//클릭한 seq를 가져온다
		String seq = request.getParameter("seq");
		
			
		//클릭한 카테고리를 삭제한다
		int result = dao.deleteDetailCategory(seq);
		
		request.setAttribute("result", result);
		
		
		
		return "admin/detailCategory/deleteDetailCategoryOK";

	}
}
