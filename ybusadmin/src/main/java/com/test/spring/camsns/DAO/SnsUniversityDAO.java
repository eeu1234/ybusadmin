package com.test.spring.camsns.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.UniversityDTO;


@Repository
public class SnsUniversityDAO {


	@Autowired
	SqlSessionTemplate sql;
	
	
	public List<UniversityDTO> list() {
		
		return sql.selectList("university.universityList");
	}

}
