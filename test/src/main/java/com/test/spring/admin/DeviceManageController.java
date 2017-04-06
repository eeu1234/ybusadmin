package com.test.spring.admin;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.spring.dto.BusStopCategoryDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;
import com.test.spring.dto.DeviceBusInfoDTO;
import com.test.spring.dto.DeviceDTO;
import com.test.spring.dto.UniversityDTO;

@Controller("DeviceManageController")
public class DeviceManageController {

	
	@Autowired
	private DeviceManageDAO dao;

	
	
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/deviceNullList.action")
	public String deviceNullList(HttpServletRequest request) {
		
		List<DeviceDTO> dlist= dao.deviceNullList();
		List<UniversityDTO> ulist = dao.universityList();
		
		
		request.setAttribute("dlist", dlist);
		request.setAttribute("ulist", ulist);
		
		return "admin/deviceList";
	}
	
	@RequestMapping(method= {RequestMethod.GET}, value="/admin/deviceAddUniv.action")
	public String deviceAddUniv(HttpServletRequest request, String seq, String universityName) {
		
		HashMap<String, String> dmap = new HashMap<String, String>();
		
		dmap.put("seq", seq);
		dmap.put("universityName", universityName);
		
		int result = dao.deviceAddUniv(dmap);
		
		request.setAttribute("result", result);
		
		return "admin/deviceAddUnivOk";
	}

	//선택한 대학교 기기 리스트 출력
	/*@RequestMapping(method = { RequestMethod.GET }, value = "/admin/devicesel.action")
	public String deviceSel(HttpServletRequest request, String seq) {
		
		List<DeviceDTO> dslist = dao.deviceSelList(seq);
		
		request.setAttribute("dslist", dslist);
		
		return "admin/devicesel";
	}*/
	
	//단말기 관리 출력	
	@RequestMapping(method={RequestMethod.GET}, value="/admin/deviceBusManage.action")
	public String deviceManage(HttpServletRequest request){
		
		return "admin/deviceBusManage";
	}
	
	//단말기 리스트 출력 & 카테고리 출력
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/deviceBusList.action")
	public String devicebuslist(HttpServletRequest request, HttpSession session){
		
		String seq = (String) session.getAttribute("universitySeq");
		System.out.println(seq);
		List<DeviceBusInfoDTO> dbilist = dao.deviceBusList(seq);
		request.setAttribute("dbilist", dbilist);
		
		List<BusStopCategoryDTO> bsclist = dao.busStopCategoryList(seq);
		
		request.setAttribute("bsclist", bsclist);
		
		return "admin/deviceBusManage";
	}
	

	
	//중분류 불러오기
	/*
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/busStopDetailCategory.action")
	public String busStopCategoryDetailList(HttpServletRequest request, String seq) {
		
		List<BusStopDetailCategoryDTO> bscdlist = dao.busStopDetailCategoryList(seq);
		
		request.setAttribute("bscdlist", bscdlist);
		
		return "admin/deviceBusDetailList";
	}
	*/
/*	
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/busStopCategoryAddOk.action")
	public String busStopCategoryAddOk(HttpServletRequest request, String seq, String category) {
		
		HashMap<String, String> bdmap = new HashMap<String, String>();
		
		bdmap.put("seq", seq);
		bdmap.put("category", category);
		bdmap.put("dcategory", dcategory);
		
		
		int result = dao.busStopCategoryAdd(bdmap);
		
		request.setAttribute("result", result );
		
		return "admin/busStopCategoryAddOk";
	}*/
	
	
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/busStopCategoryAddOk.action")
	public String busStopCategoryAddOk(HttpServletRequest request, String[] seq, String[] category) {
		
		HashMap<String, String> bdmap = new HashMap<String, String>();
		
		int result= 0;
		
		for(int i = 0; i< seq.length; i++){
			if(!category[i].equals("-1")) {
				System.out.println(category[i]);
				
				bdmap.put("seq", seq[i]);
				bdmap.put("category", category[i]);
				
				result = dao.busStopCategoryAdd(bdmap);
				
			}
		}
		/*bdmap.put("dcategory", dcategory);*/
		
		
		
		
		request.setAttribute("result", result);
		
		return "admin/busStopCategoryAddOk";
	}
}
