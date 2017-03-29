package com.test.spring.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.spring.DTO.AdminDTO;

@Controller("adminLoginController")
public class AdminLoginController {

	@Autowired
	private AdminLoginDAO dao;
	
	//로그인 화면
	@RequestMapping(method = {RequestMethod.GET}, value="/admin/adminlogin.action")
	public String loginView(HttpServletRequest request){
		
		
		
		return "admin/adminlogin";
	}
	

	//로그인 하기
	@RequestMapping(method = {RequestMethod.POST}, value="/admin/adminloginok.action")
	public String loginCheck(HttpServletRequest request, HttpSession session){
		
		
		String id = request.getParameter("id");
		String password = request.getParameter("pw");
		session = request.getSession();
		
		
		AdminDTO dto= new AdminDTO();
		
		dto.setAdminID(id);
		dto.setAdminPassword(password);
		
		dto= dao.checkAdmin(dto); 
		request.setAttribute("result", 0);
		
		if(dto !=null){
			session.setAttribute("adminID",dto.getAdminID());
			session.setAttribute("adminLevel", dto.getAdminLevel());
			session.setAttribute("universitySeq", dto.getUniversitySeq());
			
			//일반 사용자가 로그인했다고 알리기 위해 구분 속성 추가
			request.setAttribute("result", 1);
			
		}
		
		//System.out.println(dto.getAdminID());
		//System.out.println(dto.getUniversitySeq());

		
		return "admin/adminloginok";
	}
	
	
}
