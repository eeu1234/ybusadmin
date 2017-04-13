package com.test.spring.notice;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.SynchronousQueue;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.test.spring.dto.AdminDTO;
import com.test.spring.dto.AdminUniversityDTO;
import com.test.spring.dto.LocationDTO;
import com.test.spring.dto.NoticeDTO;
import com.test.spring.dto.NoticeFileDTO;
import com.test.spring.dto.SearchDTO;

@Controller("noticeController")
public class NoticeController {
   
   @Autowired
   private NoticeDAO dao;
   
   
   // 공지사항 글 출력
   @RequestMapping(method = { RequestMethod.GET }, value = "/admin/notice/notice.action")
   public String notice(HttpServletRequest request, HttpSession session, HttpServletResponse response, String page,
         SearchDTO sdto) {

      try {

         // 내용

         // 페이징 -> 게시판의 꽃
         int nowPage = 0; // 현재 페이지 번호
         int totalCount = 0; // 총 게시물 수
         int pageSize = 10; // 한 페이지에 보여줄 게시물 수(LIMIT의 2번째 인자값사용?)
         int totalPage = 0; // 총 페이지 수
         int start = 0; // LIMIT 조건에 사용될 시작값

         int n = 0, loop = 0; // 페이지바에 사용
         int blockSize = 10;

         if (page == null) {
            nowPage = 1; // 그냥 들어오면 무조건 첫페이지를 보여주자.
         } else {
            nowPage = Integer.parseInt(page);
         }

         // nowPage -> start 범위 계산
         // 1page -> 0, 10(LIMIT)
         // 2page -> 10, 10
         start = ((nowPage - 1) * pageSize);
         // dto 에 시작값 넣기
         sdto.setStart(start);

         // 검색했는지 확인
         String column = sdto.getColumn();
         String word = sdto.getWord();
         // System.out.println("컬럼 : "+column+" 워드 : "+word);

         // 페이징 때문에 검색이 없으면 null 로 넘어감.
         if ((column != null && word != null) && (!column.equals("null") && !word.equals("null"))) {

            String where = String.format("WHERE %s like '%%%s%%'", column, word);
            sdto.setWhereWord(where);

         }

         // 페이징 하기위한 토탈 수
         totalCount = dao.getTotal(sdto);
         totalPage = (int) Math.ceil((double) totalCount / pageSize);

         // 검색+시작값 DTO 넘김(****)
         List<NoticeDTO> alist = dao.alist(sdto);

         // 페이지바 만들기
         String pageBar = "";

         loop = 1; // 페이지 번호를 만드는 루프 담당
         n = ((nowPage - 1) / blockSize) * blockSize + 1; // 페이지 번호 역할(시작 번호)

         pageBar += "<nav><ul class='pagination'>";
         if (n == 1) {
            pageBar += String.format(
                  "<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
         } else {
            pageBar += String.format(
                  "<li><a href='/spring/admin/notice/notice.action?page=%d&column=%s&word=%s' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>",
                  n - 1, column, word);
         }

         while (!(loop > blockSize || n > totalPage)) {
            // 현재 보고 있는 페이지?
            if (n == nowPage) {
               pageBar += String.format("<li class='active'><a href='#'>%d</a></li>", n);
            } else {
               pageBar += String.format(
                     "<li><a href='/spring/admin/notice/notice.action?page=%d&column=%s&word=%s'>%d</a></li>", n,
                     column, word, n);
            }

            n++;
            loop++;

         } // 페이지 번호 while

         if (n > totalPage) {
            pageBar += String.format(
                  "<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
         } else {
            pageBar += String.format(
                  "<li><a href='/spring/admin/notice/notice.action?page=%d&column=%s&word=%s' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>",
                  n, column, word);
         }

         pageBar += "</ul></nav>";

         request.setAttribute("alist", alist);
         request.setAttribute("sdto", sdto);
         request.setAttribute("pageBar", pageBar);

         // readcount 초기화!
         session.setAttribute("readcount", "n");

         return "admin/notice/notice";

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
   /*------------------------------------------------------공지사항 메인!!------------------------------*/
   
   String path = "";   //업로드 경로!!
   
   // 공지사항 내용 가져옴
   @RequestMapping(method = { RequestMethod.GET }, value = "/admin/notice/noticeContent.action")
   public String noticeContent(HttpServletRequest request, HttpSession session, HttpServletResponse response,
         String seq) throws IOException {

      // System.out.println(seq);
      try {

         // 내용

         // 공지사항 게시글 정보 가져오기
         NoticeDTO noticeContent = dao.notice(seq);

         List<NoticeFileDTO> listFileType = new ArrayList<>();
         for (int i = 0; i < noticeContent.getFilelist().size(); i++) {

            String str = noticeContent.getFilelist().get(i).getNoticeFileName();
            String[] ddd = str.split("\\.");

            NoticeFileDTO fileNameDto = new NoticeFileDTO();
            fileNameDto.setNoticeFileName(str);
            fileNameDto.setNoticeFileType(ddd[1]);
            listFileType.add(fileNameDto);
         }

         noticeContent.setFilelist(listFileType);

         request.setAttribute("noticeContent", noticeContent);

         // readcount 값 바꾸기, 조회수 추가
         if (session.getAttribute("readcount") == null || session.getAttribute("readcount").equals("n")) {
            dao.addReadCount(seq);
            session.setAttribute("readcount", "y");

            System.out.println(session.getAttribute("readcount"));
         }

         return "admin/notice/noticeContent";

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

   
   // 공지사항 내용 추가하기
   @RequestMapping(method = { RequestMethod.GET }, value = "/admin/notice/noticeAdd.action")
   @Transactional
   public String noticeAdd(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
      try {

         // 내용

         return "admin/notice/noticeAdd";
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
   
   // 공지사항 내용 추가하기
   @RequestMapping(method = { RequestMethod.POST }, value = "/admin/notice/noticeAddOk.action")
   @Transactional
   public String noticeAddOk(HttpServletRequest request, HttpSession session, HttpServletResponse response

         , String subject, String content) {

      try {

         // 내용
         // 글쓰기 완료
         AdminUniversityDTO adto = (AdminUniversityDTO) session.getAttribute("adto");
         String adminID = adto.getAdminID();

         NoticeDTO noticeAddInfo = new NoticeDTO();

         noticeAddInfo.setNoticeSubject(subject);
         noticeAddInfo.setNoticeContent(content);
         noticeAddInfo.setAdminID(adminID);

         /*-----------------------------------------------------------------*/

         ArrayList<NoticeFileDTO> fileList = new ArrayList<NoticeFileDTO>();

         try {
            // 파일 업로드
            MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;

            List<MultipartFile> getfile = multi.getFiles("filename");

            // 첨부파일의 갯수가 여러개
            for (int i = 0; i < getfile.size(); i++) {

               NoticeFileDTO fileUpload = new NoticeFileDTO();

               MultipartFile mfile = getfile.get(i);

               path = request.getRealPath("/images/notice/");
               System.out.println(path);

               String temp = getFileName(mfile.getOriginalFilename());

               File file = new File(path + temp);
               // DB -> temp(물리명)
               // -> mfile.getOriginalFilename()(원본명)

               fileUpload.setNoticeFileName(temp);
               fileList.add(fileUpload);
               mfile.transferTo(file); // 파일 업로드 실행
            }
         } catch (Exception e) {
            System.out.println(e.toString());
         }

         /*-----------------------------------------------------------------*/

         int result = dao.noticeAdd(noticeAddInfo, fileList);
         request.setAttribute("result", result);

         return "admin/notice/noticeAddOk";
         
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
   
   
   
   // 공지사항 내용 수정할 내용 가져오기
   @RequestMapping(method = { RequestMethod.POST }, value = "/admin/notice/noticeUpdate.action")
   @Transactional
   public String noticeUpdate(HttpServletRequest request, HttpSession session, HttpServletResponse response,
         String seq) {

      try {

         // 내용

         // 공지사항 게시글 정보 가져오기
         NoticeDTO noticeContent = dao.notice(seq);
         
         List<NoticeFileDTO> listFileType = new ArrayList<>();
         for (int i = 0; i < noticeContent.getFilelist().size(); i++) {

            String str = noticeContent.getFilelist().get(i).getNoticeFileName();
            String[] ddd = str.split("\\.");

            NoticeFileDTO fileNameDto = new NoticeFileDTO();
            fileNameDto.setNoticeFileName(str);
            fileNameDto.setNoticeFileType(ddd[1]);
            listFileType.add(fileNameDto);
         }

         noticeContent.setFilelist(listFileType);

         request.setAttribute("noticeContent", noticeContent);
         
         return "admin/notice/noticeUpdate";

      } catch (Exception e) {
         session.invalidate();
         try {

            response.sendRedirect("/spring/admin/adminLogin.action");
         } catch (Exception e2) {
            // TODO: handle exception
         }
         
      }

      return null;
   }
   
   
   // 공지사항 내용 수정하기
   @RequestMapping(method = { RequestMethod.POST }, value = "/admin/notice/noticeUpdateOk.action")
   @Transactional
   public String noticeUpdateOk(HttpServletRequest request, HttpSession session, HttpServletResponse response,
         String noticeSeq, String content, String subject, String status) {

      
         System.out.println("1");
      try {
         System.out.println("2");
         
         
         ArrayList<NoticeFileDTO> fileList = new ArrayList<NoticeFileDTO>();
         MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
         System.out.println(multi.getFiles("filename").size() + " :");
         List<MultipartFile> getfile = multi.getFiles("filename");
         
         // 파일 업로드
         for(MultipartFile dto : getfile){
            System.out.println(dto +" : "+dto.getName());
         }
         
         int resultFile = 0;
         
         if(getfile.size() == 1){
            //파일이 1개일 때 - 사이즈가 0 보다 크면 파일이 선택됨.
            if(getfile.get(0).getSize() != 0){
               resultFile = 1;
            }else{
               //사이즈가 0 이면 파일 선택 안됨.
               resultFile = 0;
            }
         }else{
            //파일이 2개 이상 일 때
            resultFile = 1;
         }
         
         if(resultFile == 1){
         System.out.println("6");
         // 첨부파일의 갯수가 여러개
            for (int i = 0; i < getfile.size(); i++) {
               System.out.println("7");
               NoticeFileDTO fileUpload = new NoticeFileDTO();
               System.out.println("8");
               MultipartFile mfile = getfile.get(i);
               System.out.println("9");
               path = request.getRealPath("/images/notice/");
               System.out.println(path);
               System.out.println("10");
               
               System.out.println("<오류");
               
               String temp = getFileName(mfile.getOriginalFilename());
               System.out.println("11");
               File file = new File(path + temp);
               // DB -> temp(물리명)
               // -> mfile.getOriginalFilename()(원본명)
               System.out.println("12");
               fileUpload.setNoticeFileName(temp);
               fileList.add(fileUpload);
               System.out.println("13");
               mfile.transferTo(file); // 파일 업로드 실행
               System.out.println("14");
               
               System.out.println("오류>");
            }
         }
         
         // 내용
         int result = dao.noticeUpdate(noticeSeq, content, subject, status, fileList);
      
         request.setAttribute("result", result);
         return "admin/notice/noticeUpdateOk";
      } catch (Exception e) {
         session.invalidate();

         try {

            System.out.println("15");
         
            response.sendRedirect("/spring/admin/adminLogin.action");

         } catch (Exception e2) {
            // TODO: handle exception

         }
         return null;
      }

   }
   
   
   
   // 공지사항 내용 삭제
   @RequestMapping(method = { RequestMethod.GET }, value = "/admin/notice/noticeDelete.action")
   @Transactional
   public String noticeDelete(HttpServletRequest request, HttpSession session, HttpServletResponse response,
         String noticeSeq) {

      try {

         // 내용

         int result = dao.noticeDelete(noticeSeq);

         request.setAttribute("result", result);

         return "admin/notice/noticeDelete";
         
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
   
   
   //중복되지 않는 파일명 얻어오기
   public String getFileName(String filename) {
   
      int n = 1;
      
      int index = filename.lastIndexOf(".");
      String oname = filename.substring(0, index);
      String ext = filename.substring(index);
      
      
      while(true) {
         File file = new File(path + filename);

         if (file.exists()) {
            //홍길동.txt
            filename = oname + "_" + n + ext; //홍길동_1.txt
            n++;
         } else {
            return file.getName();
         }
      }
      
   }

}