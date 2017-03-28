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

@Controller("location")
public class location {
		
		
		@Autowired
		androidDAO androidDao;
		
		@RequestMapping(value = "/location.action", method = {RequestMethod.POST})
		public String home(HttpServletRequest request
									,HttpServletResponse response
										,String deviceSeq
										,String deviceLat
										,String deviceLng) throws IOException {
			

			//1.기기 seq
			androidDao.insertBusLocation(deviceSeq,deviceLat,deviceLng);
			
			
			
			
			JSONObject obj = new JSONObject();
			JSONArray businfo = new JSONArray();
			
			
			/*obj.put("deviceSeq", deviceSeq);
			obj.put("intervalTime", intervalTime);
			obj.put("newUrl", newUrl);
			*/
			
			businfo.add(obj);
			response.setCharacterEncoding("utf-8");
			System.out.println(businfo.toJSONString());
			response.getWriter().print(businfo.toJSONString());
					
			
			
			
			return null;
		}

	

	
		

}
