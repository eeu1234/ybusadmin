package com.test.spring.admin.busSchedule;

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

import com.test.spring.dto.AdminDTO;
import com.test.spring.dto.AdminUniversityDTO;
import com.test.spring.dto.BusScheduleDTO;
import com.test.spring.dto.BusScheduleSearchDTO;
import com.test.spring.dto.BusStopCategoryDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;

@Controller("adminBusScheduleManage")
public class AdminBusScheduleManage {

	@Autowired
	private AdminBusScheduleDAO dao;
	
	//관리자용
	//기본 버스시간관리 메인 화면, CRUD 하는 곳
	@RequestMapping(method={RequestMethod.GET}
					, value="/admin/adminBusTimeManage.action")
	public String timeTable(HttpServletRequest request
							,HttpSession session
							,HttpServletResponse response
							,BusScheduleSearchDTO SearchDto){	
		
		try{
			AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
			
			//학교 seq 가져오기
			String universitySeq = adto.getUniversitySeq();
			
			//해당 학교 버스카테고리 가져오기
			List<BusStopCategoryDTO> blist = getCategory(universitySeq);
			
			//기본적으로 첫번째 버스카테고리의 디테일노선 가져오기
			List<BusStopDetailCategoryDTO> dlist = new ArrayList<BusStopDetailCategoryDTO>();
			
			BusScheduleSearchDTO Search = new BusScheduleSearchDTO();
			//만약 blist가 없으면 그냥 리턴해주자
			  if(blist.size() == 0){
			     request.setAttribute("blist", blist);
			     return "admin/adminNotBusTimeManage";
			  }else{
			     Search.setBusStopCategorySeq(blist.get(0).getBusStopCategorySeq());
			  }

			//만약 넘어온 SearchDto가 없으면 기본값을 넣어준다.
			if(SearchDto == null || SearchDto.getBusStopDetailCategorySeq() == null || SearchDto.getBusStopDetailCategorySeq().equals("") || SearchDto.getBusStopCategorySeq() == null || SearchDto.getBusStopCategorySeq().equals("")){
				
				dlist = getDetailCategory(blist.get(0).getBusStopCategorySeq());
				
				if(dlist.size() == 0){
				     request.setAttribute("blist", blist);
				     request.setAttribute("detail", "0");
				     return "admin/adminBusTimeManage";
				}else{
				     Search.setBusStopCategorySeq(blist.get(0).getBusStopCategorySeq());
				     Search.setBusStopDetailCategorySeq(dlist.get(0).getBusStopDetailCategorySeq());
				}
				
				
				//기본적으로 평일 normal 값 넣어주고 보내준다.
				
				//System.out.println("1");
				Search.setWeekDays("normal");
				List<BusScheduleDTO> slist = getBusSchedule(Search);
				request.setAttribute("slist", slist);
				
			}else{
				
				dlist = getDetailCategory(SearchDto.getBusStopCategorySeq());
				List<BusScheduleDTO> slist = getBusSchedule(SearchDto);
				request.setAttribute("slist", slist);
			}
			//기본적으로 평일/주말 중에서 평일만 출력

		    request.setAttribute("detail", "1");
			request.setAttribute("blist", blist);
			request.setAttribute("dlist", dlist);
			request.setAttribute("Search", SearchDto);
			
			return "admin/adminBusTimeManage";
		} catch (Exception e) {
			session.invalidate();

			try {
				response.sendRedirect("/spring/admin/adminLogin.action");
				
			} catch (Exception e2) {
				
			}
			return null;
		}
		
	}
	
