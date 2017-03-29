package com.test.spring.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.DTO.AdminDTO;
import com.test.spring.DTO.SearchDTO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	//관리자 계정 내역 가져오기
	public List<AdminDTO> alist(int start) {
		
		return sql.selectList("admin.adminList", start);
	}
	
	//관리자 계정 총 갯수 - 페이징 용
	public int getTotal() {
		
		return sql.selectOne("admin.totaladmin");
	}
	
	//수정할 관리자 계정 불러오기
	public List<Object> getadmin(String adminID) {
		
		return sql.selectList("admin.getadmin",adminID);
	}
	
	
	
}
