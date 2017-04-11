package com.test.spring.admin.busSchedule;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.BusScheduleDTO;
import com.test.spring.dto.BusScheduleSearchDTO;
import com.test.spring.dto.BusStopCategoryDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;

@Repository
public class AdminBusScheduleDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	//버스스탑카테고리 가져오기
	public List<BusStopCategoryDTO> getCategoryList(String universitySeq) {
		//System.out.println("버스스탑카테고리 : "+universitySeq);
		return sql.selectList("adminBusSchedule.getCategoryList", universitySeq);
	}
	
	//버스스탑디테일 가져오기
	public List<BusStopDetailCategoryDTO> getDetailCategoryList(String busStopCategory) {
		//System.out.println("버스디테일스탑카테고리 : "+busStopCategory);
		return sql.selectList("adminBusSchedule.getDetailCategoryDTO", busStopCategory);
	}
	
	//버스스케쥴
	public List<BusScheduleDTO> getBusSchedule(BusScheduleSearchDTO search) {
		
		return sql.selectList("adminBusSchedule.getBusSchedule", search);
	}
	
	//버스스케쥴 추가
	public int addSchedule(BusScheduleDTO dto) {
		
		return sql.insert("adminBusSchedule.addSchedule", dto);
	}
	
	//버스스케쥴 삭제
	public int deleteSchedule(String busScheduleSeq) {
		
		return sql.delete("adminBusSchedule.deleteSchedule", busScheduleSeq);
	}
	
	
}
