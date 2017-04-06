package com.test.spring.admin;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.BusStopCategoryDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;
import com.test.spring.dto.DeviceBusInfoDTO;
import com.test.spring.dto.DeviceDTO;
import com.test.spring.dto.UniversityDTO;

@Repository
public class DeviceManageDAO {

	
	@Autowired
	private SqlSessionTemplate sql;

	public List<DeviceDTO> deviceNullList() {
		
		return sql.selectList("device.nullList");
	}
	
	//대학 리스트 불러옴
	public List<UniversityDTO> universityList() {
		
		return sql.selectList("university.ulist");
	}

	public int deviceAddUniv(HashMap<String, String> dmap) {
		
		return sql.update("device.addUniversity",dmap);
	}

	/*public List<DeviceDTO> deviceSelList(String seq) {
		
		return sql.selectList("device.selList",seq);
	}*/

	
	//선택한 대학의 기기 불러오기
	public List<DeviceBusInfoDTO> deviceBusList(String seq) {
		// TODO Auto-generated method stub
		return sql.selectList("device.deviceBusList",seq);
	}

	
	//해당 학교 버스 정류장 큰 분류 불러오기
	public List<BusStopCategoryDTO> busStopCategoryList(String seq) {
		
		return sql.selectList("device.busStopCategoryList",seq);
	}

	//중분류
	public List<BusStopDetailCategoryDTO> busStopDetailCategoryList(String seq) {
		
		return sql.selectList("device.busStopDetailCategoryList",seq);
	}

	public int busStopCategoryAdd(HashMap<String, String> bdmap) {
		
		return sql.update("device.busStopCategoryAdd", bdmap);
	}


	
	
}
