package com.test.spring.university;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.test.spring.dto.UniversityDTO;

@Controller("universityController")
public class UniversityController {
	
	@Autowired
	private UniversityDAO dao;
	
	
	String path = "";   //업로드 경로!!
	
	//대학 관리 메인
	@RequestMapping(method={RequestMethod.GET}, value="/university/universityCrud.action")
	public String universityMain(HttpServletRequest request,HttpSession session,HttpServletResponse response){
		try{
			return "university/universityCrud";
		} catch (Exception e) {
			session.invalidate();
			try {
	            
				response.sendRedirect("/spring/admin/adminLogin.action");
				

			} catch (Exception e2) {
			
			}
			
			return null;
		}
	}
	
	
	//대학교 리스트
	@RequestMapping(method = { RequestMethod.GET }, value = "/university/universityList.action")
	public String universityList(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		try{
			List<UniversityDTO> ulist = dao.universityList();
			
			request.setAttribute("ulist", ulist);
			
			return "university/universityList";
		} catch (Exception e) {
			session.invalidate();
			try {
	            
				response.sendRedirect("/spring/admin/adminLogin.action");
				

			} catch (Exception e2) {
			
			}
			
			return null;
		}
	}
	
	
	
	//대학교 수정으로 이동시 필요한 정보 가져오기
	@RequestMapping(method = { RequestMethod.GET }, value = "/university/universityEdit.action")
	public String universityEdit(HttpServletRequest request,HttpSession session,HttpServletResponse response, String seq) {
		
		UniversityDTO udto = new UniversityDTO();
		try{
			udto.setUniversitySeq(seq);
			udto = dao.universityGet(seq);
			
			request.setAttribute("udto", udto);
			
			return "university/universityEdit";
		} catch (Exception e) {
			session.invalidate();
			try {
	            
				response.sendRedirect("/spring/admin/adminLogin.action");
				

			} catch (Exception e2) {
			
			}
			
			return null;
		}
	}
	
	
	
	//대학교 수정
	@RequestMapping(method = { RequestMethod.POST }, value = "/university/universityEditOk.action")
	public String universityEditOk(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		
		UniversityDTO udto = new UniversityDTO();
		try{
			udto.setUniversitySeq(request.getParameter("universitySeq"));
			udto.setUniversityName(request.getParameter("universityName"));
			udto.setUniversityTel(request.getParameter("universityTel"));
			System.out.println(request.getParameter("universityTel"));
			udto.setUniversityLatitude(request.getParameter("universityLatitude"));
			udto.setUniversityLongitude(request.getParameter("universityLongitude"));
			udto.setUniversityDomain(request.getParameter("universityDomain"));
	
			MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;
			MultipartFile mfile = multi.getFile("universityImg");
			
			if(!mfile.isEmpty()){
				
				
				String temp = getFileName(mfile.getOriginalFilename());
				
				 path = request.getRealPath("/images/logo/");
				File file = new File (path+temp);
				
				try {
					
					mfile.transferTo(file); //파일 업로드 실행
					
				} catch (Exception e) {
					System.out.println(e.toString());
				}
				
				udto.setUniversityImg(temp);
				
			}
			
			
			
			int result = dao.universityEdit(udto);
			request.setAttribute("result", result);
			
			return "university/universityEditOk";
		} catch (Exception e) {
			session.invalidate();
			try {
	            
				response.sendRedirect("/spring/admin/adminLogin.action");
				

			} catch (Exception e2) {
			
			}
			
			return null;
		}
	}
	
	//대학교 추가로 이동
	@RequestMapping(method = { RequestMethod.GET }, value = "/university/universityAdd.action")
	public String universityAdd(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		try{
			return "university/universityAdd";
		} catch (Exception e) {
			session.invalidate();
			try {
	            
				response.sendRedirect("/spring/admin/adminLogin.action");
				

			} catch (Exception e2) {
			
			}
			
			return null;
		}
	}
	
	
	//대학교 추가
	@RequestMapping(method = { RequestMethod.POST }, value = "/university/universityAddOk.action")
	public String universityAddOk(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		
		
		UniversityDTO udto = new UniversityDTO();
		try{
			udto.setUniversityName(request.getParameter("universityName"));
			udto.setUniversityTel(request.getParameter("universityTel"));
			udto.setUniversityLatitude(request.getParameter("universityLatitude"));
			udto.setUniversityLongitude(request.getParameter("universityLongitude"));
			udto.setUniversityDomain(request.getParameter("universityDomain"));
			
			MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;
			MultipartFile mfile = multi.getFile("universityImg");
			
			if(!mfile.isEmpty()){
				
				
				String temp = getFileName(mfile.getOriginalFilename());
				
				
				File file = new File ("D:\\"+temp);
				
				try {
					
					mfile.transferTo(file); //파일 업로드 실행
					
				} catch (Exception e) {
					System.out.println(e.toString());
				}
				
				udto.setUniversityImg(temp);
				
			}
			
			
			
			int result = dao.universityAdd(udto);
			
			request.setAttribute("result", result);
	
			
			return "university/universityAddOk";
		} catch (Exception e) {
			session.invalidate();
			try {
	            
				response.sendRedirect("/spring/admin/adminLogin.action");
				

			} catch (Exception e2) {
			
			}
			
			return null;
		}
	}
	
	private String getFileName(String filename) {

		int n = 1;
		int index = filename.lastIndexOf(".");
		String name = filename.substring(0,index);
		String ext = filename.substring(index);//.txt
		
			while(true){
			File file = new File("D:\\"+filename);
			
			if(file.exists()){
				//홍길동.txt
				filename= name +"_" + n + ext;	//홍길동_1.txt
				n++;
				
			} else {
				
				return file.getName();
				
			}
		
		}
	}


	//대학교 삭제
	@RequestMapping(method = { RequestMethod.GET }, value = "/university/universityDel.action")
	@Transactional
	public String universityDel(HttpServletRequest request,HttpSession session,HttpServletResponse response, String seq) {
		try{
			int result = dao.universityDel(seq);
			
			request.setAttribute("result", result);
			
			return "university/universityDeleteOk";
		} catch (Exception e) {
			//여기서 세션을 날리면 로그아웃 처리됨.
			//session.invalidate();
			try {
				
				request.setAttribute("result", 0);
				//실패했다고 보내주자.
				return "university/universityDeleteOk";
				

			} catch (Exception e2) {
			
			}
			
			return null;
		}
	}
	
	
	
	
	
	
}
