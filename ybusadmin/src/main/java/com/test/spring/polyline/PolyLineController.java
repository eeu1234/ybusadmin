package com.test.spring.polyline;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.spring.dto.AdminUniversityDTO;
import com.test.spring.dto.BusInfoDTO;
import com.test.spring.dto.BusLogDTO;
import com.test.spring.dto.BusStopCategoryDTO;
import com.test.spring.dto.BusStopDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;
import com.test.spring.dto.LocationDTO;
import com.test.spring.dto.UniversityDTO;

@Controller("polyLineController")
public class PolyLineController {

	@Autowired
	private PolyLineDAO dao;

	// 메인페이지
	// 대학교 가져오기
	@RequestMapping(method = { RequestMethod.GET }, value = "/polyline/polyline.action")
	public String polyline(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		try {

			// 내용

			return "polyline/polyline";
			
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

	// 초기화
	@RequestMapping(method = { RequestMethod.POST }, value = "/polyline/polyline.action")
	public String reset(HttpServletRequest request, HttpSession session, HttpServletResponse response,
			String universityName) {
		try {

			// 내용
			return "polyline/polyline";

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

	// MAP페이지
	// 대학교 가져오기
	@RequestMapping(method = { RequestMethod.GET }, value = "/polyline/universityMap.action")
	public String universityMap(HttpServletRequest request, HttpSession session, HttpServletResponse response,
			String seq) {

		try {

			// 내용
			List<UniversityDTO> universityMap = dao.universityMap(seq);

			request.setAttribute("universityMap", universityMap);

			return "polyline/universityMap";
			
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

	// 버스 종류 가져오기
	@RequestMapping(method = { RequestMethod.GET }, value = "/polyline/busStopCategory.action")
	public String busStopCategory(HttpServletRequest request, HttpSession session, HttpServletResponse response,
			String seq) {
		try {

			// 내용
			List<BusStopCategoryDTO> busStopCategory = dao.busStopCategory(seq);

			request.setAttribute("busStopCategory", busStopCategory);

			return "polyline/busStopCategory";
			
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

	// 노선 종류 가져오기
	@RequestMapping(method = { RequestMethod.GET }, value = "/polyline/busStopDetailCategory.action")
	public String busStopDetailCategory(HttpServletRequest request, HttpSession session, HttpServletResponse response,
			String seq) {

		try {

			// 내용
			List<BusStopDetailCategoryDTO> busStopDetailCategory = dao.busStopDetailCategory(seq);

			request.setAttribute("busStopDetailCategory", busStopDetailCategory);

			return "polyline/busStopDetailCategory";

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

	// 버스 번호 가져오기
	@RequestMapping(method = { RequestMethod.GET }, value = "/polyline/busInfo.action")
	public String busInfo(HttpServletRequest request, HttpSession session, HttpServletResponse response, String seq) {

		try {

			// 내용
			List<BusInfoDTO> busInfo = dao.busInfo(seq);
	

			request.setAttribute("busInfo", busInfo);

			return "polyline/busInfo";
			
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


	@RequestMapping(method = { RequestMethod.GET }, value = "/polyline/location.action")
	public String location(HttpServletRequest request, HttpSession session, HttpServletResponse response, String seq,
			String start, String end) {

		try {

			// 내용
			// 대학교 다시 가져오기
			List<UniversityDTO> university = dao.list();
			request.setAttribute("university", university);
			
			
			SimpleDateFormat transFormatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date startFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(start);
			Date endFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(end);
			
			
			
			
		    // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
	        long diff = endFormat.getTime() - startFormat.getTime();
	        long diffDays = diff / (24 * 60 * 60 * 1000);
	 
	        System.out.println("날짜차이=" + diffDays);

	        //30일 까지만 조회가능
	        if(diffDays >30) {
	  	        	return "";
	        }

	
		
			Calendar monthStart = Calendar.getInstance();
			Calendar monthEnd = Calendar.getInstance();
			
			Calendar nowCalendar = Calendar.getInstance( );
			monthStart.setTime(startFormat);
			monthEnd.setTime(endFormat);
			System.out.println("현재 월: " + (nowCalendar.get(Calendar.MONTH) + 1));
		    System.out.println("현재 일: " +  nowCalendar.get(Calendar.DAY_OF_MONTH));
			

			
			start=  transFormatDate.format(monthStart.getTime());
			end=  transFormatDate.format(monthEnd.getTime());
			
				//월 형태 변형(01,02,03...)
				String sMonth = "";
				String eMonth = "";
				String nowMonth = "";
				if (monthStart.get(monthStart.MONTH)+1 < 10) {
				    sMonth = "0"+String.valueOf(monthStart.get(monthStart.MONTH)+1);
				} else {
				    sMonth = String.valueOf(monthStart.get(monthStart.MONTH)+1);
				}
				if (monthEnd.get(monthEnd.MONTH)+1 < 10) {
					eMonth = "0"+String.valueOf(monthEnd.get(monthEnd.MONTH)+1);
				} else {
					eMonth = String.valueOf(monthEnd.get(monthEnd.MONTH)+1);
				}
				if (nowCalendar.get(Calendar.MONTH)+1 < 10) {
					nowMonth = "0"+String.valueOf(monthEnd.get(monthEnd.MONTH)+1);
				} else {
					nowMonth = String.valueOf(monthEnd.get(monthEnd.MONTH)+1);
				}

			String startTable = monthStart.get(monthStart.YEAR)+""+sMonth;
			String endTable = monthEnd.get(monthEnd.YEAR)+""+eMonth;
			String nowYearMonth = nowCalendar.get(Calendar.YEAR)+nowMonth;
			System.out.println("nowyearMonth:"+nowYearMonth);
		
			//현재와 일치하는 달은 LOCATION 테이블이기때문에 빈문자열로 치환
			if(startTable.equals(nowYearMonth)) {
				startTable ="";
			}
			if(endTable.equals(nowYearMonth)) {
				endTable ="";
			};
	
			//몽골 시차 맞출필요없음 조회 기준이 운행 시작임.
			List<BusLogDTO> busLogList = dao.busLogList(seq, start, end);
			if(session.getAttribute("adto") != null){
				AdminUniversityDTO adto = (AdminUniversityDTO) session.getAttribute("adto");
				System.out.println(adto.getUniversitySeq());
			
				
				
			
				
				
				
				
				//miu 시차 설정
				if(adto.getUniversitySeq().equals("10028")){
					
					SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					
		
					Date startDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(start);
					Date endDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(end);
					
					Calendar calStart = Calendar.getInstance();
					Calendar calEnd = Calendar.getInstance();
					calStart.setTime(startDate);
					calStart.add(Calendar.HOUR,+1);
					
					calEnd.setTime(endDate);
					calEnd.add(Calendar.HOUR,+1);
					

					
					start=  transFormat.format(calStart.getTime());
					end=  transFormat.format(calEnd.getTime());
	
					System.out.println(start);
					System.out.println(end);
					
				}	
			}
			
			
		
			// 버스 정보 가져오기
			List<LocationDTO> location = dao.location(seq, start, end,startTable,endTable);
			
		
		
			
			
			
			
			
			
			
			
			request.setAttribute("busLogList", busLogList);
			request.setAttribute("location", location);
			
			return "polyline/location";

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

	private int parseInt(String start) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 정류장 가져오기
	@RequestMapping(method = { RequestMethod.GET }, value = "/polyline/busStop.action")
	public String busStop(HttpServletRequest request, HttpSession session, HttpServletResponse response, String seq) {

		try {

			// 내용
			List<BusStopDTO> busStop = dao.busStop(seq);

			request.setAttribute("busStop", busStop);

			return "polyline/busStop";
			
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