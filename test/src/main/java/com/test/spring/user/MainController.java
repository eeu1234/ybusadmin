package com.test.spring.user;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.spring.dao.MainDAO;
import com.test.spring.dto.BusStopCategoryDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;
import com.test.spring.dto.NoticeDTO;
import com.test.spring.dto.WeatherStatDTO;

@Controller("MainController")
public class MainController {
	
	@Autowired
	private MainDAO dao;
	
	@RequestMapping(method={RequestMethod.GET}, value="/index.action")
	public void index(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		//System.out.println("check1");
		StringBuffer url = request.getRequestURL();
		String urlStr = url.toString();
		//System.out.println("check2");
		//System.out.println("urlurl"+urlStr);
		//도메인에 따른 universitySeq를 가져옴
		String universitySeq = dao.getUniversitySeq(urlStr);
		//System.out.println("universitySeq==="+universitySeq);
		
		session.setAttribute("universitySeq", universitySeq);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/mainIndex.action");
		try {
			
			//response.sendRedirect("/spring/mainIndex.action");
			dispatcher.forward(request, response);
		} catch (IOException e) {
			
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(method={RequestMethod.GET}, value="/mainIndex.action")
	public String mainIndex(HttpServletRequest request, HttpSession session, HttpServletResponse response, String universitySeq,String busStopCategorySeq){
		System.out.println("mainuniversitySeq"+universitySeq);
		
		WeatherStatDTO wsdto = apiExplorer();
		universitySeq = (String) session.getAttribute("universitySeq");
		
	
		//busStopCategorySeq ="2";
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("busStopCategorySeq", busStopCategorySeq);
		map.put("universitySeq", universitySeq);
		//이학교에 있는 노선을 메인 화면에 띄워주어야함
		//노선목록 들고옴.
		//공지사항목록 들고옴.
		List<NoticeDTO> nList = dao.getAllNotice();
		List<BusStopDetailCategoryDTO> bsdcList = dao.getSpecipicBusStopDetailCategory(map);
		List<BusStopCategoryDTO> bscList = dao.getSpecipicBusStopCategory(map);
		
		request.setAttribute("nList", nList);
		request.setAttribute("wsdto", wsdto);
		request.setAttribute("bsdcList", bsdcList);
		request.setAttribute("bscList", bscList);
		
		
		return "user/mainIndex";
	}
	
	@RequestMapping(method={RequestMethod.GET},value="/user/makeIcon.action")
	public String makeIcon(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		
		
		
		return "user/makeIcon";
	}
	
	double RE = 6371.00877; // 지구 반경(km)
	double GRID = 5.0; // 격자 간격(km)
	double SLAT1 = 30.0; // 투영 위도1(degree)
	double SLAT2 = 60.0; // 투영 위도2(degree)
	double OLON = 126.0; // 기준점 경도(degree)
	double OLAT = 38.0; // 기준점 위도(degree)
	double XO = 43; // 기준점 X좌표(GRID)
	double YO = 136; // 기1준점 Y좌표(GRID)
	//
	// LCC DFS 좌표변환 ( code : "toXY"(위경도->좌표, v1:위도, v2:경도), "toLL"(좌표->위경도,v1:x, v2:y) )
	//
	public HashMap<String,Integer> dfs_xy_conv(String code,double v1,double v2) {
		double DEGRAD = Math.PI / 180.0;
		double RADDEG = 180.0 / Math.PI;
	
		double re = RE / GRID;
		double slat1 = SLAT1 * DEGRAD;
		double slat2 = SLAT2 * DEGRAD;
		double olon = OLON * DEGRAD;
		double olat = OLAT * DEGRAD;
		double theta = 0;
		HashMap<String,Integer> map = new HashMap<String,Integer>(); 
		
		double sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
		sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
		double sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
		sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
		double ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
		ro = re * sf / Math.pow(ro, sn);
		
		if (code == "toXY") {
	
			//map.put("lat",v1);
			//map.put("lng",v2);
		    double ra = Math.tan(Math.PI * 0.25 + (v1) * DEGRAD * 0.5);
		    ra = re * sf / Math.pow(ra, sn);
		    theta = v2 * DEGRAD - olon;
		    if (theta > Math.PI) theta -= 2.0 * Math.PI;
			    if (theta < -Math.PI) theta += 2.0 * Math.PI;
			    theta *= sn;
			    map.put("nx", (int)(Math.floor(ra * Math.sin(theta) + XO + 0.5)));
			    map.put("ny", (int)(Math.floor(ro - ra * Math.cos(theta) + YO + 0.5)));
		}
		return map;
	}
	public WeatherStatDTO apiExplorer(){
		WeatherStatDTO wsdto = new WeatherStatDTO();
		try{
			
			HashMap<String,Integer> map = dfs_xy_conv("toXY", 37.226719, 127.167840);
			int nx = map.get("nx");
			int ny = map.get("ny");
			
			//현재 날짜 뽑아옴
			Calendar cal = Calendar.getInstance();
			
			String today;
			String year = String.valueOf(cal.get(Calendar.YEAR));
		    String month = String.valueOf(cal.get(Calendar.MONTH)+1);
		    String day = String.valueOf(cal.get(Calendar.DATE));
		    String hours = String.valueOf(cal.get(Calendar.HOUR));
		    String minutes = String.valueOf(cal.get(Calendar.MINUTE));
		    //System.out.println("day =" + day);
		    //System.out.println("month = "+month);
		    /*
		     * 기상청 30분마다 발표
		     * 30분보다 작으면, 한시간 전 hours 값
		     */
		    if(Integer.parseInt(minutes) < 30){
		        hours = String.valueOf(Integer.parseInt(hours) - 1);
		        if(Integer.parseInt(hours) < 0){
		            // 자정 이전은 전날로 계산
		        	cal.set(Calendar.DATE,cal.get(Calendar.DATE) - 1);
		            day = String.valueOf(cal.get(Calendar.DATE));
		            month = String.valueOf(cal.get(Calendar.MONTH)+1);
		            year = String.valueOf(cal.get(Calendar.YEAR));
		            hours = "23";
		        }
		    }
		    //System.out.println("day2 =" + day);
		    //System.out.println("month2 = "+month);
		    /* example
		     * 9시 -> 09시 변경 필요
		     */
		    
		    if(Integer.parseInt(hours) < 10) {
		        hours = '0'+hours;
		    }
		    if(Integer.parseInt(month) < 10) {
		        month = '0' + month;
		    }    
		    if(Integer.parseInt(day) < 10) {
		        day = '0' + day;
		    } 
		    //System.out.println("day3 =" + day);
		    //System.out.println("month3 = "+month);
		    today = year+""+month+""+day;
		    
		    String baseTime=hours +"00";
		    String apikey = "H9oL068yRVguVD43j0frXIqlUeWt8jTGxqFrT5tEYQ7bRETLjf5WHiv1dSw6ig09KQQJoB7mX0BQ8UnP042bDg%3D%3D",    
		    ForecastGribURL = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData";
		    ForecastGribURL += "?ServiceKey=" + apikey;
		    ForecastGribURL += "&base_date=" + today;
		    ForecastGribURL += "&base_time=" + baseTime;
		    ForecastGribURL += "&Nx=" + nx + "&Ny=" + ny;
		    ForecastGribURL += "&pageNo=1&numOfRows=7";
		    ForecastGribURL += "&_type=json";
		    //System.out.println(ForecastGribURL);
		    
	        StringBuilder urlBuilder = new StringBuilder("http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastGrib"); //URL
		    //StringBuilder urlBuilder = new StringBuilder("http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData");
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+apikey); 
	        //urlBuilder.append("&" + URLEncoder.encode("파라미터영문명","UTF-8") + "=" + URLEncoder.encode("파라미터기본값", "UTF-8")); //파라미터설명
	        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(today, "UTF-8")); //파라미터설명
	        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode(baseTime, "UTF-8")); //파라미터설명
	        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(String.valueOf(nx), "UTF-8")); //파라미터설명
	        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(String.valueOf(ny), "UTF-8")); //파라미터설명
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //파라미터설명
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("7", "UTF-8")); //파라미터설명
	        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); //파라미터설명
	        URL url = new URL(urlBuilder.toString());
	        //System.out.println(url);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        //System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	       
	        String sb2 = (sb.toString()).replaceAll("\"", "\\\"");
            
	        
	        //ajax에서 데이터 객체 빼옴
	        JSONParser jsonParser = new JSONParser();
            JSONObject jsonObj = (JSONObject) jsonParser.parse(sb2);
            jsonObj = (JSONObject) jsonObj.get("response");
            jsonObj = (JSONObject) jsonObj.get("body");
            jsonObj = (JSONObject) jsonObj.get("items");
            JSONArray jsonArray = (JSONArray) jsonObj.get("item");
            
            JSONObject weatherJO = new JSONObject();
            for(int i=0; i<jsonArray.size();i++){
            	if(i==1||i==4||i==5){
            		weatherJO = (JSONObject) jsonArray.get(i);
            		String wkey = weatherJO.get("category").toString();
            		String wvalue = weatherJO.get("obsrValue").toString();
            		//System.out.println(wkey+"==="+wvalue);
            		String value ="";
            		if(wkey.equals("SKY")){
            			
            			switch(wvalue){
            				case "1":
            					value="맑음";
            					break;
            				case "2":
            					value="구름조금";
            					break;	
            				case "3":
            					value="구름많음";
            					break;
            				case "4":
            					value="흐림";
            					break;
            			}
            			wsdto.setSky(value);
            		}else if(wkey.equals("PTY")){
            			switch(wvalue){
	            			case "0":
	        					break;
	            			case "1":
	        					value="비";
	        					break;
	            			case "2":
	        					value="진눈개비";
	        					break;
	            			case "3":
	        					value="눈";
	        					break;
	            					
            			}
            			wsdto.setSky(value);
            		}else if(wkey.equals("T1H")){
            			int temp=(int)(Double.parseDouble(wvalue));
            			wsdto.setTemperature(String.valueOf(temp));
            		}
            		
            		
            	}
            }//ajax에서 날씨정보 빼오는 for문 end
          
            
            //System.out.println("getSky="+wsdto.getSky());
            //System.out.println("getTemp="+wsdto.getTemperature());
            
            
            
		}catch(Exception e){
	    	System.out.println(e.toString());
	    }
		return wsdto;
	}//end apiExporler
	
}