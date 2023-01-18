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

import com.test.spring.admin.food.AdminFoodDAO;
import com.test.spring.dto.BusStopCategoryDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;
import com.test.spring.dto.CurrBusLocationDTO;
import com.test.spring.dto.FoodDTO;
import com.test.spring.dto.NoticeDTO;
import com.test.spring.dto.NoticeFileDTO;
import com.test.spring.dto.SearchDTO;
import com.test.spring.dto.UniversityDTO;
import com.test.spring.notice.NoticeDAO;

@Controller("MainController") // �뒪�봽留� 臾몃쾿
public class MainController {
	
	@Autowired // �옄�룞�쑝濡� �뿰寃고븳�떎.
	private MainDAO dao; // DAO no
	
	@Autowired
	private NoticeDAO noticeDao; //怨듭��궗�빆 dao
	
	@Autowired
	private AdminFoodDAO foodDao;
	
	@Autowired
	private BusStopMapDAO busStopMapDao; // �쁽�옱 踰꾩뒪媛� �룎�븘�떎�땲�뒗吏� �솗�씤�븯�뒗 dao
	
	
	@RequestMapping(method={RequestMethod.GET}, value="/index.action") // �뒪�봽留� 湲곕낯 援щ텇 而⑦듃濡ㅻ윭 癒몃━ 議깆뿉 �뱾�뼱媛��뒗 .
	public void index(HttpServletRequest request,HttpSession session,HttpServletResponse response) { // �슂泥� �쓳�떟 �몮�떎 媛��뒫... �꽭�뀡 濡쒓렇�씤�젙蹂닿컳��... 
		try {
	        
	        //�궡�슜
			
		
			String urlStr = request.getParameter("fromUrl");
			UniversityDTO universityDto;
			//�룄硫붿씤�뿉 �뵲瑜� universitySeq瑜� 媛��졇�샂
								
			if(session.getAttribute("universityDto") == null){ 
				//�룄硫붿씤�뿉 �뵲瑜� universitySeq瑜� 媛��졇�샂
		
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
			
	         //�궡�슜
			universityDto = (UniversityDTO) session.getAttribute("universityDto");
			
			if(universityDto==null){ 
				response.sendRedirect("/index.action");
				return "";
			}else{
				universitySeq = universityDto.getUniversitySeq();
			}
			
			
			//�씠�븰援먯뿉 �엳�뒗 �끂�꽑�쓣 硫붿씤 �솕硫댁뿉 �쓣�썙二쇱뼱�빞�븿
			//�끂�꽑紐⑸줉 �뱾怨좎샂.
			//怨듭��궗�빆紐⑸줉 �뱾怨좎샂.
			String word="";
			List<NoticeDTO> nList = dao.getAllNotice(word);
			List<CurrBusLocationDTO> cblList = busStopMapDao.getCurrBusStopLocation(universitySeq);
			
			request.setAttribute("nList", nList); // 怨듭��궗�빆 由ъ뒪�듃
			request.setAttribute("cblList", cblList); // �쁽�옱 �쐞移�
			
			String universityName = dao.getUniversityDtoSeq(universitySeq).getUniversityName(); // �쓬 ���븰援� �씠由꾩쓣 遺덈윭�삤�뒗嫄곗엫. 
			universityDto.setUniversityName(universityName);
			
			
			request.setAttribute("universityDto", universityDto); // �궇�뵪 api瑜� �쐞�빐 �븘�슂
			
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
			
			
			//�궡�슜
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
			//�씠�븰援먯뿉 �엳�뒗 �끂�꽑�쓣 硫붿씤 �솕硫댁뿉 �쓣�썙二쇱뼱�빞�븿
			//�끂�꽑紐⑸줉 �뱾怨좎샂.
			//怨듭��궗�빆紐⑸줉 �뱾怨좎샂.
			
			List<NoticeDTO> nList = dao.getAllNotice("");
			
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
	         
	         //�궡�슜
	         
	         
			
	         
	         
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
	
	

	
	//怨듭��궗�빆 �궡�슜 媛��졇�샂
	   @RequestMapping(method={RequestMethod.GET}
	               , value="/user/noticeView.action")
	   public String noticeContent(HttpServletRequest request, HttpSession session, HttpServletResponse response
	            ,String noticeSeq) throws IOException{

	      
		  String seq = noticeSeq;
	   
	      // 怨듭��궗�빆 寃뚯떆湲� �젙蹂� 媛��졇�삤湲�
	      NoticeDTO noticeContent = noticeDao.notice(seq);
	      String prevNoticeSeq = noticeDao.prevNoticeSeq(seq);
	      String afterNoticeSeq =noticeDao.afterNoticeSeq(seq);
	      
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
	      request.setAttribute("prevNoticeSeq", prevNoticeSeq);
	      request.setAttribute("afterNoticeSeq", afterNoticeSeq);
	      //readcount 媛� 諛붽씀湲�, 議고쉶�닔 異붽�
	      if(session.getAttribute("readcount")==null 
	               || session.getAttribute("readcount").equals("n")){
	    	  noticeDao.addReadCount(seq);
	            session.setAttribute("readcount","y");
	            
	       //System.out.println(session.getAttribute("readcount"));
	         }
	      
	      
	      return "user/noticeView";
	   }
	   
	 //怨듭��궗�빆 �궡�슜 媛��졇�샂
	   @RequestMapping(method={RequestMethod.GET}
	               , value="/user/noticeList.action")
	   public String noticeList(HttpServletRequest request, HttpSession session, HttpServletResponse response,String word ) throws IOException{
		   
		   if(word == null) {
			   word="";
		   }
		   List<NoticeDTO> nList = dao.getAllNotice(word);
		   
	  		request.setAttribute("nList", nList);
	      
	      return "user/noticeList";
	   }
	   
	   //�븷�꼸由ы떛�뒪�슜 �꽌�슱踰꾩뒪
	   @RequestMapping(method={RequestMethod.GET}
	   , value="/user/seoulBus.action")
	   public String seoulBus(HttpServletRequest request, HttpSession session, HttpServletResponse response
			  ) throws IOException{
		   
		
		   
		   return "user/seoulBus";
	   }
	   
	   
	   
	   //
	   @RequestMapping(method={RequestMethod.GET}, value="/food.action")
	   public String yiuFoodList(HttpServletRequest request, HttpSession session, HttpServletResponse response,
			   String universitySeq,
			   String menuLocation,
			   String date
			  ) throws IOException{
		   
		   UniversityDTO udto = (UniversityDTO) session.getAttribute("universityDto");
		   
		   List<FoodDTO> foodList = foodDao.getFoodListByDate(menuLocation, date);
		   System.out.println(foodList);
		   request.setAttribute("foodList", foodList);
		
		
		
		   return "user/getFoodCornerList";
	   }
	  
	   
	   

}
