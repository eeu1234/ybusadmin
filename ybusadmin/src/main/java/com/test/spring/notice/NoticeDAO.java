package com.test.spring.notice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.LocationDTO;
import com.test.spring.dto.NoticeDTO;
import com.test.spring.dto.NoticeFileDTO;
import com.test.spring.dto.SearchDTO;

@Repository
public class NoticeDAO {
   
   @Autowired
   private SqlSessionTemplate sql;
   
   //관리자 계정 내역 가져오기
   public List<NoticeDTO> alist(SearchDTO sdto) {

      //검색 했을 때
      return sql.selectList("notice.notice", sdto);

   }
   
   //관리자 계정 총 갯수 - 페이징 용
   public int getTotal(SearchDTO where) {
      
      return sql.selectOne("notice.totalAdmin", where);
   }
   
/*   //공지사항 글 정보
   public List<NoticeDTO> notice(String seq) {
      
      
      return sql.selectOne("notice.noticeContent",seq);
   }*/
   
   //글 정보 및 파일명 가져오기
   public NoticeDTO notice(String seq) {
      
      NoticeDTO noticeDto = sql.selectOne("notice.noticeContent",seq);
      
      
      List<NoticeFileDTO> fileDto = sql.selectList("notice.noticefile",seq);
      noticeDto.setFilelist(fileDto);
      
      return noticeDto;
   }

   //공지사항 글 삭제
   public int noticeDelete(String noticeSeq) {
      
      sql.delete("notice.noticeDeleteFile", noticeSeq);
      
      
      return sql.delete("notice.noticeDelete", noticeSeq);
   }

   //공지사항 글 추가 및 파일 추가
   public int noticeAdd(NoticeDTO noticeAddInfo, ArrayList<NoticeFileDTO> fileList) {
      int result;
      
      result = sql.insert("notice.noticeAdd", noticeAddInfo);
      
      noticeAddInfo = sql.selectOne("notice.noticeInfo");
      String noticeSeq = noticeAddInfo.getNoticeSeq();
      
     HashMap<String, String> map = new HashMap<String, String>();
      for (int i = 0; i<fileList.size(); i++) {
          map.put("noticeSeq", noticeSeq);
          
          String fileName = fileList.get(i).getNoticeFileName();
          map.put("fileName", fileName);
          
          
             sql.insert("notice.noticeFileUpload",map);
   
       }

      return result;
   }
   
   // 글 수정
   public int noticeUpdate(String noticeSeq, String content, String subject, String status,
         ArrayList<NoticeFileDTO> fileList) {
      HashMap<String, String> map = new HashMap<String, String>();
      map.put("noticeSeq", noticeSeq);
      map.put("subject", subject);
      map.put("content", content);
      map.put("status", status);

      int result;

      result = sql.update("notice.noticeUpdate", map);
      System.out.println("파일리스트 사이즈 : "+fileList.size());
      if(fileList.size()!=0){
         
      sql.delete("notice.noticeDeleteFile", noticeSeq);
      HashMap<String, String> map1 = new HashMap<String, String>();
      
         
         for (int i = 0; i < fileList.size(); i++) {
            map.put("noticeSeq", noticeSeq);
   
            String fileName = fileList.get(i).getNoticeFileName();
            map.put("fileName", fileName);
            
            sql.insert("notice.noticeFileUpload",map);
            
         }
      } 
      
      return result;
         
   }
   
   //조회수 늘리기
   public int addReadCount(String seq) {
      
      return sql.update("notice.readCountAdd",seq);
   }


   
   //사용자부분추가
   //공지사항 글 정보
   public NoticeDTO userNotice(String seq) {
      
      return sql.selectOne("notice.noticeContent",seq);
   }
   


   
   

}