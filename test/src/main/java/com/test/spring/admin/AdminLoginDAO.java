package com.test.spring.admin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.AdminDTO;
import com.test.spring.dto.AdminUniversityDTO;

@Repository
public class AdminLoginDAO {

	
	@Autowired
	public SqlSessionTemplate sql;
	
	public AdminUniversityDTO checkAdmin(AdminUniversityDTO adto){
		
		return sql.selectOne("admin.checkAdmin",adto);
		
		
	}


	
	
}
