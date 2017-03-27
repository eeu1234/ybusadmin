package com.test.spring;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HomeDAO {

	@Autowired
	SqlSessionTemplate session;
	
	 public int m1() {
	      
	      return session.selectOne("m1");
	   }
	
	


}
