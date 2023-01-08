package com.test.spring.admin.food;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.BusStopDTO;
import com.test.spring.dto.FoodDTO;
import com.test.spring.dto.NoticeFileDTO;
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
	public List<FoodDTO> getFoodListByDate(String date) {
		// TODO Auto-generated method stub
		return sql.selectList("food.getFoodListByDate", date);
	}
	
	// 일주일 단위 조
	public List<FoodDTO> getFoodListByWeek(String menuLocation, String date, String num){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("menuLocation", menuLocation);
		paramMap.put("date", date);
		paramMap.put("num", num);
		
		return sql.selectList("food.getFoodListByWeek", paramMap);
	}
	
	// 메뉴 업데이트
	   public int foodUpdate(String date, String menuCorner, String menuLocation, String menu1, String menu2, String menu3, String menu4, String menu5
	         ) {
	      HashMap<String, String> map = new HashMap<String, String>();
	      map.put("date", date);
	      map.put("menuLocation", menuLocation);
	      map.put("menuCorner", menuCorner);
	      map.put("menu1", menu1);
	      map.put("menu2", menu2);
	      map.put("menu3", menu3);
	      map.put("menu4", menu4);
	      map.put("menu5", menu5);

	      int result;

	      result = sql.update("food.foodUpdate", map);
	      System.out.println("결과 : "+date+menuCorner+menuLocation+result);
	      
	      return result;
	         
	   }


}
