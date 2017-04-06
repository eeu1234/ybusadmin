package com.test.spring.busSchedule;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.spring.dto.AdminUniversityDTO;
import com.test.spring.dto.BusScheduleDTO;
import com.test.spring.dto.BusScheduleSearchDTO;
import com.test.spring.dto.BusStopCategoryDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;

@Controller
public class BusScheduleController {
	
	@Autowired
	private BusScheduleDAO dao;
	
	//버스 평일 시간표 보여주는 화면,
	@RequestMapping(method={RequestMethod.GET}
					, value="/busSchedule/busTimeTable.action")
	public String timeTable(HttpServletRequest request
							,HttpSession session
							,HttpServletResponse response
							,String busStopCategorySeq
							,String weekDays){
		
		AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
		
		//학교 seq 가져오기
		String universitySeq = adto.getUniversitySeq();
		
		//해당 학교 busCategory 가져오기
		List<BusStopCategoryDTO> clist = dao.getCategoryList(universitySeq);
		List<BusStopDetailCategoryDTO> dlist;
		
		//busCategorySeq 가 null 이면
		if(busStopCategorySeq == null || busStopCategorySeq.equals("") || busStopCategorySeq.equals("null")){
			//해당 학교 clist.get(0)로 busDetailCategorySeq 가져오기
			dlist = dao.getDetailCategoryList(clist.get(0).getBusStopCategorySeq());
			//System.out.println("디테일111 갖고왔니? : "+dlist.get(0).getBusStopDetailCategorySeq());
		}else{
			//해당 학교 busCategorySeq로 busDetailCategorySeq 가져오기
			dlist = dao.getDetailCategoryList(busStopCategorySeq);
			//System.out.println("디테일222 갖고왔니? : "+dlist.get(0).getBusStopDetailCategorySeq());
		}
		
		//가져온 버스디테일카테고리로 시간표 가져오기
		//busDetailCategorySeq가 여러개일 경우도 있으니 for문 사용
		
		
		//조건용 dto 생성 후 값 삽입
		BusScheduleSearchDTO bsdto = new BusScheduleSearchDTO();
		if(busStopCategorySeq == null || busStopCategorySeq.equals("") || busStopCategorySeq.equals("null")){
			bsdto.setBusStopCategorySeq(clist.get(0).getBusStopCategorySeq());
		}else{
			bsdto.setBusStopCategorySeq(busStopCategorySeq);
		}
		if(weekDays == null || weekDays.equals("") || weekDays.equals("null")){
			bsdto.setWeekDays("normal");
		}else{
			bsdto.setWeekDays(weekDays);
		}
		//System.out.println("평일/주말 유무 : "+bsdto.getWeekDays());
		
		List<BusScheduleSearchDTO> slist = new ArrayList<BusScheduleSearchDTO>();
		int num = 0;
		for(BusStopDetailCategoryDTO dto : dlist){
			BusScheduleSearchDTO sdto = new BusScheduleSearchDTO();
			sdto.setBusStopCategorySeq(dto.getBusStopDetailCategorySeq());//버스디테일seq
			sdto.setWeekDays(bsdto.getWeekDays());
			
			slist.add(sdto);
			
			List<BusScheduleDTO> tlist = dao.getBusSchedule(sdto);
			slist.get(num).setTimeList(tlist);;
			num++;
		}
		
		//System.out.println("해쉬맵 사이즈 : "+slist.size());
		
		//조건dto로 버스시간표 가져오고 tableList 에 add
		//List<BusScheduleDTO> busSchedule = dao.getBusSchedule(bsdto);
			
		//버스 카테고리 건네주기
		request.setAttribute("clist", clist);
		//버스 디테일 건네주기
		request.setAttribute("dlist", dlist);
		//버스 시간표 건네주기
		request.setAttribute("slist", slist);
		//request.setAttribute("map", map);
		request.setAttribute("weekDays", bsdto.getWeekDays());
		
		
		return "busSchedule/busTimeTable";
		
	}
	
	
}
