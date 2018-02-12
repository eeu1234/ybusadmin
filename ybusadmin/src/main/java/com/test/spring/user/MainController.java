package com.test.spring.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.spring.dto.BusStopCategoryDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;
import com.test.spring.dto.NoticeDTO;
import com.test.spring.dto.NoticeFileDTO;
import com.test.spring.dto.UniversityDTO;
import com.test.spring.notice.NoticeDAO;

@Controller("MainController")
public class MainController {
	
	@Autowired
	private MainDAO dao;
	
	@Autowired
	private NoticeDAO noticeDao;
	
	
	@RequestMapping(method={RequestMethod.GET}, value="/index.action")
	public void index(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		try {
	        
	        //내용
			
		
			String urlStr = request.getParameter("fromUrl");
			UniversityDTO universityDto;
			//도메인에 따른 universitySeq를 가져옴
		
			if(session.getAttribute("universityDto") == null){
				//도메인에 따른 universitySeq를 가져옴
		
				universityDto = dao.getUniversitySeq(urlStr);
				
//				String universitySeq = universityDto.getUniversitySeq() ;
				
				if(universityDto==null){
		
					RequestDispatcher dispatcher = request.getRequestDispatcher("./selectUniversity.action");
					dispatcher.forward(request, response);
				
				}else{
		
					session.setAttribute("universityDto", universityDto);
					
					request.setAttribute("universitySeq", universityDto.getUniversitySeq());
				
					try {
		
						RequestDispatcher dispatcher = request.getRequestDispatcher("/mainIndex.action");			
						//response.sendRedirect("/spring/mainIndex.action");
						dispatcher.forward(request, response);
						
					} catch (IOException e) {
		
						e.printStackTrace();
					} catch (ServletException e) {
						// TODO Auto-generated catch block
		
						e.printStackTrace();
					}
				}
				
		
				
			}else{
		
				RequestDispatcher dispatcher = request.getRequestDispatcher("/mainIndex.action");			
				//response.sendRedirect("/spring/mainIndex.action");
				dispatcher.forward(request, response);
			}
			//System.out.println("universitySeq==="+universitySeq);
			
			
			
			
     } catch (Exception e) {
    	 e.printStackTrace();
	        session.invalidate();
	        try {
	    
	           response.sendRedirect("./selectUniversity.action");
	           
	           return;
	        } catch (Exception e2) {
	           // TODO: handle exception
	    
	        	e2.printStackTrace();
	        }
	     }
		
		
	}
	
	@RequestMapping(method={RequestMethod.GET}, value="/uploadUniversity.action")
	public void uploadUniversity(HttpServletRequest request, HttpSession session, HttpServletResponse response, String universitySeq,String oldVersion){
		
		
		UniversityDTO universityDTO = new UniversityDTO();
		
		if(universitySeq!=null){
			
			
			universityDTO = dao.getUniversityDtoSeq(universitySeq);
			session.setAttribute("universityDto", universityDTO);
			
			
			try{
				if(oldVersion==null){
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("/mainIndex.action");			
					dispatcher.forward(request, response);
				}else {
					RequestDispatcher dispatcher = request.getRequestDispatcher("/mainIndex2017.action");			
					dispatcher.forward(request, response);
					
				}
					
				//response.sendRedirect("/spring/mainIndex.action");
			}catch(Exception e){
				e.toString();
			}
			
		}else{
			try{
			
				RequestDispatcher dispatcher = request.getRequestDispatcher("/selectUniversity.action");
				dispatcher.forward(request, response);
			}catch(Exception e){
				e.toString();
			}
		}
		
	}
	
	
	@RequestMapping(method={RequestMethod.GET}, value="/mainIndex.action")
	public String mainIndex(HttpServletRequest request, HttpSession session, HttpServletResponse response, String universitySeq,String busStopCategorySeq,UniversityDTO universityDto){
		
		try {
			
			
	         //내용
			universityDto = (UniversityDTO) session.getAttribute("universityDto");
			
			if(universityDto==null){
				response.sendRedirect("/index.action");
				return "";

				
			}else{
				
				universitySeq = universityDto.getUniversitySeq();
			
			}
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
	
			request.setAttribute("bsdcList", bsdcList);
			request.setAttribute("bscList", bscList);
			request.setAttribute("universityDto", universityDto);
			
			return "user/mainIndex";
			
	         
	      } catch (Exception e) {
	    	  System.out.println(e.toString());
	         session.invalidate();
	         try {
	        
	        	response.sendRedirect("/selectUniversity.action");
	            return "";
	         } catch (Exception e2) {
	            // TODO: handle exception
	        	 System.out.println(e2.toString());
	        
	        	 return "";
	         }
	      }
		
	}
	
	@RequestMapping(method={RequestMethod.GET}, value="/mainIndex2017.action")
	public String mainIndex2017(HttpServletRequest request, HttpSession session, HttpServletResponse response, String universitySeq,String busStopCategorySeq,UniversityDTO universityDto){
		
		try {
			
			
			//내용
			universityDto = (UniversityDTO) session.getAttribute("universityDto");
			
			if(universityDto==null){
				response.sendRedirect("/index.action");
				return "";
				
				
			}else{
				
				universitySeq = universityDto.getUniversitySeq();
				
			}
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
			
			request.setAttribute("bsdcList", bsdcList);
			request.setAttribute("bscList", bscList);
			request.setAttribute("universityDto", universityDto);
			
			return "user/mainIndex2017";
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
			session.invalidate();
			try {
				
				response.sendRedirect("/selectUniversity.action");
				return "";
			} catch (Exception e2) {
				// TODO: handle exception
				System.out.println(e2.toString());
				
				return "";
			}
		}
		
	}
	
