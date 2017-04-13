package com.test.spring.device;



import java.util.HashMap;
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
import com.test.spring.dto.BusInfoDTO;
import com.test.spring.dto.BusStopCategoryDTO;
import com.test.spring.dto.DeviceDTO;
import com.test.spring.dto.UniversityDTO;

@Controller("DeviceManageController")
public class DeviceManageController {

	
	@Autowired
	private DeviceManageDAO dao;
	
	@RequestMapping(method = { RequestMethod.GET }, value = "/device/deviceMain.action")
	public String device(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
	
		
		return "device/deviceMain";
	}
	
	//비어있는 단말기 리스트 가져오기
	@RequestMapping(method = { RequestMethod.GET }, value = "/device/deviceNullList.action")
	public String deviceNullList(HttpServletRequest request,HttpSession session, HttpServletResponse response) {
		
		List<DeviceDTO> dlist= dao.deviceNullList();
		List<UniversityDTO> ulist = dao.universityList();
		
		
		request.setAttribute("dlist", dlist);
		request.setAttribute("ulist", ulist);
		
		return "device/deviceList";
	}
	
	//단말기에 학교 정보 입력
	@RequestMapping(method= {RequestMethod.GET}, value="/device/deviceAddUniv.action")
	public String deviceAddUniv(HttpServletRequest request,HttpSession session, HttpServletResponse response, String seq, String universityName) {
		
		HashMap<String, String> dmap = new HashMap<String, String>();
		
		dmap.put("seq", seq);
		dmap.put("universityName", universityName);
		
		int result = dao.deviceAddUniv(dmap);
		
		request.setAttribute("result", result);
		
		return "device/deviceAddUnivOk";
	}


	//단말기 관리 출력	
	@RequestMapping(method={RequestMethod.GET}, value="/device/deviceBusManage.action")
	public String deviceManage(HttpServletRequest request){
		
		return "device/deviceBusManage";
	}

	
	//단말기 리스트 출력
	@RequestMapping(method={RequestMethod.GET}, value ="/device/deviceInfoList.action")
	public String deviceInfoList(HttpServletRequest request,HttpSession session, HttpServletResponse response){
		
		AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
		
		String seq = adto.getUniversitySeq();
		
		List<DeviceDTO> dvList = dao.deviceInfoList(seq);
		
		request.setAttribute("dvList", dvList);
		
		List<DeviceDTO> dNList = dao.deviceInfoNullList(seq);
		
		request.setAttribute("dNList", dNList);
		
		List<DeviceDTO> dHList = dao.deviceInfoHideList(seq);
		
		request.setAttribute("dHList", dHList);
		
		
		List<BusInfoDTO> busList = dao.busInfoList(seq);
		
		request.setAttribute("busList", busList);
		
		List<BusStopCategoryDTO> bsclist = dao.busStopCategoryList(seq);
		
		request.setAttribute("bsclist", bsclist);
		
		return "device/deviceBusManage";
		
	}
	
	
	
	@RequestMapping(method={RequestMethod.GET}, value ="/device/selBusInfo.action")
	public String selBusName(HttpServletRequest request,HttpSession session, HttpServletResponse response, String seq){
		
		BusInfoDTO BusInfo = dao.selBusInfo(seq);
		
		request.setAttribute("BusInfo", BusInfo);
		
		
		return "device/deviceBusManageData";
		
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
	
	//기기에 버스 정보 입력 전화번호 변경시 그것도 입력
	@RequestMapping(method = { RequestMethod.GET }, value = "/device/deviceBusAddOk.action")
	@Transactional
	public String deviceBusAddOk(HttpServletRequest request,HttpSession session, HttpServletResponse response, String seq, String busInfoSeq, String deviceTel) {
		
		HashMap<String,String> dmap = new HashMap<String,String>(); 
		
		dmap.put("seq", seq);
		dmap.put("busInfoSeq", busInfoSeq);
		dmap.put("deviceTel", deviceTel);
		
		int result = 0;
		
		if(!busInfoSeq.equals("-1")){
			dao.updateDeviceBusStat(dmap);
			result = dao.insertDeviceBus(dmap);
			
		}
		
		if(deviceTel != ""){
			
			result = dao.updateDeviceTel(dmap);
			
		}
		
		request.setAttribute("result", result);
		
		return "device/deviceBusAddOk";
	}
	
}
