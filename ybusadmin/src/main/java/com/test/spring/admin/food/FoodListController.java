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
import com.test.spring.dto.FoodDTO;

@Controller("foodListController")
public class FoodListController {
	
	@Autowired
	private AdminFoodDAO dao;
	

	@RequestMapping(method = {RequestMethod.GET}, value = "/getFoodList.action")
	public String getFoodList(HttpServletRequest request,HttpSession session,HttpServletResponse response){
		
//		try {
//			AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
//			
//			List<FoodDTO> foodInfo = dao.foodList();
//			
//			request.setAttribute("foodInfo", foodInfo);
//
//			
//			
//	         
//	         
//	      } catch (Exception e) {
//	         session.invalidate();
//
//	         try {
//	            
//	            response.sendRedirect("/spring/admin/adminLogin.action");
//
//	         } catch (Exception e2) {
//	            // TODO: handle exception
//
//	         }
//	         return null;
//	      }
		
		
		
		return "user/getFoodList";
	
		
	}
	
	@RequestMapping(method = {RequestMethod.GET}, value = "/getFoodCornerList.action")
	public String getFoodCornerList(HttpServletRequest request,HttpSession session,HttpServletResponse response){
		
//		try {
//			AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
//			
//			List<FoodDTO> foodInfo = dao.foodList();
//			
//			request.setAttribute("foodInfo", foodInfo);
//
//			
//			
//	         
//	         
//	      } catch (Exception e) {
//	         session.invalidate();
//
//	         try {
//	            
//	            response.sendRedirect("/spring/admin/adminLogin.action");
//
//	         } catch (Exception e2) {
//	            // TODO: handle exception
//
//	         }
//	         return null;
//	      }
		
		
		
		return "user/getFoodCornerList";
	
		
	}

}
