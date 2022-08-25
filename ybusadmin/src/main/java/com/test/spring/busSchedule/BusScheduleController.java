package com.test.spring.busSchedule;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
import com.test.spring.dto.UniversityDTO;

@Controller
public class BusScheduleController {
	
	@Autowired
	private BusScheduleDAO dao;
	
	//버스 시간표 보여주는 화면,
	@RequestMapping(method={RequestMethod.GET}
					, value="/busSchedule/busTimeTable.action")
	public String timeTable(HttpServletRequest request
							,HttpSession session
							,HttpServletResponse response
							,String busStopCategorySeq
							,String busStopDetaliCategorySeq
							,String weekDays){
		
		
		UniversityDTO adto = null;
		
		if(session.getAttribute("universityDto") == null){
				try {
					RequestDispatcher dispatcher = request.getRequestDispatcher("/selectUniversity.action");
					dispatcher.forward(request, response);
				} catch (Exception e) {
					System.out.println(e.toString());
				}
		
			
		}else{
			 adto = (UniversityDTO)session.getAttribute("universityDto");
		}
		
		
		
		
		//학교 seq 가져오기
		String universitySeq = adto.getUniversitySeq();
		
		//해당 학교 busCategory 가져오기
		List<BusStopCategoryDTO> clist = dao.getCategoryList(universitySeq);
		List<BusStopDetailCategoryDTO> dlist;
		
		System.out.println("카테고리값 있니? -> "+ clist.size());
		
		//해당 학교의 카테고리가 있는지 조건문 실행.
		if(clist.size() > 0){
			//busCategorySeq 가 null 이면
			if(busStopCategorySeq == null || busStopCategorySeq.equals("") || busStopCategorySeq.equals("null")){
				//해당 학교 clist.get(0)로 busDetailCategorySeq 가져오기
				dlist = dao.getDetailCategoryList(clist.get(0).getBusStopCategorySeq()); // 요청에 무슨 버스인지 정보를 안가져오면 그냥 제일 처음이 있는 버스정보를 보여줌.
				//System.out.println("디테일111 갖고왔니? : "+dlist.get(0).getBusStopDetailCategorySeq());
			}else{
				//해당 학교 busCategorySeq로 busDetailCategorySeq 가져오기
				dlist = dao.getDetailCategoryList(busStopCategorySeq);
				//System.out.println("디테일222 갖고왔니? : "+dlist.get(0).getBusStopDetailCategorySeq());
			}
		}else{
			//없으면 그냥 넘긴다. 해당학교의 버스정보가 입력되어 있지 않음.
			return "busSchedule/busTimeTable";
		}//카테고리 확인 if
		System.out.println("디테일카테고리값 있니? -> "+ dlist.size());
		//가져온 버스디테일카테고리로 시간표 가져오기
		//busDetailCategorySeq가 여러개일 경우도 있으니 for문 사용
		
		
		//조건용 dto 생성 후 값 삽입
		BusScheduleSearchDTO bsdto = new BusScheduleSearchDTO();
		if(busStopCategorySeq == null || busStopCategorySeq.equals("") || busStopCategorySeq.equals("null")){
			bsdto.setBusStopCategorySeq(clist.get(0).getBusStopCategorySeq());
		}else{
			bsdto.setBusStopCategorySeq(busStopCategorySeq);
		}
		
		//영광시작
		if(busStopDetaliCategorySeq == null || busStopDetaliCategorySeq.equals("") || busStopDetaliCategorySeq.equals("null")){
			bsdto.setBusStopDetailCategorySeq(dlist.get(0).getBusStopDetailCategorySeq());
		}else{
			bsdto.setBusStopDetailCategorySeq(busStopDetaliCategorySeq);
		}
		//영광끝
		
		if(weekDays == null || weekDays.equals("") || weekDays.equals("null")){
			bsdto.setWeekDays("normal");
		}else{
			bsdto.setWeekDays(weekDays);
		}
		
		BusScheduleSearchDTO slist = new BusScheduleSearchDTO();
			slist.setBusStopDetailCategorySeq(bsdto.getBusStopDetailCategorySeq());//버스디테일seq
			slist.setWeekDays(bsdto.getWeekDays());
			
			
			List<BusScheduleDTO> tlist = dao.getBusSchedule(slist);
			
			List<String> addedTimeList = new ArrayList<String>(); // 시간별로 뭉쳐놓은 리스트
			int spot = 0; 
			for(int i = 1; i<tlist.size(); i++) {
				String time_now = tlist.get(i).getBusTime();
				String time_prev = tlist.get(i-1).getBusTime();
				String[] time_now_pro = time_now.split(":");
				String[] time_prev_pro = time_prev.split(":");
				
				if(i == 1) {
					addedTimeList.add(time_prev);
				} // 처음이면 첫 시간을 미리 리스트에 가지고 있음.
				if(time_now_pro[0].equals(time_prev_pro[0])) {//시간이 같으면
					if(i == tlist.size()-1) { //마지막 요소일때
						addedTimeList.add(time_now);
						List<String> copyArray = new ArrayList<String>();
						for(int k = 0 ; k<addedTimeList.size(); k++) {
							copyArray.add(addedTimeList.get(k));
						}
						tlist.get(spot).setBusTimeHourMin(copyArray);
					}else { 
						addedTimeList.add(time_now);
					}
				}else { //시간이 다를떄
			
						List<String> copyArray = new ArrayList<String>();
						for(int k = 0 ; k<addedTimeList.size(); k++) {
							copyArray.add(addedTimeList.get(k));
						}
						tlist.get(spot).setBusTimeHourMin(copyArray);
						spot = i;
						addedTimeList.clear();
						addedTimeList.add(time_now);
						if( i == tlist.size()-1) {
							tlist.get(spot).setBusTimeHourMin(addedTimeList);
						}
					
				}
			}
			
			//busTimeHourMin이 비어있는 tlist를 삭제함.
			int count_remove = 0;
			int size_tlist = tlist.size();
			for(int i = 0; i<size_tlist;i++) {
				if(tlist.get(i-count_remove).getBusTimeHourMin() == null) {
					tlist.remove(i-count_remove);
					count_remove++;
				}
			}

			//현재 tlist의 형태는 시간별로 묶여있는 상황임.
			
			slist.setTimeList(tlist);

		for(int i = 0; i<slist.getTimeList().size(); i++) {
			System.out.println(slist.getTimeList().get(i).getBusTimeHourMin());
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
		request.setAttribute("busStopDetaliCategorySeq",busStopDetaliCategorySeq);
	    request.setAttribute("busStopCategorySeq", busStopCategorySeq);

		return "busSchedule/busTimeTable";
		
	}
	
	@RequestMapping(method={RequestMethod.GET}, value="/busSchedule/schoolBusTimeTable.action")
	public String schoolBustimeTable(HttpServletRequest request
			,HttpSession session
			,HttpServletResponse response
			,String busStopCategorySeq
			,String weekDays){
		
		UniversityDTO adto = null;
		
		if(session.getAttribute("universityDto") == null){
				try {
					RequestDispatcher dispatcher = request.getRequestDispatcher("/selectUniversity.action");
					dispatcher.forward(request, response);
				} catch (Exception e) {
					System.out.println(e.toString());
				}
		
			
		}else{
			 adto = (UniversityDTO)session.getAttribute("universityDto");
		}
		
		
		
		
		//학교 seq 가져오기
		String universitySeq = adto.getUniversitySeq();
		
		//해당 학교 busCategory 가져오기
		List<BusStopCategoryDTO> clist = dao.getCategoryList(universitySeq);
		List<BusStopDetailCategoryDTO> dlist;
		
		System.out.println("카테고리값 있니? -> "+ clist.size());
		
		//해당 학교의 카테고리가 있는지 조건문 실행.
		if(clist.size() > 0){
			//busCategorySeq 가 null 이면
			if(busStopCategorySeq == null || busStopCategorySeq.equals("") || busStopCategorySeq.equals("null")){
				//해당 학교 clist.get(0)로 busDetailCategorySeq 가져오기
				dlist = dao.getDetailCategoryList("37"); //파라미터에 정보가 없으면 통학버스 번호를 넣어줌
				//System.out.println("디테일111 갖고왔니? : "+dlist.get(0).getBusStopDetailCategorySeq());
			}else{
				//해당 학교 busCategorySeq로 busDetailCategorySeq 가져오기
				dlist = dao.getDetailCategoryList("37"); //파라미터에 정보가 없으면 통학버스 번호를 넣어줌
				//System.out.println("디테일222 갖고왔니? : "+dlist.get(0).getBusStopDetailCategorySeq());
			}
		}else{
			//없으면 그냥 넘긴다.
			return "busSchedule/busTimeTable";
		}//카테고리 확인 if
		System.out.println("디테일카테고리값 있니? -> "+ dlist.size());
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
			sdto.setBusStopDetailCategorySeq(dto.getBusStopDetailCategorySeq());//버스디테일seq
			sdto.setWeekDays(bsdto.getWeekDays());
			
			slist.add(sdto);
			
			List<BusScheduleDTO> tlist = dao.getBusSchedule(sdto);
			
			
			
			//tlist를 전체적으로 검사하여 코스이름이 같은것이 있는지 확인 
			for(int i = 0; i<tlist.size(); i++) {
				List<String> sameCourse = new ArrayList<String>();
				int spot = 0;
				sameCourse.add(tlist.get(i).getBusTime());
				for(int j = i+1; j<tlist.size()+spot; j++) {
					if(tlist.get(i).getCourseName().equals(tlist.get(j-spot).getCourseName())) {
						sameCourse.add(tlist.get(j-spot).getBusTime());
						tlist.remove(j-spot);
						spot++;
						System.out.print(i);
						System.out.println(j);
					}
				}
				tlist.get(i).setBusTimeHourMin(sameCourse);
			}
			
			
			
			slist.get(num).setTimeList(tlist);;
			num++;
		}
		
		
		//버스 카테고리 건네주기
		request.setAttribute("clist", clist);
		//버스 디테일 건네주기
		request.setAttribute("dlist", dlist);
		//버스 시간표 건네주기
		request.setAttribute("slist", slist);
		//request.setAttribute("map", map);
		request.setAttribute("weekDays", bsdto.getWeekDays());
		request.setAttribute("busStopCategorySeq", busStopCategorySeq);
		
		
		return "busSchedule/schoolBusTimeTable";
		
	}
	
	
	
	
	
	
}
