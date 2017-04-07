package com.test.spring.admin;



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
import com.test.spring.dto.DeviceDTO;
import com.test.spring.dto.UniversityDTO;

@Controller("DeviceManageController")
public class DeviceManageController {

	
	@Autowired
	private DeviceManageDAO dao;
	
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/deviceMain.action")
	public String device(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
	
		
		return "admin/deviceMain";
	}
	
	
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/deviceNullList.action")
	public String deviceNullList(HttpServletRequest request,HttpSession session, HttpServletResponse response) {
		
		List<DeviceDTO> dlist= dao.deviceNullList();
		List<UniversityDTO> ulist = dao.universityList();
		
		
		request.setAttribute("dlist", dlist);
		request.setAttribute("ulist", ulist);
		
		return "admin/deviceList";
	}
	
	@RequestMapping(method= {RequestMethod.GET}, value="/admin/deviceAddUniv.action")
	public String deviceAddUniv(HttpServletRequest request,HttpSession session, HttpServletResponse response, String seq, String universityName) {
		
		HashMap<String, String> dmap = new HashMap<String, String>();
		
		dmap.put("seq", seq);
		dmap.put("universityName", universityName);
		
		int result = dao.deviceAddUniv(dmap);
		
		request.setAttribute("result", result);
		
		return "admin/deviceAddUnivOk";
	}


	//단말기 관리 출력	
	@RequestMapping(method={RequestMethod.GET}, value="/admin/deviceBusManage.action")
	public String deviceManage(HttpServletRequest request){
		
		return "admin/deviceBusManage";
	}

	
	//단말기 리스트 출력
	@RequestMapping(method={RequestMethod.GET}, value ="/admin/deviceInfoList.action")
	public String deviceInfoList(HttpServletRequest request,HttpSession session, HttpServletResponse response){
		
		AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
		
		String seq = adto.getUniversitySeq();
		
		List<DeviceDTO> dvList = dao.deviceInfoList(seq);
		
		request.setAttribute("dvList", dvList);
		
		List<BusInfoDTO> busList = dao.busInfoList(seq);
		
		request.setAttribute("busList", busList);
		
		List<BusStopCategoryDTO> bsclist = dao.busStopCategoryList(seq);
		
		request.setAttribute("bsclist", bsclist);
		
		return "admin/deviceBusManage";
		
	}
	
	
	
	@RequestMapping(method={RequestMethod.GET}, value ="/admin/selBusInfo.action")
	public String selBusName(HttpServletRequest request,HttpSession session, HttpServletResponse response, String seq){
		
		BusInfoDTO BusInfo = dao.selBusInfo(seq);
		
		request.setAttribute("BusInfo", BusInfo);
		
		
		return "admin/deviceBusManageData";
		
	}
	
	
	
	
	/*
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
		
		request.setAttribute("result", result);
		
		return "admin/busStopCategoryAddOk";
	}
	*/

	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/deviceBusAddOk.action")
	public String deviceBusAddOk(HttpServletRequest request,HttpSession session, HttpServletResponse response, String seq, String busInfoSeq, String deviceTel) {
		
		HashMap<String,String> dmap = new HashMap<String,String>(); 
		
		dmap.put("seq", seq);
		dmap.put("busInfoSeq", busInfoSeq);
		dmap.put("deviceTel", deviceTel);
		
		int result = 0;
		
		if(!busInfoSeq.equals("-1")){
			
			result = dao.insertDeviceBus(dmap);
			
		}
		
		if(deviceTel != ""){
			
			result = dao.updateDeviceTel(dmap);
			
		}
		
		request.setAttribute("result", result);
		
		return "admin/deviceBusAddOk";
	}
	
}
