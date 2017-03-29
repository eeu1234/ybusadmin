package com.test.spring.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.spring.DTO.AdminDTO;

@Controller("adminManageController")
public class AdminManageController {
	
	@Autowired
	private AdminDAO dao;
	
	//admin 관리 메인 페이지로 이동, 모든 대학 관리자 내역 가져옴
	@RequestMapping(method={RequestMethod.GET}
					, value="/admin/adminmanage.action")
	public String adminmanage(HttpServletRequest request
								,HttpSession session){
		
		List<AdminDTO> alist = dao.alist();
		
		request.setAttribute("alist", alist);
		
		return "admin/adminmanage";
	}
	
	//admin 계정 생성 시 대학 카테고리 가져오기
	@RequestMapping(method={RequestMethod.GET}
		, value="/admin/getUniversityList.action")
	public String getUniversityList(HttpServletRequest request
					,HttpSession session){
		
		List<AdminDTO> alist = dao.alist();
		
		request.setAttribute("alist", alist);
		
		return "admin/adminmanage";
	}
	
}
