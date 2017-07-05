package com.test.spring.camsns.DAO;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.camsns.SearchDTO;
import com.test.spring.dto.camsns.SnsboardDTO;



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


	
	
}
