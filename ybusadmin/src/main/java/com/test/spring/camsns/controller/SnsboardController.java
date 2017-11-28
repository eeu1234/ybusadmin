package com.test.spring.camsns.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.test.spring.camsns.DAO.SnsCategoryDAO;
import com.test.spring.camsns.DAO.SnsboardDAO;
import com.test.spring.camsns.DAO.SnscommentDAO;
import com.test.spring.dto.UniversityDTO;
import com.test.spring.dto.camsns.CategoryDTO;
import com.test.spring.dto.camsns.SnsboardCategoryDTO;
import com.test.spring.dto.camsns.SnsboardDTO;
import com.test.spring.dto.camsns.SnsboardfileDTO;
import com.test.spring.dto.camsns.SnscommentDTO;
import com.test.spring.camsns.DAO.SnsUniversityDAO;




@Controller("SnsboardController")
public class SnsboardController {

	@Autowired
	private SnsboardDAO boardDao;

	@Autowired
	private SnsCategoryDAO categoryDao;

	@Autowired
	private SnsUniversityDAO universityDao;
	
	
	@Autowired
	private SnscommentDAO commDao;

	
	String universitySeq ="";
	UniversityDTO universityDto = new UniversityDTO();
	
	
	String path = "";

	// 메인페이지
	@RequestMapping(value = "/camsns/snsMain.action", method = RequestMethod.GET)
	public String main(HttpServletRequest request
						,HttpSession session
						, HttpServletResponse response
						, String num
						, String word
						, String universitySeq)
			throws IOException {
		// 톰캣경로설정
		path = request.getRealPath("/images/camsns/board/");
		System.out.println(path);
		// 그냥 로딩 word = null

		
		
		//universitySeq = "1";
		
		if(session.getAttribute("universityDto") != null){
			universityDto = (UniversityDTO) session.getAttribute("universityDto");
			universitySeq = universityDto.getUniversitySeq();
			
			
			
		}else{
			if(universitySeq == null || universitySeq == ""){
				response.sendRedirect("../selectUniversity.action");
				
			}else{
				universityDto.setUniversitySeq(universitySeq);
				session.setAttribute("universityDto", universityDto);
			}
			
		
		
		}
		
		
		
		// 총 게시물 수
		int cntList = boardDao.countList(universitySeq, word);
		request.setAttribute("cntList", cntList);

		// System.out.println("글갯수" + cntList);
		if (num == null && word == null) {// 첫 로딩시 //num 파라메터가 없다



			num = "0"; // 0부터 5개 게시글

			// 글불러옴
			List<SnsboardCategoryDTO> boardDtoList = boardDao.boardList(universitySeq, num, word);

			for (int i = 0; i < boardDtoList.size(); i++) {// 게시글 갯수
				for (int j = 0; j < boardDtoList.get(i).getFilelist().size(); j++) {

					System.out.println(boardDtoList.get(i).getFilelist().get(j).getSnsboardfileFileName());
				}
			}

			request.setAttribute("boardDtoList", boardDtoList);

			return "/camsns/main";
		
		} else {// 다음 로딩시
			System.out.println("다음로딩");
			if (num == null)
				num = "0";

			List<SnsboardCategoryDTO> boardDtoList = boardDao.boardList(universitySeq, num, word);
			// System.out.println(boardDtoList.size());//

			JSONArray list = new JSONArray();

			for (int i = 0; i < boardDtoList.size(); i++) {
				JSONObject obj = new JSONObject();
				obj.put("boardSeq", boardDtoList.get(i).getSnsboardSeq());// 글번호
				obj.put("boardSubject", boardDtoList.get(i).getSnsboardSubject());// 글제목
				obj.put("boardContent", boardDtoList.get(i).getSnsboardContent());// 글내용
				obj.put("boardRegdate", boardDtoList.get(i).getSnsboardRegdate());// 글등록날짜
				obj.put("category", boardDtoList.get(i).getCategoryType());// 카테고리
																			// 타입

				JSONArray list2 = new JSONArray();// 파일을위한 배열

				for (int j = 0; j < boardDtoList.get(i).getFilelist().size(); j++) {
					JSONObject obj2 = new JSONObject();
					obj2.put("fileName", boardDtoList.get(i).getFilelist().get(j).getSnsboardfileFileName());
					obj2.put("fileSeq", boardDtoList.get(i).getFilelist().get(j).getSnsboardfileSeq());
					obj2.put("boardSeqFk", boardDtoList.get(i).getFilelist().get(j).getSnsboardSeqFk());
					System.out.println(boardDtoList.get(i).getFilelist().get(j).getSnsboardfileFileName());
					list2.add(obj2);
				}

				obj.put("fileList", list2);// 파일 dto

				list.add(obj);

			}
			System.out.println(list.toJSONString());
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(list);

			return null;

		} // else index가있을때

	}

