package com.ybus.spring.map;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BusStopMapDAO {
	
	@Autowired
	SqlSessionTemplate sql;
	
	//학교에 속해있는 정류장 들고옴
	public List<BusStopDTO> getBusStop(String universitySeq) {
		// TODO Auto-generated method stub
		return sql.selectList("busStop.getBusStop",universitySeq);
	}

	//학교의 위경도 들고옴
	public UniversityDTO getUniversityArea(String universitySeq) {
		// TODO Auto-generated method stub
		return sql.selectOne("busStop.university",universitySeq);
	}
	
	//정류장의 위경도 들고옴
	public BusStopDTO busStop(String busStopSeq) {
		// TODO Auto-generated method stub
		return sql.selectOne("busStop.busStop",busStopSeq);
	}
	
	
	
}
