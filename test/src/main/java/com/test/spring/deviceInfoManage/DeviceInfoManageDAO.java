package com.test.spring.deviceInfoManage;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.DeviceDTO;
import com.test.spring.dto.UniversityDTO;

@Repository
public class DeviceInfoManageDAO {

	@Autowired
	private SqlSessionTemplate sql;

	//모든 디바이스 리스트 가져오기
	public List<DeviceDTO> diviceList() {
		// TODO Auto-generated method stub
		return sql.selectList("deviceInfoManage.diviceList");
	}

	//대학리스트 가져오기
	public List<UniversityDTO> universityList() {
		// TODO Auto-generated method stub
		return sql.selectList("deviceInfoManage.universityList");
	}

	
	//디바이스 수정
	public int updateDevice(String seq, String deviceModel, String deviceTel,String universitySel) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<>();
		map.put("seq", seq);
		map.put("deviceModel", deviceModel);
		map.put("deviceTel", deviceTel);
		map.put("universitySel", universitySel);
		
		return sql.update("deviceInfoManage.updateDevice",map);
	}

	//디바이스 삭제
	public int deleteDevice(String seq) {
		// TODO Auto-generated method stub
		
		try{
			return sql.delete("deviceInfoManage.deleteDevice",seq);			
		}catch(Exception e){
			System.out.println("삭제실패");
		}
		return 0;
	}
	
	
	
}
