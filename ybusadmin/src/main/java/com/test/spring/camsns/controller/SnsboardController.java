package com.test.spring.camsns.controller;

import java.io.BufferedReader;
import java.io.File;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.test.spring.camsns.DAO.SnsCategoryDAO;
import com.test.spring.camsns.DAO.SnsboardDAO;
import com.test.spring.camsns.DAO.SnscommentDAO;
import com.test.spring.dto.UniversityDTO;
import com.test.spring.dto.camsns.CamsnsNoticeDTO;
import com.test.spring.dto.camsns.CategoryDTO;
import com.test.spring.dto.camsns.SnsboardCategoryDTO;
import com.test.spring.dto.camsns.SnsboardDTO;
import com.test.spring.dto.camsns.SnsboardfileDTO;
import com.test.spring.dto.camsns.SnscommentDTO;
import com.test.spring.camsns.DAO.SnsUniversityDAO;




@Controller("SnsboardController")
public class SnsboardController {
    public static StringBuilder sb;
    
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



			word="";
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
	
	/*공지사항*/
    /*
     * @RequestMapping(method={RequestMethod.GET} ,
     * value="/camsns/snsboard/camsnsNotice") public ModelMap
     * camsnsNotice(HttpServletRequest request ,HttpSession session
     * ,HttpServletResponse response, ModelMap modelMap){ List<CamsnsNoticeDTO>
     * noticeList = boardDao.getNotice(); modelMap.addAttribute("noticeList",
     * noticeList);
     * 
     * return modelMap; }
     */
   
   @RequestMapping(method={RequestMethod.GET}, value="/camsns/snsboard/camsnsNews")
   public String camsnsNews(HttpServletRequest request
           ,HttpSession session
           ,HttpServletResponse response){
       return "camsns/snsboard/camsnsNews";
    }
   
   @RequestMapping(method={RequestMethod.POST}, value="/camsns/snsboard/getNews")
   @ResponseBody
   public List<ModelMap> getNews(HttpServletRequest request
           ,HttpSession session
           ,HttpServletResponse response, String start, ModelMap modelMap){
       String clientId = "29slBRM4eDdKuESZzqz8";//애플리케이션 클라이언트 아이디값";
       String clientSecret = "uiPEBBws13";//애플리케이션 클라이언트 시크릿값";
       StringBuilder sb;
       List<ModelMap> list = new ArrayList<ModelMap>();
       try {
           String text = URLEncoder.encode("용인대학교", "utf-8");
           String apiURL = "https://openapi.naver.com/v1/search/news.json?query=" + text + "&start=" + start + "&display=" + 5 + "&" + "sort=sim";
           URL url = new URL(apiURL);
           HttpURLConnection con = (HttpURLConnection) url.openConnection();
           con.setRequestMethod("GET");
           con.setRequestProperty("X-Naver-Client-Id", clientId);
           con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
           int responseCode = con.getResponseCode();
           BufferedReader br;
           if (responseCode == 200) { 
               br = new BufferedReader(new InputStreamReader(con.getInputStream()));
           } else { 
               br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
           }
           sb = new StringBuilder();
           String line;

           while ((line = br.readLine()) != null) {
               sb.append(line + "\n");
           }
           JSONParser parser = new JSONParser();
           JSONObject jsonObj = new JSONObject();
           jsonObj = (JSONObject) parser.parse(sb.toString());
           JSONArray o = (JSONArray) jsonObj.get("items");
           for(int i=0; i<o.size(); i++) {
               ModelMap modelMap2 = new ModelMap();
               JSONObject newObj = (JSONObject) o.get(i);
               String title = newObj.get("title").toString();
               String link = newObj.get("link").toString();
               String description = newObj.get("description").toString();
               String date = newObj.get("pubDate").toString();
               modelMap2.addAttribute("title", title);
               modelMap2.addAttribute("link", link);
               modelMap2.addAttribute("description", description);
               modelMap2.addAttribute("date", date);
               list.add(modelMap2);
           }
           br.close();
           con.disconnect();
       } catch (Exception e) {
           System.out.println("오류가 발생했습니다 : "+e.getMessage());
       }
       return list;
    }
}
