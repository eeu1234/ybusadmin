package com.test.spring.android.Controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.spring.android.DAO.androidDAO;

@Controller("ajaxFirst")
public class ajaxFirst {
		
		
		@Autowired
		androidDAO androidDao;
		
		@RequestMapping(value = "/ajaxFirst.action", method = {RequestMethod.POST})
		public String home(HttpServletRequest request,HttpServletResponse response,String deviceId) throws IOException {
			System.out.println(deviceId);

			//1.기기 seq
			String deviceSeq = androidDao.findDeviceSeq(deviceId);
			System.out.println(deviceSeq);
			
			//2.위경도 전송 주소
			String newUrl = "http://eeu1234.iptime.org:8080/";
			
			//3.버스 상세 구역 intervalTime
			String intervalTime = androidDao.findDeviceInterval(deviceId);
			
			
			JSONObject obj = new JSONObject();
			JSONArray businfo = new JSONArray();
			
			
			obj.put("deviceSeq", deviceSeq);
			obj.put("intervalTime", intervalTime);
			obj.put("newUrl", newUrl);
			
			
			businfo.add(obj);
			response.setCharacterEncoding("utf-8");
			System.out.println(businfo.toJSONString());
			response.getWriter().print(businfo.toJSONString());
					
			
			
			
			return null;
		}

	

	
		

}