	//버스시간표 추가하는 메서드
	@RequestMapping(method={RequestMethod.POST, RequestMethod.GET}
					, value="/admin/adminAddSchedule.action")
	@Transactional
	public String addSchedule(HttpServletRequest request
							,HttpSession session
							,HttpServletResponse response
							,BusScheduleDTO dto
							,BusScheduleSearchDTO Search){
		try{
			String hour[] = request.getParameterValues("hour");
			String minute[] = request.getParameterValues("minute");
			String course[] = request.getParameterValues("courseName");
			int result = 0;
			for(int i=0;i<hour.length;i++){
				String busTime = String.format("%s:%s", hour[i], minute[i]);
				dto.setBusTime(busTime);
				dto.setCourseName(course[i]);
				//추가하자
				result = dao.addSchedule(dto);
			}
			
			request.setAttribute("result", result);
			request.setAttribute("Search", Search);
			
			return "admin/adminAddScheduleOk";
		} catch (Exception e) {
			session.invalidate();

			try {
				            
				response.sendRedirect("/spring/admin/adminLogin.action");
				
			} catch (Exception e2) {
				
			}
			return null;
		}
	}
	
	//버스시간표 삭제하는 메서드
	@RequestMapping(method={RequestMethod.POST, RequestMethod.GET}
					, value="/admin/adminDeleteSchedule.action")
	@Transactional
	public String deleteSchedule(HttpServletRequest request
							,HttpSession session
							,HttpServletResponse response				
							,String[] busScheduleSeq
							,BusScheduleSearchDTO Search){
		try{
			//삭제하자
			int result = 0;
			//삭제 횟수
			int count = 0;
			
			//가져온 배열 수 만큼 forEach 로 삭제 실행
			for(String seq : busScheduleSeq){
				//delete 실행
				dao.deleteSchedule(seq);
				//삭제 횟수 증가
				count++;
			}
			
			//삭제 횟수와 넘겨받은 배열길이가 동일하면 result = 1
			if(count == busScheduleSeq.length){
				result = 1;
			}
			
			request.setAttribute("result", result);
			request.setAttribute("Search", Search);
			
			return "admin/adminDeleteScheduleOk";
		} catch (Exception e) {
			session.invalidate();

			try {
				            
				response.sendRedirect("/spring/admin/adminLogin.action");
				
				} catch (Exception e2) {
				
				}
			return null;
		}
	}
	
	//학교 노선 소분류 가져오는 ajax
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }
							, value = "/admin/adminGetDetailCategory.action")
	public String adminGetDetailCategory(HttpServletRequest request
										,HttpSession session
										,HttpServletResponse response
										,String busStopCategorySeq) {
		try{
			
			request.setAttribute("detail", getDetailCategory(busStopCategorySeq));
			
			return "admin/adminGetDetailCategory";
		} catch (Exception e) {
			session.invalidate();

			try {
				            
				response.sendRedirect("/spring/admin/adminLogin.action");
				
				} catch (Exception e2) {
				
				}
			return null;
		}
	}
	
	//노선 시간표 분류 가져오는 ajax
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET },
							value = "/admin/adminGetBusSchedule.action")
	public String adminGetBusSchedule(HttpServletRequest request
									,HttpSession session
									,HttpServletResponse response
									,BusScheduleSearchDTO Search) {
		try{
			request.setAttribute("time", getBusSchedule(Search));
			
			return "admin/adminGetBusSchedule";
		} catch (Exception e) {
			session.invalidate();

			try {
				            
				response.sendRedirect("/spring/admin/adminLogin.action");
				
				} catch (Exception e2) {
				
				}
			return null;
		}
	}
	
	
	
	
	//==============================================================
	//학교 노선 대분류 가져오는 메서드
	public List<BusStopCategoryDTO> getCategory(String universitySeq){
		return dao.getCategoryList(universitySeq);
	}
	//학교 노선 소분류 가져오는 메서드
	public List<BusStopDetailCategoryDTO> getDetailCategory(String BusStopCategorySeq){
		return dao.getDetailCategoryList(BusStopCategorySeq);
	}
	//노선 시간표 가져오는 메서드
	public List<BusScheduleDTO> getBusSchedule(BusScheduleSearchDTO search){
		
		return dao.getBusSchedule(search);
	}
	//==============================================================
	
}














