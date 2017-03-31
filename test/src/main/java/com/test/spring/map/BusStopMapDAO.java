package com.test.spring.map;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.AroundPlaceDTO;

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
	
	//주변 장소 들고옴
	public List<AroundPlaceDTO> getAroundPlace(String busStopSeq) {
		// TODO Auto-generated method stub
		return sql.selectList("busStop.getAroundPlace",busStopSeq);
	}
	
	
	//특정 학교의 지정한 노선의 모든 정류장 들고옴
	public List<BusStopDTO> getAllBusStop(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sql.selectList("busStop.getAllBusStop",map);
	}
	
	
	//특정학교의 지정한 노선에 운행중인 버스들의 최신값의 위경도 들고옴
	public List<CurrBusLocationDTO> getCurrBusLocation(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sql.selectList("busStop.getCurrBusLocation",map);
	}

	public BusStopAvgLatLonDTO getAvgBusStopLatLon(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sql.selectOne("busStop.getAvgBusStopLanLon",map);
	}

	//특정학교의 지정한 노선에 운행중인 버스들의 최신값의 정류장위치 들고옴
	public List<CurrBusLocationDTO> getCurrBusStopLocation(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sql.selectList("busStop.getCurrBusStopLocation",map);
	}
	
	
	
}
