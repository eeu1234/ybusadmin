package com.test.spring.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.spring.dto.AdminDTO;
import com.test.spring.dto.AdminUniversityDTO;
import com.test.spring.dto.SearchDTO;
import com.test.spring.dto.UniversityDTO;

@Controller("adminManageController")
public class AdminManageController {
	
	@Autowired
	private AdminDAO dao;
	
	//admin 관리 메인 페이지로 이동, 모든 대학 관리자 내역 가져옴
	@RequestMapping(method={RequestMethod.GET}
					, value="/admin/adminManage.action")
	public String adminManagelist(HttpServletRequest request,HttpSession session,HttpServletResponse response
								,String page
								,SearchDTO sdto){
		try {
			//페이징 -> 게시판의 꽃
			int nowPage = 0;			//현재 페이지 번호
			int totalCount = 0;			//총 게시물 수
			int pageSize = 10;			//한 페이지에 보여줄 게시물 수(LIMIT의 2번째 인자값사용?)
			int totalPage = 0;			//총 페이지 수
			int start = 0;				//LIMIT 조건에 사용될 시작값
			
			int n = 0, loop = 0;		//페이지바에 사용
			int blockSize = 10;
			
			if (page == null) {
				nowPage = 1;		//그냥 들어오면 무조건 첫페이지를 보여주자.
			} else {
				nowPage = Integer.parseInt(page);
			}
			
			//nowPage -> start 범위 계산
			//1page -> 0, 10(LIMIT)
			//2page -> 10, 10
			start = ((nowPage - 1) * pageSize);
			//dto 에 시작값 넣기
			sdto.setStart(start);
			
			//검색했는지 확인
			String column = sdto.getColumn();
			String word = sdto.getWord();
			System.out.println("컬럼 : "+column+" 워드 : "+word);
			
			//페이징 때문에 검색이 없으면 null 로 넘어감.
			if ((column != null && word != null) &&
					(!column.equals("null") && !word.equals("null"))) {
				
				String where = String.format("WHERE %s like '%%%s%%'", column, word);
				sdto.setWhereWord(where);
				
			}
			
			//페이징 하기위한 토탈 수
			totalCount = dao.getTotal(sdto);
			totalPage = (int)Math.ceil((double)totalCount / pageSize);
			
			//검색+시작값 DTO 넘김
			List<AdminDTO> alist = dao.alist(sdto);
			
			//페이지바 만들기
			String pageBar = "";
			
			loop = 1;	//페이지 번호를 만드는 루프 담당
			n = ((nowPage - 1) / blockSize) * blockSize + 1;	//페이지 번호 역할(시작 번호)
			
			pageBar += "<nav><ul class='pagination'>";
			if(n == 1) {
				pageBar += String.format("<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
			} else {
				pageBar += String.format("<li><a href='/spring/admin/adminManage.action?page=%d&column=%s&word=%s' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>", n-1, column, word);
			}
			
			while (!(loop > blockSize || n > totalPage)) {
				//현재 보고 있는 페이지?
				if (n == nowPage) {
					pageBar += String.format("<li class='active'><a href='#'>%d</a></li>", n);
				} else {
					pageBar += String.format("<li><a href='/spring/admin/adminManage.action?page=%d&column=%s&word=%s'>%d</a></li>", n, column, word, n);
				}
				
				n++;
				loop++;
				
			}//페이지 번호 while
			
			if (n > totalPage) {
				pageBar += String.format("<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
			} else {
				pageBar += String.format("<li><a href='/spring/admin/adminManage.action?page=%d&column=%s&word=%s' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>", n, column, word);
			}
			
			pageBar += "</ul></nav>";
			
			request.setAttribute("alist", alist);
			request.setAttribute("sdto", sdto);
			request.setAttribute("pageBar", pageBar);
			
			return "admin/adminManage";
		} catch (Exception e) {
			session.invalidate();

			try {
				            
				response.sendRedirect("/spring/admin/adminLogin.action");
				
				} catch (Exception e2) {
				
				}
			return null;
		}
	}
	
	
	
	
	//admin 마이페이지 정보 가져오기
	@RequestMapping(method={RequestMethod.GET}
		, value="/admin/adminMypage.action")
	public String adminMypage(HttpServletRequest request,HttpSession session,HttpServletResponse response,String adminID){
		try {
			AdminDTO dto = dao.getadmin(adminID);
			
			request.setAttribute("dto", dto);
			
			return "admin/adminMypage";
		} catch (Exception e) {
			session.invalidate();
	
			try {
				            
				response.sendRedirect("/spring/admin/adminLogin.action");
				
				} catch (Exception e2) {
				
				}
			return null;
		}
	}
	
	
	
	
	//admin 계정 수정 시 정보 가져오기
	@RequestMapping(method={RequestMethod.GET}
		, value="/admin/adminUpdate.action")
	public String adminupdate(HttpServletRequest request,HttpSession session,HttpServletResponse response
					,String adminID
					,String my){
		try {	
			AdminDTO dto = dao.getadmin(adminID);
	
			request.setAttribute("my", my);
			request.setAttribute("dto", dto);
			
			return "admin/adminUpdate";
		} catch (Exception e) {
			session.invalidate();

			try {
				            
				response.sendRedirect("/spring/admin/adminLogin.action");
				
				} catch (Exception e2) {
				
				}
			return null;
		}
	}
	
	//admin 계정 수정 페이지에서 기존 비밀번호 입력시 확인하는 메서드
	@RequestMapping(method={RequestMethod.GET}
					, value="/admin/adminBeforePwCheck.action")
	public String adminBeforePwCheck(HttpServletRequest request
								,HttpSession session
								,HttpServletResponse response
								,String checkPw){
		try {
			//System.out.println("기존 비밀번호는 현재 -> " + checkPw);
			//Id 가져오기
			AdminUniversityDTO checkDto = (AdminUniversityDTO)session.getAttribute("adto");
			checkDto.setAdminPassword(checkPw);
			
			//기존 비밀번호 확인하는 dao 실행.
			int result = dao.checkBeforePw(checkDto);
			
			//System.out.println("기존 비밀번호 확인 1 또는 0 결과값은 -> "+result);
			
			//결과값 전송
			request.setAttribute("result", result);
			
			return "admin/adminBeforePwCheck";
		} catch (Exception e) {
			session.invalidate();
	
			try {
				            
				response.sendRedirect("/spring/admin/adminLogin.action");
				
				} catch (Exception e2) {
				
				}
			return null;
		}
	}
	
	//admin 계정 수정 내용 업데이트
	@RequestMapping(method={RequestMethod.POST, RequestMethod.GET}
		, value="/admin/adminUpdateOk.action")
	public String adminupdateok(HttpServletRequest request,HttpSession session,HttpServletResponse response
					,AdminDTO dto
					,String my){
		try {
			int result;
			
			if(dto.getAdminPassword() == null || dto.getAdminPassword().equals("")){ 
				//최고관리자용
				result = dao.getupdate2(dto);
			}else{
				//일반관리자용
				result = dao.getupdate(dto);
			}
			
			request.setAttribute("my", my);
			request.setAttribute("result", result);
			
			return "admin/adminUpdateOk";
		} catch (Exception e) {
			session.invalidate();

			try {
				            
				response.sendRedirect("/spring/admin/adminLogin.action");
				
				} catch (Exception e2) {
				
				}
			return null;
		}
	}
	
	//admin 계정 삭제
	@RequestMapping(method={RequestMethod.GET}
		, value="/admin/adminDelete.action")
	@Transactional
	public String adminDelete(HttpServletRequest request,HttpSession session,HttpServletResponse response
					,String adminID){
		try {
			int result = dao.admindelete(adminID);
			
			request.setAttribute("result", result);
			
			return "admin/adminDelete";
		} catch (Exception e) {
			session.invalidate();
	
			try {
				            
				response.sendRedirect("/spring/admin/adminLogin.action");
				
				} catch (Exception e2) {
				
				}
			return null;
		}
	}
	
	//admin 계정 생성 시 대학 카테고리 가져오기
	@RequestMapping(method={RequestMethod.GET}
		, value="/admin/adminAdd.action")
	public String adminAdd(HttpServletRequest request,HttpSession session,HttpServletResponse response){
		try {
			List<UniversityDTO> ulist = dao.universitylist();
			
			request.setAttribute("ulist", ulist);
			
			return "admin/adminAdd";
		} catch (Exception e) {
			session.invalidate();

			try {
				            
				response.sendRedirect("/spring/admin/adminLogin.action");
				
				} catch (Exception e2) {
				
				}
			return null;
		}
	}
	
	//계정 생성 아이디 유효성 확인
	@RequestMapping(method={RequestMethod.GET}
		, value="/admin/adminIdCheck.action")
	public String adminidcheck(HttpServletRequest request,HttpSession session,HttpServletResponse response
					,String adminID){
		try {
			int result = dao.checkid(adminID);
			
			request.setAttribute("result", result);
			
			return "admin/adminIdCheck";
		} catch (Exception e) {
			session.invalidate();
	
			try {
				            
				response.sendRedirect("/spring/admin/adminLogin.action");
				
				} catch (Exception e2) {
				
				}
			return null;
		}
	}
	
	//계정 생성 확인
	@RequestMapping(method={RequestMethod.POST, RequestMethod.GET}
		, value="/admin/adminAddOk.action")
	@Transactional
	public String adminaddok(HttpServletRequest request,HttpSession session,HttpServletResponse response
					,AdminDTO dto){
		try {
			int result = dao.adminadd(dto);
			
			request.setAttribute("result", result);
			
			return "admin/adminAddOk";
		} catch (Exception e) {
			session.invalidate();

			try {
				            
				response.sendRedirect("/spring/admin/adminLogin.action");
				
				} catch (Exception e2) {
				
				}
			return null;
		}
	}	
	
}