package com.test.spring.admin.food;

import java.util.ArrayList;
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
import com.test.spring.dto.BusCategoryInfoDTO;
import com.test.spring.dto.FoodDTO;
import com.test.spring.dto.NoticeDTO;
import com.test.spring.dto.SearchDTO;
import com.test.spring.dto.UniversityDTO;
import com.test.spring.admin.busSchedule.AdminBusScheduleDAO;
import com.test.spring.admin.food.AdminFoodDAO;


@Controller("adminFoodController")
public class AdminFoodController {
	

	@Autowired
	private AdminFoodDAO dao;
	
	
	@RequestMapping(method = {RequestMethod.GET}, value = "/admin/adminFoodLocationSelect.action")
	public String locationSelect(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		return "food/adminFoodLocationSelectView";
	}
	

	@RequestMapping(method = {RequestMethod.GET}, value = "/admin/adminFoodList.action")
	public String adminFood(HttpServletRequest request,HttpSession session,HttpServletResponse response, String menuLocation){
		System.out.println("Location" + menuLocation);
		
		
		try {
			AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
			
			List<FoodDTO> foodInfo = dao.foodList(menuLocation);
			
			session.setAttribute("foodInfo", foodInfo);

			
			return "food/adminFoodList";
	         
	      } catch (Exception e) {
	         session.invalidate();

	         try {
	            
	            response.sendRedirect("/spring/admin/adminLogin.action");

	         } catch (Exception e2) {
	            // TODO: handle exception

	         }
	         return null;
	      }
		
		
	
		
	}
	
	@RequestMapping(method = {RequestMethod.GET}, value = "/admin/adminFoodDetail.action")
	public String adminFoodDetail(HttpServletRequest request,HttpSession session,HttpServletResponse response, String menuLocation, String date) {
		
		
		try {
			
			AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
			

			List<List<FoodDTO>> foodInfo = new ArrayList<List<FoodDTO>>();
			
			for (int i = 0; i < 5; i++) {
				foodInfo.add(dao.getFoodListByWeek(menuLocation, date, Integer.toString(i)));
			}
			
			System.out.println(foodInfo);
			request.setAttribute("foodInfo", foodInfo);

			return "food/adminFoodDetailView";
	         
	      } catch (Exception e) {
	         session.invalidate();

	         try {
	            
	            response.sendRedirect("/spring/admin/adminLogin.action");

	         } catch (Exception e2) {
	            // TODO: handle exception

	         }
	         return null;
	      }
		
		
	}
	
	// 학식정보 수정
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/adminFoodUpdate.action")
	@Transactional
	public String adminFoodUpadte(HttpServletRequest request, HttpSession session, HttpServletResponse response, String menuLocation, String date) {
	   try {

	    	 AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
				

			List<List<FoodDTO>> foodInfo = new ArrayList<List<FoodDTO>>();
				
			for (int i = 0; i < 5; i++) {
				foodInfo.add(dao.getFoodListByWeek(menuLocation, date, Integer.toString(i)));
			}
				
			System.out.println(foodInfo);
			request.setAttribute("foodInfo", foodInfo);


	         return "food/adminFoodUpdate";
	      } catch (Exception e) {
	         session.invalidate();

	         try {

	            response.sendRedirect("/spring/admin/adminLogin.action");

	         } catch (Exception e2) {
	            // TODO: handle exception

	         }
	         return null;
	      }

	   }
	   
	   @RequestMapping(method = {RequestMethod.GET}, value = "/admin/adminFoodUpdateCheck.action")
		public String adminFoodUpdateCheck(HttpServletRequest request,HttpSession session,HttpServletResponse response, 
				String[] date, String menuLocation, String menuCorner, String menu1, String menu2, String menu3, String menu4, String menu5) {
			
			
			try {
				
				AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
				
				for (int i = 0; i < 5; i++) {
					System.out.println(date[i]);
				}
				
		        
		       
				return "food/adminFoodUpdateOk";
		      } catch (Exception e) {
		         session.invalidate();

		         try {
		            
		            response.sendRedirect("/spring/admin/adminLogin.action");

		         } catch (Exception e2) {
		            // TODO: handle exception

		         }
		         return null;
		      }
			
			
		}
	
	
	
}
