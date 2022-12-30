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
		
//		try {
//
//	         // 내용
//
//	         // 페이징 -> 게시판의 꽃
//	         int nowPage = 0; // 현재 페이지 번호
//	         int totalCount = 0; // 총 게시물 수
//	         int pageSize = 10; // 한 페이지에 보여줄 게시물 수(LIMIT의 2번째 인자값사용?)
//	         int totalPage = 0; // 총 페이지 수
//	         int start = 0; // LIMIT 조건에 사용될 시작값
//
//	         int n = 0, loop = 0; // 페이지바에 사용
//	         int blockSize = 10;
//
//	         if (page == null) {
//	            nowPage = 1; // 그냥 들어오면 무조건 첫페이지를 보여주자.
//	         } else {
//	            nowPage = Integer.parseInt(page);
//	         }
//
//	         // nowPage -> start 범위 계산
//	         // 1page -> 0, 10(LIMIT)
//	         // 2page -> 10, 10
//	         start = ((nowPage - 1) * pageSize);
//	         // dto 에 시작값 넣기
//	         sdto.setStart(start);
//
//	         // 검색했는지 확인
//	         String column = sdto.getColumn();
//	         String word = sdto.getWord();
//	         // System.out.println("컬럼 : "+column+" 워드 : "+word);
//
//	         // 페이징 때문에 검색이 없으면 null 로 넘어감.
//	         if ((column != null && word != null) && (!column.equals("null") && !word.equals("null"))) {
//
//	            String where = String.format("WHERE %s like '%%%s%%'", column, word);
//	            sdto.setWhereWord(where);
//
//	         }
//
//	         // 페이징 하기위한 토탈 수
//	         totalCount = dao.getTotal(sdto);
//	         totalPage = (int) Math.ceil((double) totalCount / pageSize);
//
//	         // 검색+시작값 DTO 넘김(****)
//	         List<FoodDTO> foodList = dao.foodList(sdto);
//
//	         // 페이지바 만들기
//	         String pageBar = "";
//
//	         loop = 1; // 페이지 번호를 만드는 루프 담당
//	         n = ((nowPage - 1) / blockSize) * blockSize + 1; // 페이지 번호 역할(시작 번호)
//
//	         pageBar += "<nav><ul class='pagination'>";
//	         if (n == 1) {
//	            pageBar += String.format(
//	                  "<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
//	         } else {
//	            pageBar += String.format(
//	                  "<li><a href='/spring/admin/notice/notice.action?page=%d&column=%s&word=%s' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>",
//	                  n - 1, column, word);
//	         }
//
//	         while (!(loop > blockSize || n > totalPage)) {
//	            // 현재 보고 있는 페이지?
//	            if (n == nowPage) {
//	               pageBar += String.format("<li class='active'><a href='#'>%d</a></li>", n);
//	            } else {
//	               pageBar += String.format(
//	                     "<li><a href='/spring/admin/notice/notice.action?page=%d&column=%s&word=%s'>%d</a></li>", n,
//	                     column, word, n);
//	            }
//
//	            n++;
//	            loop++;
//
//	         } // 페이지 번호 while
//
//	         if (n > totalPage) {
//	            pageBar += String.format(
//	                  "<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
//	         } else {
//	            pageBar += String.format(
//	                  "<li><a href='/spring/admin/notice/notice.action?page=%d&column=%s&word=%s' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>",
//	                  n, column, word);
//	         }
//
//	         pageBar += "</ul></nav>";
//
//	         request.setAttribute("foodList", foodList);
//	         request.setAttribute("sdto", sdto);
//	         request.setAttribute("pageBar", pageBar);
//
//	         // readcount 초기화!
//	         session.setAttribute("readcount", "n");
//
//	         return "admin/food/adminFoodList";
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
	public String adminFoodDetail(HttpServletRequest request,HttpSession session,HttpServletResponse response, String date) {
		
		
		AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
		System.out.println(date);
		List<FoodDTO> foodInfo = dao.getFoodListByDate(date);
		
		
		request.setAttribute("foodInfo", foodInfo);

		return "food/adminFoodDetailView";
		
		
//		try {
//			AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
//			
//			List<FoodDTO> foodInfo = dao.getFoodListByDate(date);
//			System.out.println(date);
//			
//			request.setAttribute("foodInfo", foodInfo);
//
//			return "food/adminFoodDetailView";
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
		
		
	}
	
//		// 학식정보 추가하기
//	   @RequestMapping(method = { RequestMethod.GET }, value = "/admin/notice/noticeAdd.action")
//	   @Transactional
//	   public String noticeAdd(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
//	      try {
//
//	         // 내용
//
//	         return "admin/notice/noticeAdd";
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
//
//	   }
	
	
	
}
