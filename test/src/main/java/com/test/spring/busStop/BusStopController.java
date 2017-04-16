package com.test.spring.busStop;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.spring.dto.BusStopCategoryDTO;
import com.test.spring.dto.BusStopDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;
import com.test.spring.dto.UniversityDTO;
import com.test.spring.virtual.VirtualBusStopDAO;

@Controller("busStopController2")
public class BusStopController {

	
	
	@Autowired
	private BusStopDAO bdao;
	
	@Autowired
	private VirtualBusStopDAO vdao;
	
	@RequestMapping(method = { RequestMethod.GET }, value = "/busStop/busStop.action")
	public String busStop(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		try {
	         
			// 대학교 가져오기
			List<UniversityDTO> university = bdao.list();
			request.setAttribute("university", university);
			
			return "busStop/busStop";
	         
	         
	         
	      } catch (Exception e) {
	         session.invalidate();

	         try {
	            
	            response.sendRedirect("/spring/admin/adminLogin.action");

	         } catch (Exception e2) {
	            // TODO: handle exception

	         }
	         return null;
	      }

	}
	
	// MAP페이지
	@RequestMapping(method = { RequestMethod.GET }, value = "/busStop/universityMap.action")
	public String universityMap(HttpServletRequest request,HttpSession session,HttpServletResponse response, String seq, String bseq) {
		try {
	         
	         //내용
			System.out.println("seq"+seq);
			System.out.println("bseq"+bseq);
			// 대학교 가져오기
			if(seq != null){
				List<UniversityDTO> universityMap = bdao.universityMap(seq);
				request.setAttribute("universityMap", universityMap);
			}
			// 정류장 정보 가져오기
			if(bseq != null){
				List<BusStopDTO> busStop = bdao.busStop(bseq);
				request.setAttribute("busStop", busStop);
			}
			
			return "busStop/universityMap";
	         
	      } catch (Exception e) {
	         session.invalidate();

	         try {
	            
	            response.sendRedirect("/spring/admin/adminLogin.action");

	         } catch (Exception e2) {
	            // TODO: handle exception

	         }
	         return null;
	      }
	}
	
	@RequestMapping(method = { RequestMethod.GET }, value = "/busStop/busStopCategory.action")
	public String busStopCategory(HttpServletRequest request,HttpSession session,HttpServletResponse response, String seq) {
		try {
	         
	         //내용
			// 버스 종류 가져오기
			List<BusStopCategoryDTO> busStopCategory = bdao.busStopCategory(seq);
			
			request.setAttribute("busStopCategory", busStopCategory);
			
			return "busStop/busStopCategory";
	         
	         
	      } catch (Exception e) {
	         session.invalidate();

	         try {
	            
	            response.sendRedirect("/spring/admin/adminLogin.action");

	         } catch (Exception e2) {
	            // TODO: handle exception

	         }
	         return null;
	      }
		
	}
		
	
	@RequestMapping(method = { RequestMethod.GET }, value = "/busStop/busStopDetailCategory.action")
	public String busStopDetailCategory(HttpServletRequest request,HttpSession session,HttpServletResponse response, String seq) {
		try {
	         

			// 노선 종류 가져오기
			List<BusStopDetailCategoryDTO> busStopDetailCategory = bdao.busStopDetailCategory(seq);
			
			request.setAttribute("busStopDetailCategory", busStopDetailCategory);
			
			return "busStop/busStopDetailCategory";
	         
	         
	      } catch (Exception e) {
	         session.invalidate();

	         try {
	            
	            response.sendRedirect("/spring/admin/adminLogin.action");

	         } catch (Exception e2) {
	            // TODO: handle exception

	         }
	         return null;
	      }
	}
	
	@RequestMapping(method = { RequestMethod.GET }, value = "/busStop/busStopList.action")
	public String busStopList(HttpServletRequest request,HttpSession session,HttpServletResponse response, String seq) {
		try {
	         
			// 해당 노선의 정류장 리스트 가져오기
			List<BusStopDTO> busStopList = bdao.busStop(seq);
			
			request.setAttribute("busStopList", busStopList);
			
			return "busStop/busStopList";
	         
	         
	      } catch (Exception e) {
	         session.invalidate();

	         try {
	            
	            response.sendRedirect("/spring/admin/adminLogin.action");

	         } catch (Exception e2) {
	            // TODO: handle exception

	         }
	         return null;
	      }
	}

