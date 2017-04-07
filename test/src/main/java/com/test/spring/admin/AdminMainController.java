package com.test.spring.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.spring.dto.AdminUniversityDTO;
import com.test.spring.dto.UniversityDTO;

@Controller("adminMainController")
public class AdminMainController {
	
	@Autowired
	private AdminDAO dao;

	
	//로그인 성공 시 관리자 메인 화면으로 이동
	@RequestMapping(method = {RequestMethod.GET},
						value = "/admin/adminMain.action")
	public String adminMain(HttpServletRequest request,HttpSession session,HttpServletResponse response){
	
		//메인 화면 최고 관리자 학교 설정
		AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
	
		List<UniversityDTO> university = dao.list();
		
		request.setAttribute("university", university);
	
		return "admin/adminMain";
	}
	
	//최고관리자가 대학교를 바꿨을때 대학교 seq, 대학교명이 세션값으로 넘어감
	@RequestMapping(method = {RequestMethod.POST, RequestMethod.GET},
						value = "/admin/adminMain1.action")
	public String adminMain1(HttpServletRequest request,HttpSession session,HttpServletResponse response){
		
		AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
				
		//대학seq,대학이름 담겨있음(,구분)
		String schoolName = request.getParameter("schoolName");
		String temp[]  = schoolName.split(",");
		
		System.out.println(temp[0]);
		System.out.println(temp[1]);
		
		
		adto.setUniversitySeq(temp[0]);
		adto.setUniversityName(temp[1]);
		
		session.setAttribute("adto", adto);
		
		//대학교 셀렉박스 유지
		List<UniversityDTO> university = dao.list();
		request.setAttribute("university", university);
		
		//session.setAttribute("universitySeq", universitySeq);
		
		return "admin/adminMain";
	}
	
	//관리자 메인 화면에서 로그아웃
	@RequestMapping(method = {RequestMethod.GET},
						value = "/admin/adminLogOut.action")
	public String adminLogout(HttpServletRequest request,HttpSession session,HttpServletResponse response){
		
		session.invalidate();
		
		return "admin/adminLogOut";
		
	}	
	
}
