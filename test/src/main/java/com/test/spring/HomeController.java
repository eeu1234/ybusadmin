package com.test.spring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
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
@Controller("main")
public class HomeController {
	
	
	@Autowired
	HomeDAO dao; 
	
	@RequestMapping(value = "/adminMain.action", method = {RequestMethod.GET})
	public String home(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		
		
		return "adminMain";
	}
	
	
}