	//정류장 저장후 저장할 데이터를 날림
	@RequestMapping(method = { RequestMethod.POST }, value = "/busStop/busStopOK.action")
	@Transactional
	public String busStopOK(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		try {
	         
	         //내용
			int result1 = 1;
			int result2 = 1;
			int result3 = 1;
			// 대학교 가져오기
			List<UniversityDTO> university = bdao.list();
			request.setAttribute("university", university);
			
			String jsonInfo = "{\"busStop\""+request.getParameter("jsonInfo")+"}";
			String universitySel = request.getParameter("universitySel");
			String busCategorySel = request.getParameter("busCategorySel");
			String detailCategorySelect = request.getParameter("detailCategorySelect");
			String deleteSeq = request.getParameter("deleteSeq");
			
			//넘어오는게 하나라도 널이면 기본페이지만 출력
			if(request.getParameter("jsonInfo") == null || request.getParameter("detailCategorySelect") == null){
				return "busStop/busStop";
			}
			
			
			
			ArrayList<String> deleteSeqList = new ArrayList<String>();
			
			String temp[] = deleteSeq.split(",");
			System.out.println("temp크기"+temp.length);
			if(deleteSeq.equals("")){
				for(int i=0;i<temp.length-1;i++){
					deleteSeqList.add(temp[i]);
				}
			}else{
				for(int i=0;i<temp.length;i++){
					deleteSeqList.add(temp[i]);
				}
			}
			
			System.out.println(jsonInfo);
			System.out.println(universitySel);
			System.out.println(busCategorySel);
			System.out.println(detailCategorySelect);
			System.out.println(deleteSeq);
	 
			try {
				 
	            JSONParser jsonParser = new JSONParser();
	             
	            //JSON데이터를 넣어 JSON Object 로 만들어 준다.
	            JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonInfo);
	             
	            //jsonInfo의 배열을 추출
	            JSONArray jsonInfoArray = (JSONArray)jsonObject.get("busStop");
	            //System.out.println("busstop의 길이 : " + jsonInfoArray.size());
	            System.out.println(deleteSeqList.size());
	            for(int i=0; i<deleteSeqList.size() ; i++){
	            	result2 = bdao.updateLocation(deleteSeqList.get(i));
	            	result3 = bdao.deleteBusStop(deleteSeqList.get(i));
	            }
	            
	            //테이블에 존재하는 정류장 수정, 추가해주는 작업
	            for(int i=0; i<jsonInfoArray.size(); i++){
	 
	            	BusStopDTO dto = new BusStopDTO();
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
	                dto.setBusStopSeq((String)busStopObject.get("seq"));
	                dto.setBusStopOrder((String)busStopObject.get("order"));
	                dto.setBusStop((String)busStopObject.get("name"));
	                dto.setBusStopLatitude((String)busStopObject.get("lat"));
	                dto.setBusStopLongitude((String)busStopObject.get("lng"));
	                dto.setBusStopLine((String)busStopObject.get("line"));
	                dto.setBusStopDetailCategorySeq((String)detailCategorySelect);
	                
	                result1 = bdao.saveBusStop(dto);
	 
	            }
	            
	            
	            //정류장을 수정 저장하면서 가상정류장에 있는 해당 노선의 가상정류자응ㄹ 전부 지운다
	            vdao.deleteVirtualBusStop(detailCategorySelect);	            
	            
	            //정류장 리스트를 복사한다
	            List<BusStopDTO> copyList = vdao.copyBusStop(detailCategorySelect);
	            
	            //복사한 정류장을 가상정류장에 붙여 넣는다
	            for(int i=0;i<copyList.size();i++){
	            	vdao.pasteVirtualBusStop(copyList.get(i));
	            }
	            
	            
	            //deleteSeq에 있는 값을 이용해  busStop테이블에 delete쿼리문을 날린다
	            System.out.println("deleteseq사이즈 : "+deleteSeqList.size());
	            
	            //deleteSeq값 을 가지고 있는 location테이블의 외래키를 전부 null처리한다 
	          
	            //result값 busStopOk로 넘김
	            request.setAttribute("result1", result1);
	            request.setAttribute("result2", result2);
	            request.setAttribute("result3", result3);
	            System.out.println(result1);
	            System.out.println(result2);
	            System.out.println(result3);
	        } catch (ParseException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	 

			
			
			return "busStop/busStopOk";
	         
	         
	         
	         
	      } catch (Exception e) {
	         session.invalidate();

	         try {
	            
	            response.sendRedirect("/spring/admin/adminLogin.action");

	         } catch (Exception e2) {
	            // TODO: handle exception

	         }
		return null;
	      }
		
	}
	
