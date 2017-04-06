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
import com.test.spring.dto.LocationDTO;
import com.test.spring.dto.NoticeDTO;
import com.test.spring.dto.SearchDTO;

@Controller("noticeController")
public class NoticeController {
	
	@Autowired
	private NoticeDAO dao;
	
	
	//공지사항 글 출력
	@RequestMapping(method={RequestMethod.GET}
					, value="/admin/notice/notice.action")
	public String notice(HttpServletRequest request,HttpSession session,HttpServletResponse response
								,String page
								,SearchDTO sdto){
		
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
		//System.out.println("컬럼 : "+column+" 워드 : "+word);
		
		//페이징 때문에 검색이 없으면 null 로 넘어감.
		if ((column != null && word != null) &&
				(!column.equals("null") && !word.equals("null"))) {
			
			String where = String.format("WHERE %s like '%%%s%%'", column, word);
			sdto.setWhereWord(where);
			
		}
		
		//페이징 하기위한 토탈 수
		totalCount = dao.getTotal(sdto);
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		//검색+시작값 DTO 넘김(****)
		List<NoticeDTO> alist = dao.alist(sdto);
		
		//페이지바 만들기
		String pageBar = "";
		
		loop = 1;	//페이지 번호를 만드는 루프 담당
		n = ((nowPage - 1) / blockSize) * blockSize + 1;	//페이지 번호 역할(시작 번호)
		
		pageBar += "<nav><ul class='pagination'>";
		if(n == 1) {
			pageBar += String.format("<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
		} else {
			pageBar += String.format("<li><a href='/spring/admin/notice/notice.action?page=%d&column=%s&word=%s' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>", n-1, column, word);
		}
		
		while (!(loop > blockSize || n > totalPage)) {
			//현재 보고 있는 페이지?
			if (n == nowPage) {
				pageBar += String.format("<li class='active'><a href='#'>%d</a></li>", n);
			} else {
				pageBar += String.format("<li><a href='/spring/admin/notice/notice.action?page=%d&column=%s&word=%s'>%d</a></li>", n, column, word, n);
			}
			
			n++;
			loop++;
			
		}//페이지 번호 while
		
		if (n > totalPage) {
			pageBar += String.format("<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
		} else {
			pageBar += String.format("<li><a href='/spring/admin/notice/notice.action?page=%d&column=%s&word=%s' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>", n, column, word);
		}
		
		pageBar += "</ul></nav>";
		
		request.setAttribute("alist", alist);
		request.setAttribute("sdto", sdto);
		request.setAttribute("pageBar", pageBar);
		
		//readcount 초기화!
		session.setAttribute("readcount","n");
		
		return "admin/notice/notice";
	}
	
	
	
	//공지사항 내용 가져옴
	@RequestMapping(method={RequestMethod.GET}
					, value="/admin/notice/noticeContent.action")
	public String noticeContent(HttpServletRequest request, HttpSession session, HttpServletResponse response
				,String seq){
		
		System.out.println(seq);
	
		// 공지사항 게시글 정보 가져오기
		List<NoticeDTO> noticeCount = dao.notice(seq);
		
		String content = noticeCount.get(0).getNoticeContent();
		String regdate = noticeCount.get(0).getNoticeRegdate().substring(0,16);
		String subject = noticeCount.get(0).getNoticeSubject();

		request.setAttribute("noticeCount", noticeCount);
		request.setAttribute("content", content);
		request.setAttribute("regdate", regdate);
		request.setAttribute("subject", subject);
		
		//System.out.println(session.getAttribute("readcount"));
		
		
	   //readcount 값 바꾸기, 조회수 추가
	   if(session.getAttribute("readcount")==null 
	            || session.getAttribute("readcount").equals("n")){
	         dao.addReadCount(seq);
	         session.setAttribute("readcount","y");
	         
	    System.out.println(session.getAttribute("readcount"));
	      }
		
		
		return "admin/notice/noticeContent";
	}
	
	//공지사항 내용 추가하기
	@RequestMapping(method={RequestMethod.GET}
					, value="/admin/notice/noticeAdd.action")
	@Transactional
	public String noticeAdd(HttpServletRequest request, HttpSession session, HttpServletResponse response){
		

		return "admin/notice/noticeAdd";
	}
	
	//공지사항 내용 추가하기
	@RequestMapping(method={RequestMethod.POST}
					, value="/admin/notice/noticeAddOk.action")
	@Transactional
	public String noticeAddOk(HttpServletRequest request, HttpSession session, HttpServletResponse response
			
			, String subject, String content){
		
		AdminUniversityDTO adto = (AdminUniversityDTO)session.getAttribute("adto");
		String adminID = adto.getAdminID();
		int result = dao.noticeAdd(subject,content,adminID);
		
		request.setAttribute("result", result);
		
		return "admin/notice/noticeAddOk";
	}
	
	//공지사항 내용 수정할 내용 가져오기
	@RequestMapping(method={RequestMethod.POST}
					, value="/admin/notice/noticeUpdate.action")
	@Transactional
	public String noticeUpdate(HttpServletRequest request, HttpSession session, HttpServletResponse response
				,String seq){
		
		
		// 공지사항 게시글 정보 가져오기
		List<NoticeDTO> noticeCount = dao.notice(seq);
		
		String content = noticeCount.get(0).getNoticeContent();
		String regdate = noticeCount.get(0).getNoticeRegdate().substring(0,16);
		String subject = noticeCount.get(0).getNoticeSubject();
		String status =  noticeCount.get(0).getNotisStatus();
		String noticeSeq = noticeCount.get(0).getNoticeSeq();
	
		request.setAttribute("noticeSeq", noticeSeq);
		request.setAttribute("content", content);
		request.setAttribute("regdate", regdate);
		request.setAttribute("subject", subject);
		request.setAttribute("status", status);

		return "admin/notice/noticeUpdate";
	}
	
	//공지사항 내용 수정하기
	@RequestMapping(method={RequestMethod.POST}
					, value="/admin/notice/noticeUpdateOk.action")
	@Transactional
	public String noticeUpdateOk(HttpServletRequest request, HttpSession session, HttpServletResponse response
				,String noticeSeq, String content, String subject, String status){
		
		System.out.println(noticeSeq);
		System.out.println(content);
		System.out.println(subject);
		System.out.println(status);
		
		int result = dao.noticeUpdate(noticeSeq,content,subject,status);
		
		request.setAttribute("result", result);

		return "admin/notice/noticeUpdateOk";
	}
	
	//공지사항 내용 삭제
	@RequestMapping(method={RequestMethod.GET}
					, value="/admin/notice/noticeDelete.action")
	@Transactional
	public String noticeDelete(HttpServletRequest request, HttpSession session, HttpServletResponse response
				,String noticeSeq){
		
		System.out.println(noticeSeq);
		
		int result = dao.noticeDelete(noticeSeq);
		
		request.setAttribute("result", result);
		
		return "admin/notice/noticeDelete";
	}
	

}
