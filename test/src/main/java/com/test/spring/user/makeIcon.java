package com.test.spring.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("makeIcon")
public class makeIcon {
	
	@RequestMapping(method={RequestMethod.GET},value="/user/makeIcon.action")
	public String makeIcon(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		
		
		
		return "user/makeIcon";
	}
	
}
