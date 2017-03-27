package com.test.spring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller("homecontroller2")
public class HomeController {
	
	
	@Autowired
	HomeDAO dao; 
	
	@RequestMapping(value = "/home.action", method = RequestMethod.POST)
	public String home(HttpServletRequest request,HttpServletResponse response,String deviceId) throws IOException {
		
		
		System.out.println(deviceId);
		JSONObject obj = new JSONObject();
		JSONArray businfo = new JSONArray();
		
		String busSeq = "1";
		String intervalTime = "1000";
		String newUrl = "http://eeu1234.iptime.org:8080/";
		System.out.println(busSeq);
		
		obj.put("busSeq", busSeq);
		obj.put("intervalTime", intervalTime);
		obj.put("newUrl", newUrl);
		
		
		businfo.add(obj);
		response.setCharacterEncoding("utf-8");
		response.getWriter().print(businfo);
				
		
		
		
		return "home";
	}
	
}
