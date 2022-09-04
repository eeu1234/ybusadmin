package com.test.spring.user;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.BusStopCategoryDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;
import com.test.spring.dto.NoticeDTO;
import com.test.spring.dto.UniversityDTO;

@Repository
public class MainDAO {
	@Autowired
	private SqlSessionTemplate sql;
	
	
	public List<BusStopDetailCategoryDTO> getSpecipicBusStopDetailCategory(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sql.selectList("mainIndex.getSpecipicBusStopDetailCategory",map);
	}


	public List<BusStopCategoryDTO> getSpecipicBusStopCategory(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sql.selectList("mainIndex.getSpecipicBusStopCategory",map);
	}


	public List<NoticeDTO> getAllNotice(String word) { // 테이블의 데이터를 다 가져옴
		// TODO Auto-generated method stub
		if(word == null) {word ="";}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("word", word);// 검색어
		return sql.selectList("mainIndex.getAllNotice",map);
	}


	public UniversityDTO getUniversitySeq(String urlStr) {  //유니벌시티DTO 한행을 가져옴.
		// TODO Auto-generated method stub
		return sql.selectOne("mainIndex.getUniversitySeq",urlStr);
	}
	public UniversityDTO getUniversityDtoSeq(String universitySeq) {
		// TODO Auto-generated method stub
		return sql.selectOne("mainIndex.getUniversityDtoSeq",universitySeq);
	}
	public List<UniversityDTO> getAllUniversity() {
		// TODO Auto-generated method stub
		return sql.selectList("mainIndex.getAllUniversity");
	}
}
