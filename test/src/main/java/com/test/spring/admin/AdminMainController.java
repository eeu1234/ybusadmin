package com.test.spring.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("adminMainController")
public class AdminMainController {
	
	//로그인 성공 시 관리자 메인 화면으로 이동
	@RequestMapping(method = {RequestMethod.GET},
						value = "/admin/adminmain.action")
	public String adminmain(HttpServletRequest request){
		
		
		return "admin/adminmain";
	}
	
	//관리자 메인 화면에서 로그아웃
	@RequestMapping(method = {RequestMethod.GET},
						value = "/admin/adminlogout.action")
	public String adminlogout(HttpServletRequest request,
								HttpSession session){
		
		session.invalidate();
		
		return "admin/adminlogout";
		
	}	
	
}
