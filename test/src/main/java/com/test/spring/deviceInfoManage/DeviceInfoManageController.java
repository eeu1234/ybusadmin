package com.test.spring.deviceInfoManage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.spring.dto.DeviceDTO;
import com.test.spring.dto.UniversityDTO;

@Controller("deviceInfoManageConrtoller")
public class DeviceInfoManageController {

	@Autowired
	private DeviceInfoManageDAO dao;
	
	//기기정보 수정 페이지
	@RequestMapping(method = { RequestMethod.GET }, value = "/deviceInfoManage/deviceInfoManage.action")
	public String device(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
	
		//모든 기기정보 가져오기
		List<DeviceDTO> diviceList = dao.diviceList();
		
		//대학교 리스트가져오기
		List<UniversityDTO> universityList = dao.universityList();
		
		request.setAttribute("diviceList", diviceList);
		request.setAttribute("universityList", universityList);
		
		return "deviceInfoManage/deviceInfoManage";
	}
	
	
	//수정 처리
	@RequestMapping(method = { RequestMethod.GET }, value = "/deviceInfoManage/updateDeviceInfoManage.action")
	public String updateDeviceInfoManage(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
	
		String seq = request.getParameter("seq");
		String deviceModel = request.getParameter("deviceModel");
		String deviceTel = request.getParameter("deviceTel");
		String universitySel = request.getParameter("universitySel");
	
		System.out.println(seq);
		System.out.println(deviceModel);
		System.out.println(deviceTel);
		System.out.println(universitySel);
		int result;
		
		
		result = dao.updateDevice(seq,deviceModel,deviceTel,universitySel);
		
		request.setAttribute("result", result);
		
		return "deviceInfoManage/updateDeviceInfoManage";
	}
	
	
	
}
