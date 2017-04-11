package com.test.spring.virtual;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.spring.busstop.BusStopDAO;
import com.test.spring.dto.BusStopDTO;
import com.test.spring.dto.UniversityDTO;
import com.test.spring.dto.VirtualBusStopDTO;

@Controller("virtualBusStopController")
public class VirtualBusStopController {
	
	@Autowired
	private BusStopDAO bdao;
	@Autowired
	private VirtualBusStopDAO dao;
	
	@RequestMapping(method = { RequestMethod.GET }, value = "/virtual/virtualBusStop.action")
	public String virtualBusStop(HttpServletRequest request,String seq) {
		
		// 대학교 위도 경도 가져오기
		if(seq != null){
			List<UniversityDTO> universityMap = bdao.universityMap(seq);
			request.setAttribute("universityMap", universityMap);
		}
		
		return "virtual/virtualBusStop";

	}
	
	@RequestMapping(method = { RequestMethod.GET }, value = "/virtual/virtualBusStopList.action")
	public String virtualBusStopList(HttpServletRequest request, String bseq) {
		
		
		// 정류장 정보 가져오기
		if(bseq != null){
			List<VirtualBusStopDTO> virtualBusStop = dao.virtualBusStop(bseq);
			request.setAttribute("virtualBusStop", virtualBusStop);
		}
		
		return "virtual/virtualBusStopList";

	}
	
	@RequestMapping(method = { RequestMethod.POST }, value = "/virtual/virtualBusStopOK.action")
	public String virtualBusStopOK(HttpServletRequest request) {
		//가상정류장 수정
		int result1 = 1;
		
		String jsonInfo = "{\"busStop\""+request.getParameter("jsonInfo")+"}";
		String universitySel = request.getParameter("universitySel");
		String busCategorySel = request.getParameter("busCategorySel");
		String detailCategorySelect = request.getParameter("detailCategorySelect");
		
		
		
		System.out.println(jsonInfo);
		System.out.println(universitySel);
		System.out.println(busCategorySel);
		System.out.println(detailCategorySelect);
		
		
		//넘어오는게 하나라도 널이면 기본페이지만 출력
		if(request.getParameter("jsonInfo") == null || request.getParameter("universitySel") == null || request.getParameter("busCategorySel") == null || request.getParameter("detailCategorySelect") == null){
			System.out.println("asdfdsfsdfsdklfjsdklfjlsdjfldsjflisdnjflksdjflksdjlkfsjlkfjsdlkfjsdlkfjsadlkfj");
			return "virtual/virtualBusStop";
		}
		
		
 
		try {
			 
            JSONParser jsonParser = new JSONParser();
             
            //JSON데이터를 넣어 JSON Object 로 만들어 준다.
            JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonInfo);
             
            //jsonInfo의 배열을 추출
            JSONArray jsonInfoArray = (JSONArray)jsonObject.get("busStop");
            
            //테이블에 존재하는 정류장 수정 해주는 작업
            for(int i=0; i<jsonInfoArray.size(); i++){
 
            	VirtualBusStopDTO dto = new VirtualBusStopDTO();
                //배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
                JSONObject busStopObject = (JSONObject) jsonInfoArray.get(i);
                 
                //JSON name으로 추출
                /*System.out.println("busstopInfo: seq==>"+busstopObject.get("seq"));
                System.out.println("busstopInfo: order==>"+busstopObject.get("order"));
                System.out.println("busstopInfo: name==>"+busstopObject.get("name"));
                System.out.println("busstopInfo: lat==>"+busstopObject.get("lat"));
                System.out.println("busstopInfo: lng==>"+busstopObject.get("lng"));
                System.out.println("busstopInfo: line==>"+busstopObject.get("line"));*/
                
                //추출한 데이터를 수정 또는 삽입해야함
                dto.setVirtualBusStopSeq((String)busStopObject.get("seq"));
                dto.setVirtualBusStopOrder((String)busStopObject.get("order"));
                dto.setVirtualBusStop((String)busStopObject.get("name"));
                dto.setVirtualBusStopLatitude((String)busStopObject.get("lat"));
                dto.setVirtualBusStopLongitude((String)busStopObject.get("lng"));
                dto.setVirtualBusStopLine((String)busStopObject.get("line"));
                dto.setBusStopDetailCategorySeq((String)detailCategorySelect);
                
                result1 = dao.saveVirtualBusStop(dto);
 
            }
            
            //result값 busStopOk로 넘김
            request.setAttribute("result1", result1);
            System.out.println(result1);
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		
		
		return "virtual/virtualBusStopOK";

	}
	
	
}
