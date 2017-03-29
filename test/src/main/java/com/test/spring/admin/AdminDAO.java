package com.test.spring.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.DTO.AdminDTO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	public List<AdminDTO> alist() {
		
		return sql.selectList("admin.adminList");
	}
	
	
	
}
