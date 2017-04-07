package com.test.spring.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.UniversityDTO;

@Repository
public class UniversityDAO {

	@Autowired
	private SqlSessionTemplate sql;

	//대학 추가
	public int universityAdd(UniversityDTO udto) {
		
		return sql.insert("university.uadd",udto);
	}
	
	//대학 수정
	public int universityEdit(UniversityDTO udto){
		
		return sql.update("university.uedit",udto);
	
	}

	//대학 삭제
	public int universityDel(String seq){
		
		return sql.delete("university.udel",seq);
	}

	//대학 리스트 불러옴
	public List<UniversityDTO> universityList() {
		
		return sql.selectList("university.ulist");
	}

	//선택 시퀀스 해당 대학이 있는지 확인
	public UniversityDTO universityGet(String seq) {
		
		return sql.selectOne("university.uget",seq);
	}
	
}
