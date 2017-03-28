package com.test.spring.android.DAO;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.LocationDTO;

@Repository
public class androidDAO {

	private static final int String = 0;
	@Autowired
	SqlSessionTemplate sql;
	
		//1번. 프로세스

		//기기seq 찾기
		public String findDeviceSeq(String deviceId) {

			return sql.selectOne("deviceSeq",deviceId);
		}


		//기기 intervalTime
		public String findDeviceInterval(String deviceId) {
			return sql.selectOne("deviceIntervalTime",deviceId);
		}



		//2번 프로세스
		
		
		//버스SEQ,위도,경도 INSERT
		public int insertBusLocation(String deviceSeq, String deviceLat, String deviceLng) {

			LocationDTO dto = new LocationDTO();
			dto.setDeviceSeq(deviceSeq);
			dto.setLocationLatitude(deviceLat);
			dto.setLocationLongitude(deviceLng);

			
			return sql.insert("busData",dto);
				
		}
	

		
		

}
