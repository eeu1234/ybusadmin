package com.test.spring.admin.food;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.BusStopDTO;
import com.test.spring.dto.FoodDTO;
import com.test.spring.dto.SearchDTO;

@Repository
public class AdminFoodDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	
	// 메뉴 조회
	public List<FoodDTO> foodList(String menuLocation) {
		// TODO Auto-generated method stub
		return sql.selectList("food.getFoodList", menuLocation);
	}
	
	// 날짜별 조회
	public List<FoodDTO> getDayFoodList(String mseq) {
		// TODO Auto-generated method stub
		return sql.selectList("food.getDayFoodList", mseq);
	}
	
	public int getTotal(SearchDTO where){
		
		return sql.selectOne("food.getTotal", where);
	}


}
