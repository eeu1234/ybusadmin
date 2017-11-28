package com.test.spring.camsns.DAO;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.camsns.SearchDTO;
import com.test.spring.dto.camsns.SnsboardCategoryDTO;
import com.test.spring.dto.camsns.SnsboardDTO;
import com.test.spring.dto.camsns.SnsboardfileDTO;
import com.test.spring.dto.camsns.SnscommentDTO;



@Repository
public class SnsAdminDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	
	
	public int getTotal(SearchDTO sdto){
		
		
		
		return sql.selectOne("countBoard",sdto);
		
	};

	public List<SnsboardDTO> boardlist(SearchDTO sdto) {
		
		
		return sql.selectList("adminBoardList", sdto);
	}
	
	
	public void changeValue(String type,String value,String boardSeq){
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("value", value);
		map.put("boardSeq", boardSeq);
		int result = 0;

		result = sql.update("adminSnsboard.changeValue", map);
		
		
	}

	//view페이지용
	public SnsboardCategoryDTO boardOne(String boardSeq) {

		return sql.selectOne("snsboard.boardOne", boardSeq);
	}

	
	//view 파일 불러오기
	public List<SnsboardfileDTO> boardFiles(String boardSeq) {
		
	
		
		
		return sql.selectList("adminSnsboard.boardFiles", boardSeq);
	}

	
	// 댓글 리스트 불러오기
		public List<SnscommentDTO> listComment(String boardSeq) {
			
			return sql.selectList("snsboard.cList",boardSeq);
		}

		public void commChangeValue(String value, String commSeq) {
			 HashMap<String, String> map = new HashMap<String, String>();
		
			map.put("value", value);
			map.put("commSeq", commSeq);
			int result = 0;

			result = sql.update("adminSnsboard.commChangeValue", map);
			
		}
	
}
