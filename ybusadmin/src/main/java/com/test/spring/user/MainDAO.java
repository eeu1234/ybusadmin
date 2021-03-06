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


	public List<NoticeDTO> getAllNotice() {
		// TODO Auto-generated method stub
		return sql.selectList("mainIndex.getAllNotice");
	}


	public UniversityDTO getUniversitySeq(String urlStr) {
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