	//정류장 수정처리페이지 이동
	@RequestMapping(method = { RequestMethod.GET }, value = "/busStop/updateOrder.action")
	@Transactional
	public String updateOrder(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		try {
	         
	         //내용
			String detailCategorySel = request.getParameter("detailCategorySel");
			
			
			System.out.println(detailCategorySel);
			
			List<BusStopDTO> busStopList = bdao.busStop(detailCategorySel);
			
			request.setAttribute("busStopList", busStopList);
			request.setAttribute("detailCategorySel", detailCategorySel);
	         
	         
	         
	         
	      } catch (Exception e) {
	         session.invalidate();

	         try {
	            
	            response.sendRedirect("/spring/admin/adminLogin.action");

	         } catch (Exception e2) {
	            // TODO: handle exception

	         }
		return null;
	      }
		
		return "busStop/updateOrder";
	}

	//정류장 순서수정처리페이지 이동
	@RequestMapping(method = { RequestMethod.POST }, value = "/busStop/updateOrderOK.action")
	@Transactional
	public String updateOrderOK(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		try {
	         
	         //내용
			String jsonInfo = "{\"busStop\""+request.getParameter("jsonInfo")+"}";
			String detailCategorySel = request.getParameter("detailCategorySel");
			
			
			
			System.out.println(jsonInfo);
			System.out.println(detailCategorySel);
	 
			try {
				 
	            JSONParser jsonParser = new JSONParser();
	             
	            //JSON데이터를 넣어 JSON Object 로 만들어 준다.
	            JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonInfo);
	             
	            //jsonInfo의 배열을 추출
	            JSONArray jsonInfoArray = (JSONArray)jsonObject.get("busStop");
	            //System.out.println("busstop의 길이 : " + jsonInfoArray.size());
	 
	            
	            //테이블에 존재하는 정류장 수정, 추가해주는 작업
	            for(int i=0; i<jsonInfoArray.size(); i++){
	 
	            	BusStopDTO dto = new BusStopDTO();
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
	                dto.setBusStopSeq((String)busStopObject.get("seq"));
	                dto.setBusStopOrder((String)busStopObject.get("order"));
	                dto.setBusStop((String)busStopObject.get("name"));
	                dto.setBusStopLatitude((String)busStopObject.get("lat"));
	                dto.setBusStopLongitude((String)busStopObject.get("lng"));
	                dto.setBusStopLine((String)busStopObject.get("line"));
	                dto.setBusStopDetailCategorySeq((String)detailCategorySel);
	                
	                int orderResult = bdao.saveBusStop(dto);
	                
	                request.setAttribute("orderResult", orderResult);
	            }
	            request.setAttribute("detailCategorySel", detailCategorySel);
	            return "busStop/updateOrderOK";
	            
	        } catch (ParseException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	 

			
	        return "busStop/updateOrder";

	         
	         
	         
	         
	      } catch (Exception e) {
	         session.invalidate();

	         try {
	            
	            response.sendRedirect("/spring/admin/adminLogin.action");

	         } catch (Exception e2) {
	            // TODO: handle exception

	         }
		return null;
	      }
		
	}
	


	
}
