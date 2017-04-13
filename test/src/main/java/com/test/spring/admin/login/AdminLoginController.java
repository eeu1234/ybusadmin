package com.test.spring.admin.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.spring.dto.AdminUniversityDTO;

@Controller("adminLoginController")
public class AdminLoginController {

	@Autowired
	private AdminLoginDAO dao;
	
	//로그인 화면
	@RequestMapping(method = {RequestMethod.GET}, value="/admin/adminLogin.action")
	public String loginView(HttpServletRequest request,HttpSession session,HttpServletResponse response){
			
		
		
		return "admin/adminLogin";
	}
	

	//로그인 하기 - try catch 안해도 됨. 실패하면 adminLoginOk 에서 로그인창으로 돌아옴
	@RequestMapping(method = {RequestMethod.POST}, value="/admin/adminLoginOk.action")
	public String loginCheck(HttpServletRequest request,HttpSession session,HttpServletResponse response){
		
		
		String id = request.getParameter("id");
		String password = request.getParameter("pw");
		session = request.getSession();
		
		AdminUniversityDTO adto= new AdminUniversityDTO();
		
		adto.setAdminID(id);
		adto.setAdminPassword(password);
		
		adto= dao.checkAdmin(adto); 
		request.setAttribute("result", 0);
		
		if(adto !=null){
			session.setAttribute("adto",adto);
						
			//일반 사용자가 로그인했다고 알리기 위해 구분 속성 추가
			request.setAttribute("result", 1);
			
		}

		
		return "admin/adminLoginOk";
	}
	
	
}
