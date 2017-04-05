package com.test.spring.android.DAO;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.BusStopCategoryDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;

@Repository
public class MainDAO {
	@Autowired
	private SqlSessionTemplate sql;
	
	
	public List<BusStopDetailCategoryDTO> getSpecipicBusStopDetailCategory(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sql.selectList("mainIndex.getSpecipicBusStopDetailCategory",map);
	}


	public List<BusStopCategoryDTO> getSpecipicBusStopCategory(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sql.selectList("mainIndex.getSpecipicBusStopCategory",map);
	}
}
