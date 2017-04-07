package com.test.spring.busCategory;

import java.util.HashMap;
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
import com.test.spring.dto.BusStopCategoryDTO;

@Controller("busStopManageController")
public class BusStopManageController {

	
	@Autowired
	private BusStopManageDAO dao;
	
	//버스 관리 페이지
	@RequestMapping(method = { RequestMethod.GET }, value = "/busInfo/busStopManage.action")
	public String busStopManage(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		
		
		return "busInfo/busCategoryCrud";
	}
	

	//버스 리스트 & 카테고리 리스트
	@RequestMapping(method = { RequestMethod.GET }, value = "/busInfo/busList.action")
	public String busList(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		
		AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
		
		String seq = adto.getUniversitySeq();
		
		List<BusInfoDTO> blist = dao.busList(seq);
		
		request.setAttribute("blist", blist);
		
		List<BusStopCategoryDTO> clist = dao.busStopCategoryList(seq);
		
		request.setAttribute("clist", clist);
		
		
		return "busInfo/busCategoryCrud";
	}
	
	//버스에 카테고리 추가
	@RequestMapping(method = { RequestMethod.POST }, value = "/busStopCategory/busStopCategoryMatchOk.action")
	public String busStopCategoryMatchOk(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		
		HashMap<String, String> bdmap = new HashMap<String, String>();
		String[] busInfoSeq = request.getParameterValues("busInfoSeq");
		String[] busStopCategorySeq = request.getParameterValues("busStopCategory");
		int result= 0;
		
		for(int i = 0; i< busInfoSeq.length; i++){
			if(!busStopCategorySeq[i].equals("-1")) {
				System.out.println(busStopCategorySeq[i]);
				
				bdmap.put("seq", busInfoSeq[i]);
				bdmap.put("category", busStopCategorySeq[i]);
				
				result = dao.busStopCategoryMatch(bdmap);
				
			}
		}
		
		request.setAttribute("result", result);
		
		return "busStopCategory/busStopCategoryMatchOk";
	}
	
	
	//버스추가 페이지
	@RequestMapping(method = { RequestMethod.GET }, value = "/busInfo/busInfoAdd.action")
	public String busInfoAdd(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		
		AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
		
		String seq = adto.getUniversitySeq();
		
		List<BusStopCategoryDTO> clist = dao.busStopCategoryList(seq);
		
		request.setAttribute("clist", clist);
		
		return "busInfo/busInfoAdd";
	}
	
	
	//버스추가 하기
	@RequestMapping(method = { RequestMethod.POST }, value = "/busInfo/busInfoAddOk.action")
	public String busInfoAddOk(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		
		String[] busInfoNum = request.getParameterValues("busInfoNum");
		String[] busInfoName = request.getParameterValues("busInfoName");
		String[] busStopCategorySeq = request.getParameterValues("busStopCategory");
		
		HashMap<String, String> cmap = new HashMap<String, String>();
		
		int result =0;
		for(int i=0; i<busInfoNum.length; i++){
			cmap.put("busInfoNum", busInfoNum[i]);
			cmap.put("busInfoName", busInfoName[i]);
			cmap.put("busStopCategorySeq", busStopCategorySeq[i]);

			result = dao.busInfoAdd(cmap);
			
		}
		
		request.setAttribute("result", result);
		
		
			
		return "busInfo/busInfoAddOk";
	}
	
	//버스 정보 수정을 위해 정보 받아오기
	@RequestMapping(method = { RequestMethod.GET }, value = "/busInfo/busInfoEdit.action")
	public String busInfoEdit(HttpServletRequest request, HttpSession session, HttpServletResponse response, String seq) {
			
		BusInfoDTO bdto= dao.busInfoEditSel(seq); 
		
		
		request.setAttribute("bdto", bdto);
		
		return "busInfo/busInfoEdit";
	}
	
	
	//버스 정보 수정
	@RequestMapping(method = { RequestMethod.POST }, value = "/busInfo/busInfoEditOk.action")
	public String busInfoEditOk(HttpServletRequest request, HttpSession session, HttpServletResponse response, BusInfoDTO bdto) {
			
		int result = dao.busInfoUpdate(bdto);
			
		request.setAttribute("result", result);
			
		return "busInfo/busInfoEditOk";
	}
		

	//버스 정보 삭제
	@RequestMapping(method = { RequestMethod.GET }, value = "/busInfo/busInfoDeleteOk.action")
	public String busInfoDeleteOk(HttpServletRequest request, HttpSession session, HttpServletResponse response, String seq) {
		
		int result = dao.busInfoDelete(seq);
		
		request.setAttribute("result", result);
		
		return "busInfo/busInfoDeleteOk";
	}
	
	
	
	//총 카테고리 추가 & 수정 페이지
	@RequestMapping(method = { RequestMethod.GET }, value = "/busStopCategory/busStopCategoryAdd.action")
	public String busStopCategoryAdd(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		
		AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
		
		String seq = adto.getUniversitySeq();
		
		List<BusStopCategoryDTO> clist = dao.busStopCategoryTotalList(seq);
		
		request.setAttribute("clist", clist);
		
		return "busStopCategory/busStopCategoryAdd";
	}
	
	//정류장 카테고리 추가
	@RequestMapping(method = { RequestMethod.POST }, value = "/busStopCategory/busStopCategoryAddOk.action")
	public String busStopCategoryAddOk(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		
		AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
		
		String seq = adto.getUniversitySeq();
		
		HashMap<String, String> caddmap = new HashMap<String, String>();
		caddmap.put("busStopCategory", request.getParameter("busStopCategory"));
		caddmap.put("universitySeq", seq);
		int result = dao.busStopCategoryAdd(caddmap);
		
		request.setAttribute("result", result);
		
		return "busStopCategory/busStopCategoryAddOk";
	}
	
	//정류장 카테고리 수정 페이지
	@RequestMapping(method = { RequestMethod.GET }, value = "/busStopCategory/busStopCategoryEdit.action")
	public String busStopCategoryEdit(HttpServletRequest request, HttpSession session, HttpServletResponse response, String seq) {
		
		BusStopCategoryDTO bscdto= dao.busStopCategoryEditSel(seq); 
		
		
		request.setAttribute("bscdto", bscdto);
		
		return "busStopCategory/busStopCategoryEdit";
	}
	
	//정류장 카테고리 수정
	@RequestMapping(method = { RequestMethod.POST }, value = "/busStopCategory/busStopCategoryEditOk.action")
	public String busStopCategoryEditOk(HttpServletRequest request, HttpSession session, HttpServletResponse response, BusStopCategoryDTO dto) {
		
		int result = dao.busStopCategoryEdit(dto);
		
		request.setAttribute("result", result);
		
		return "busStopCategory/busStopCategoryEditOk";
	}
	
	//정류장 카테고리 삭제
	@RequestMapping(method = { RequestMethod.GET }, value = "/busStopCategory/busStopCategoryDeleteOk.action")
	public String busStopCategoryDeleteOk(HttpServletRequest request, HttpSession session, HttpServletResponse response, String seq) {
		
		int result = dao.busStopCategoryDelete(seq);
		
		request.setAttribute("result", result);
		
		return "busStopCategory/busStopCategoryDeleteOk";
	}
	
	
	
}