	// 뷰페이지
	@RequestMapping(value = "/camsns/snsboard/snsboardview.action", method = RequestMethod.GET)
	public String boardView(HttpServletRequest request
							,HttpSession session
							, HttpServletResponse response
							, String boardSeq) {

		// System.out.println(boardSeq);
		SnsboardCategoryDTO boardDto = boardDao.boardOne(boardSeq);
		request.setAttribute("boardDto", boardDto);

		
		
		 List<SnsboardfileDTO> listFile = boardDao.boardFiles(boardSeq);
			request.setAttribute("listFile", listFile);
			
			
			
		
		
		//댓글불러오기
		List<SnscommentDTO> clist = commDao.listComment(boardSeq);
		request.setAttribute("clist", clist);
		
		


		return "/camsns/snsboard/boardview";
	}

	
	
	
	// 글쓰기 페이지
	@RequestMapping(value = "/camsns/snsboard/writeBoard.action", method = RequestMethod.GET)
	public String writeBoard(HttpServletRequest request
							,HttpSession session
							, HttpServletResponse response) {

		// 카테고리 리스트 넘겨줌
		List<CategoryDTO> categoryDtoList = categoryDao.categoryList();
		request.setAttribute("categoryDtoList", categoryDtoList);

		return "/camsns/snsboard/writeboard";
	}

	// 글쓰기동작 페이지
	@RequestMapping(value = "/camsns/snsboard/writeBoardOk.action", method = RequestMethod.POST)
	public String writeBoardOk(HttpServletRequest request
								,HttpSession session
								, HttpServletResponse response
								, String categoryVal
								, String subject
								, String content
								, String captcha) {
		
		
	
		//문자가같으면
		if(session.getAttribute("correctAnswer").equals(captcha)){
			ArrayList<SnsboardfileDTO> fileList = new ArrayList<SnsboardfileDTO>();
			SnsboardfileDTO fileDto = new SnsboardfileDTO();
	
			try {
			MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
	
			// 다중 파일 겟
			Iterator<String> iterator = multi.getFileNames();
	
			while (iterator.hasNext()) {
	
				MultipartFile mfile = multi.getFile(iterator.next());
	
				// 파일명 직접검사
				String temp = getFileName(mfile.getOriginalFilename());
	
					
					
					File file = new File(path + temp);
					mfile.transferTo(file);// 파일 업로드 실행
					fileDto.setSnsboardfileFileName(temp);
					fileList.add(fileDto);
			}
	
				} catch (Exception e) {
					// TODO: handle exception
				}
	
	
			String userId = "";
			
			
			universityDto = (UniversityDTO) session.getAttribute("universityDto");
			universitySeq = universityDto.getUniversitySeq();
			
			
			System.out.println("********"+universitySeq);
			SnsboardDTO boardDto = new SnsboardDTO();
			boardDto.setCategorySeqFk(categoryVal);
			boardDto.setSnsboardSubject(subject);
			boardDto.setSnsboardContent(content);
			boardDto.setUserEmailIdFk(userId);
			boardDto.setUniversitySeq(universitySeq);
	
			int result = boardDao.writeBoard(boardDto, fileList);
	
			request.setAttribute("result", result);
			request.setAttribute("captcha", "no");
			}
			//자동가입방지 문자 다르면
			else{
				System.out.println("자동가입문자다름");
				request.setAttribute("result", 0);
				request.setAttribute("captcha", "yes");
			}
			
		return "/camsns/snsboard/writeboardok";
	}

	// 중복되지 않는 파일명 얻어오기
	public String getFileName(String filename) {

		int n = 1;

		int index = filename.lastIndexOf(".");
		String oname = filename.substring(0, index);
		String ext = filename.substring(index);

		while (true) {
			File file = new File(path + filename);

			if (file.exists()) {
				// 홍길동.txt
				filename = oname + "_" + n + ext; // 홍길동_1.txt
				n++;
			} else {
				return file.getName();
			}
		}

	}// getFileName
}
