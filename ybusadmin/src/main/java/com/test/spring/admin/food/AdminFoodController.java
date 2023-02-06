package com.test.spring.admin.food;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.json.JSONObject;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	

	@RequestMapping(method = {RequestMethod.GET}, value = "/admin/adminFoodDetail.action")
	public String adminFoodDetail(HttpServletRequest request,HttpSession session,HttpServletResponse response, String date, String menuLocation) {
		
		
		try {
			AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
			
			Calendar cal = Calendar.getInstance();
			DateFormat df = new SimpleDateFormat("yyyy-M-dd");
			Date newDate = df.parse(date);
	        cal.setTime(newDate);
	        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	        while (dayOfWeek != 2) {
	        	cal.add(Calendar.DATE, -1);
	        	dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	        }
	        date = df.format(cal.getTime());

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
	
	// 학식정보 추가
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/adminFoodInsert.action")
	@Transactional
	public String adminFoodInsert(HttpServletRequest request, HttpSession session, HttpServletResponse response, String menuLocation, String date) {
	   try {

	    	 AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
	    	 			

	         return "food/adminFoodInsert";
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
	
	@RequestMapping(method = {RequestMethod.GET}, value = "/admin/adminFoodInsertCheck.action")
	public String adminFoodInsertCheck(HttpServletRequest request,HttpSession session,HttpServletResponse response, 
			String[] date,
			String[] menuCorner,
			String[] menuLocation,
			String[] menu1,
			String[] menu2,
			String[] menu3,
			String[] menu4,
			String[] menu5 ) {
		
		
		try {
			
			AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
			
			for (int i = 0; i < 20; i++) {
				int result = dao.foodInsert(date[i], menuCorner[i], menuLocation[i]
						, menu1[i]
						, menu2[i]
						, menu3[i]
						, menu4[i]
						, menu5[i]);
			      
		         request.setAttribute("result", result);
			}
			
	        
	       
			return "food/adminFoodInsertOk";
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
				String[] date,
				String[] menuCorner,
				String[] menuLocation,
				String[] menu1,
				String[] menu2,
				String[] menu3,
				String[] menu4,
				String[] menu5 ) {
			
			
			try {
				
				AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
				
				for (int i = 0; i < 20; i++) {
					int result = dao.foodUpdate(date[i], menuCorner[i], menuLocation[i]
							, menu1[i]
							, menu2[i]
							, menu3[i]
							, menu4[i]
							, menu5[i]);
				      
			         request.setAttribute("result", result);
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
	   
	   // 자동완성
	   @RequestMapping(method = {RequestMethod.GET}, value = "/admin/wordSearchShow.action", produces="application/json; charset=utf8")
		public void wordSearchShow(HttpServletRequest request, HttpSession session, HttpServletResponse response, String value) throws IOException {
		   
		   HashSet<String> resultList = new HashSet<String>();
		   for (int i = 1; i < 6; i++) {
			   List<FoodDTO> foodList = dao.wordSearchShow(value, "menu"+Integer.toString(i));
			   if (foodList.size() != 0) {
				   if (i == 1) {
					   for(FoodDTO food : foodList) {
							String str = food.getMenu1();
							resultList.add(str);
						}
				   } else if (i == 2) {
					   for(FoodDTO food : foodList) {
							String str = food.getMenu2();
							resultList.add(str);
						}
				   } else if (i == 3) {
					   for(FoodDTO food : foodList) {
							String str = food.getMenu3();
							resultList.add(str);
						}
				   } else if (i == 4) {
					   for(FoodDTO food : foodList) {
							String str = food.getMenu4();
							resultList.add(str);
						}
				   } else if (i == 5) {
					   for(FoodDTO food : foodList) {
							String str = food.getMenu5();
							resultList.add(str);
						}
				   }
				   
			   }
		   }
			
			JSONArray jsonArr = new JSONArray();
			JSONObject jsonObj = null; 
			
			if (resultList != null) {
				for(String string : resultList) {
					jsonObj = new JSONObject();
					jsonObj.put("value", string);
					jsonArr.add(jsonObj);
				}
			}
			
			System.out.println(jsonArr.toString());
			
			response.setCharacterEncoding("UTF-8");
		    PrintWriter pw = response.getWriter(); 
		    pw.print(jsonArr); 
		    pw.flush(); 
		    pw.close();
			
		}
	   
	
	
	
}
