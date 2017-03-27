package com.test.spring.android.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class androidDAO {

	@Autowired
	SqlSessionTemplate sql;
	
	

		public String findDeviceSeq(String deviceId) {

			return sql.selectOne("deviceSeq",deviceId);
		}



		public String findDeviceInterval(String deviceId) {

			
			
			return sql.selectOne("deviceIntervalTime",deviceId);
		}
	


}
