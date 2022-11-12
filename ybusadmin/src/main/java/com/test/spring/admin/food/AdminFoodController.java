package com.test.spring.admin.food;

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
import com.test.spring.dto.UniversityDTO;
import com.test.spring.admin.food.AdminFoodDAO;


@Controller("adminFoodController")
public class AdminFoodController {

	@RequestMapping(method = {RequestMethod.GET}, value = "/admin/adminFoodList.action")
	public String adminMain(HttpServletRequest request,HttpSession session,HttpServletResponse response){
	
		return "/admin/adminFoodList";
	}
	
	
	
}
