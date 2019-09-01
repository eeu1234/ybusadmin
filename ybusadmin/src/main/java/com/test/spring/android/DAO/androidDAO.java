package com.test.spring.android.DAO;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.TimeZone;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.BusLogDTO;
import com.test.spring.dto.BusStopDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;
import com.test.spring.dto.LocationDTO;
import com.test.spring.dto.VirtualBusStopDTO;

@Repository
public class androidDAO {

	private static final int String = 0;
	
	
	@Autowired
	SqlSessionTemplate sql;
	
		//1번. 프로세스

		//기기seq 찾기
		public String findDeviceSeq(String deviceId) {
			String result = sql.selectOne("deviceSeq",deviceId);
			if(result == null){
				sql.insert("newDevice",deviceId);
			}
			
			

			return sql.selectOne("deviceSeq",deviceId);
		}


		//기기 intervalTime
		public BusStopDetailCategoryDTO findDeviceInterval(String deviceId) {
			return sql.selectOne("deviceInterval",deviceId);
		}



		//2번 프로세스
		
		
		//버스SEQ,위도,경도 INSERT
		public int insertBusLocation(String deviceSeq, String deviceLat, String deviceLng,String lastCheckDate) {

			LocationDTO dto = new LocationDTO();
			dto.setDeviceSeq(deviceSeq);
			dto.setLocationLatitude(deviceLat);
			dto.setLocationLongitude(deviceLng);
	
			return sql.insert("android.busData",dto);
				
		}


		public LocationDTO getRecentLocation(String deviceSeq, String deviceLat, String deviceLng) {

			LocationDTO dto = new LocationDTO();
			dto.setDeviceSeq(deviceSeq);
			dto.setLocationLatitude(deviceLat);
			dto.setLocationLongitude(deviceLng);

			
			return sql.selectOne("recentData",dto);
		}


		public List<VirtualBusStopDTO> getMyBusStop(String deviceId) {
			
			
			
			return sql.selectList("myBusStop",deviceId);
		}


		public String findDeviceId(String deviceSeq) {
			
			
			return sql.selectOne("findDeviceId",deviceSeq);
		}


		public int updateBusStop(String locationSeq, String myBusStop) {
			LocationDTO dto = new LocationDTO();
			dto.setLocationSeq(locationSeq);
			dto.setBusStopSeq(myBusStop);
			return sql.update("android.updateBusStop",dto);
		}


		public BusStopDTO myLastBusStop(String deviceSeq) {

			
			
			return sql.selectOne("android.myLastBusStop",deviceSeq);
		}

	
		
		//싸인패드 운행대장
		
		public int insertBusLog(
				BusLogDTO logDto) {

		
			
			
			return sql.insert("android.sign",logDto);
			
		}


	
	

		
		

}