	@RequestMapping(method={RequestMethod.GET},value="/user/makeIcon.action")
	public String makeIcon(HttpServletRequest request,HttpSession session,HttpServletResponse response){
		
		try {
	         
	         //내용
	         
	         
			
	         
	         
	      } catch (Exception e) {
	         session.invalidate();
	         try {
	            
	        	 response.sendRedirect("/selectUniversity.action");
	        	 return "";
	         } catch (Exception e2) {
	            // TODO: handle exception
	         }
	      }

		return "user/makeIcon";
		
	}
	
	@RequestMapping(method={RequestMethod.GET},value="/selectUniversity.action")
	public String selectUniversity(HttpServletRequest request, HttpSession session, HttpServletResponse response){
		try {
			List<UniversityDTO> uniList = dao.getAllUniversity();
			
			
			request.setAttribute("uniList", uniList);
			return "user/selectUniversity";
			
		} catch (Exception e) {
			// TODO: handle exception
			return "user/mainIndex";
		}
	}
	
	

	
	//공지사항 내용 가져옴
	   @RequestMapping(method={RequestMethod.GET}
	               , value="/user/noticeView.action")
	   public String noticeContent(HttpServletRequest request, HttpSession session, HttpServletResponse response
	            ,String noticeSeq) throws IOException{
	      
	      
		  String seq = noticeSeq;
	   
	      // 공지사항 게시글 정보 가져오기
	      NoticeDTO noticeContent = noticeDao.notice(seq);

	      
	      List<NoticeFileDTO> listFileType = new ArrayList<NoticeFileDTO>();
	      for(int i=0; i<noticeContent.getFilelist().size(); i++){
	         
	         String str = noticeContent.getFilelist().get(i).getNoticeFileName();
	         String[] ddd = str.split("\\.");
	         
	         NoticeFileDTO fileNameDto = new NoticeFileDTO();
	         fileNameDto.setNoticeFileName(str);
	         fileNameDto.setNoticeFileType(ddd[1]);
	         listFileType.add(fileNameDto);
	      }
	      
	      noticeContent.setFilelist(listFileType);
	     
	      request.setAttribute("noticeContent", noticeContent);
	      
	      
	      //readcount 값 바꾸기, 조회수 추가
	      if(session.getAttribute("readcount")==null 
	               || session.getAttribute("readcount").equals("n")){
	    	  noticeDao.addReadCount(seq);
	            session.setAttribute("readcount","y");
	            
	       System.out.println(session.getAttribute("readcount"));
	         }
	      
	      
	      return "user/noticeView";
	   }
	   
	   
	   //애널리틱스용 서울버스
	   @RequestMapping(method={RequestMethod.GET}
	   , value="/user/seoulBus.action")
	   public String seoulBus(HttpServletRequest request, HttpSession session, HttpServletResponse response
			  ) throws IOException{
		   
		
		   
		   return "user/seoulBus";
	   }
	   
	   
	   
	   //용인대학교 학식 크롤링 
	   @RequestMapping(method={RequestMethod.GET}, value="/user/yiuFood.action")
	   public String yiuFood(HttpServletRequest request, HttpSession session, HttpServletResponse response,String universitySeq,String searchValue,String typeValue
			  ) throws IOException{
		   System.out.println(universitySeq);
		   
		   UniversityDTO udto = (UniversityDTO) session.getAttribute("universityDto");
		   
		
		if(searchValue == null) {
			
		}else if(searchValue.equals("1") || searchValue.equals("2") || searchValue.equals("3")) {
			//용인대 학식 파싱
			org.jsoup.nodes.Document doc = Jsoup.connect("http://mt.yongin.ac.kr/life/menu?searchValue="+searchValue).get();
			Elements table = doc.select(".tableType1");
		//	System.out.println(table.toString());
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(table.toString().replace("(메뉴는 식자재 수급사정 상 변동될 수 있음을 양해부탁드립니다. 원산지는 식당 내 게시된 메뉴표를 참조하여 주시기 바랍니다.)", ""));
			return null;
		}
		else if(typeValue != null) {
				//명지대 학식 파싱
			   org.jsoup.nodes.Document doc = Jsoup.connect("http://www.mju.ac.kr/mbs/mjukr/jsp/restaurant/restaurant.jsp?configIdx="+typeValue+"&id=mjukr_="+searchValue).get();
			   System.out.println(searchValue+"///////////////////////"+typeValue);
			   Elements table = doc.select(".sub");
			   	System.out.println(table.toString());
			   response.setCharacterEncoding("utf-8");
			   response.getWriter().print(table.toString().replace("(메뉴는 식자재 수급사정 상 변동될 수 있음을 양해부탁드립니다. 원산지는 식당 내 게시된 메뉴표를 참조하여 주시기 바랍니다.)", ""));
			   return null;
		   }
		
		
		
		
		
		
		
		
		
		
			request.setAttribute("universityDto", udto);
		
		
		   return "user/yiuFood";
	   }
}
