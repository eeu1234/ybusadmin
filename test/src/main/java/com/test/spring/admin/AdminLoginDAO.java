package com.test.spring.admin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.DTO.AdminDTO;

@Repository
public class AdminLoginDAO {

	
	@Autowired
	public SqlSessionTemplate sql;
	
	public AdminDTO checkAdmin(AdminDTO dto){
		
		return sql.selectOne("admin.checkAdmin",dto);
		
		
	}


	
	
}
