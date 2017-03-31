package com.test.spring.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.AdminDTO;
import com.test.spring.dto.SearchDTO;
import com.test.spring.dto.UniversityDTO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	//관리자 계정 내역 가져오기
	public List<AdminDTO> alist(SearchDTO sdto) {

		//검색 했을 때
		return sql.selectList("admin.adminList", sdto);

	}
	
	//관리자 계정 총 갯수 - 페이징 용
	public int getTotal(SearchDTO where) {
		
		return sql.selectOne("admin.totaladmin", where);
	}
	
	//수정할 관리자 계정 불러오기
	public AdminDTO getadmin(String adminID) {
		
		return sql.selectOne("admin.getadmin",adminID);
	}
	
	//관리자 수정 업데이트하기
	public int getupdate(AdminDTO dto) {
		
		return sql.update("admin.adminupdate", dto);
	}
	
	
	
	//계정 삭제하기
	public int admindelete(String adminID) {
		
		return sql.delete("admin.admindelete", adminID);
	}

	//관리자 생성 페이지 시 대학목록 가져오기
	public List<UniversityDTO> universitylist() {
		
		return sql.selectList("admin.universitylist");
	}
	
	//아이디 유효성 확인
	public int checkid(String adminID) {
		
		return sql.selectOne("admin.checkid", adminID);
	}
	
	//관리자 계정 생성
	public int adminadd(AdminDTO dto) {
		
		return sql.insert("admin.adminadd", dto);
	}
	
	
	
}
