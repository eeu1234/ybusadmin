package com.test.spring.busSchedule;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.BusScheduleDTO;
import com.test.spring.dto.BusScheduleSearchDTO;
import com.test.spring.dto.BusStopCategoryDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;

@Repository
public class BusScheduleDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	//버스스탑카테고리 가져오기
	public List<BusStopCategoryDTO> getCategoryList(String universitySeq) {
		//System.out.println("버스스탑카테고리 : "+universitySeq);
		return sql.selectList("timeTable.getCategoryList", universitySeq);
	}
	
	//버스스탑디테일 가져오기
	public List<BusStopDetailCategoryDTO> getDetailCategoryList(String busStopCategory) {
		//System.out.println("버스디테일스탑카테고리 : "+busStopCategory);
		return sql.selectList("timeTable.getDetailCategoryDTO", busStopCategory);
	}
	
	//버스스케쥴
	public List<BusScheduleDTO> getBusSchedule(BusScheduleSearchDTO bsdto) {
		//System.out.println("검색 : "+bsdto.getBusStopCategorySeq());
		return sql.selectList("timeTable.getBusSchedule", bsdto);
	}
	
	//버스스케쥴 Map형태
	public List<BusScheduleDTO> getBusSchedule2(BusScheduleSearchDTO sdto) {
		
		return sql.selectList("timeTable.getBusSchedule2", sdto);
	}
	
	public String getLastUpdateBusTime() {
		
		return sql.selectOne("timeTable.getLastUpdateBusTime");
		
	}
	
	
}
