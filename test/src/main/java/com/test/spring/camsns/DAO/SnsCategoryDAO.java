package com.test.spring.camsns.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.camsns.CategoryDTO;


@Repository
public class SnsCategoryDAO {

	@Autowired
	SqlSessionTemplate sql;
	
	

	/*카테고리 리스트 불러오기*/
	public List<CategoryDTO> categoryList() {
		
		
		return sql.selectList("categoryList");
	}


	
}
