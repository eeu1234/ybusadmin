package com.test.spring.admin.notice;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.LocationDTO;
import com.test.spring.dto.NoticeDTO;
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
	
	//공지사항 글 정보
	public List<NoticeDTO> notice(String seq) {
		
		return sql.selectList("notice.noticeContent",seq);
	}

	//공지사항 글 삭제
	public int noticeDelete(String noticeSeq) {
		
		return sql.delete("notice.noticeDelete", noticeSeq);
	}

	//공지사항 글 추가
	public int noticeAdd(String subject, String content, String adminID) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("subject",subject);
		map.put("content",content);
		map.put("adminID",adminID);
		
		return sql.insert("notice.noticeAdd", map);
	}
	
	//글 수정
	public int noticeUpdate(String noticeSeq, String content, String subject, String status) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("noticeSeq",noticeSeq);
		map.put("subject",subject);
		map.put("content",content);
		map.put("status",status);
	
		return sql.update("notice.noticeUpdate", map);
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
