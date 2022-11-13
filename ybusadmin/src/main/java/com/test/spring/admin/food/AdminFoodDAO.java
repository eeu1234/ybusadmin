package com.test.spring.admin.food;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.FoodDTO;

@Repository
public class AdminFoodDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	
	//
	public List<FoodDTO> foodList() {
		// TODO Auto-generated method stub
		return sql.selectList("food.foodList");
	}


}
