package com.test.spring.polyline;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.AdminUniversityDTO;
import com.test.spring.dto.BusInfoDTO;
import com.test.spring.dto.BusLogDTO;
import com.test.spring.dto.BusStopCategoryDTO;
import com.test.spring.dto.BusStopDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;
import com.test.spring.dto.LocationDTO;
import com.test.spring.dto.UniversityDTO;

@Repository
public class PolyLineDAO {

	@Autowired
	private SqlSessionTemplate sql;

	
	//대학교 정보 가져오기
	public List<UniversityDTO> list() {
		
		return sql.selectList("polyline.university");
	}
	
	//관리자 학교 정보 가져오기
	public List<AdminUniversityDTO> list1(String universitySeq, String adminID) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("universitySeq",universitySeq);
		map.put("adminID",adminID);
		return sql.selectList("polyline.adminUniversity",map);
	}
	
	
	//대학교 위도,경도
	public List<UniversityDTO> universityMap(String seq) {
		
	return sql.selectList("polyline.universityMap",seq);
	}

	
	//버스 종류 분류
	public List<BusStopCategoryDTO> busStopCategory(String seq) {
		
		
		return sql.selectList("polyline.busStopCategory",seq);
	}

	//버스 세부 분류
	public List<BusStopDetailCategoryDTO> busStopDetailCategory(String seq) {
		
		return sql.selectList("polyline.busStopDetailCategory",seq);
	}

	
	//버스 정보 분류
	public List<BusInfoDTO> busInfo(String seq) {
		
		return sql.selectList("polyline.busInfo",seq);
	}
	
	//정류장 분류
	public List<BusStopDTO> busStop(String seq) {
		
		
		return sql.selectList("polyline.busStop",seq);
	}
	
	//버스 위치 정보 분류
	public List<LocationDTO> location(String seq, String start, String end) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("seq",seq);
		map.put("start",start);
		map.put("end",end);
		return sql.selectList("polyline.location",map);
	}
	
	
	//운행 대장
	public List<BusLogDTO> busLogList(String seq, String start, String end) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("seq",seq);
		map.put("start",start);
		map.put("end",end);
		return sql.selectList("polyline.busLogList",map);
	}

	
}
