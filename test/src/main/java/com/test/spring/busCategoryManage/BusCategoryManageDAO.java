package com.test.spring.busCategoryManage;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.BusCategoryInfoDTO;
import com.test.spring.dto.BusStopCategoryDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;

@Repository
public class BusCategoryManageDAO {

	@Autowired
	private SqlSessionTemplate sql;

	//버스정보가 show인 리스트들 뽑아오기(대학 seq이용)
	public List<BusCategoryInfoDTO> getShowBusInfo(String seq) {
		// TODO Auto-generated method stub
		return sql.selectList("busCategoryManage.getShowBusInfo",seq);
	}

	//버스 대분류 가져오기
	public List<BusStopCategoryDTO> busStopCategory(String seq) {
		// TODO Auto-generated method stub
		return sql.selectList("busCategoryManage.busStopCategory",seq);
	}

	//버스 하나의 정보만 가져오기
	public BusCategoryInfoDTO getBusInfo(String seq) {
		// TODO Auto-generated method stub
		return sql.selectOne("busCategoryManage.getBusInfo",seq);
	}

	//버스 대분류 seq를 이용하여 show상태인 중분류 리스트를 가져온다
	public List<BusStopDetailCategoryDTO> getDetailCategory(String seq) {
		// TODO Auto-generated method stub
		return sql.selectList("busCategoryManage.getDetailCategory",seq);
	}

	//대분류,중분류를 가지고 버스인포 수정
	public int updateBusCategory(String seq,String busCategorySel, String busDetailCategorySel) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("seq",seq);
		map.put("busCategorySel",busCategorySel);
		map.put("busDetailCategorySel",busDetailCategorySel);
		
		//if(busCategorySel.equals("null") || busDetailCategorySel.equals("null")){
			return sql.update("busCategoryManage.updateBusCategory",map);
		//}else{
			
		//}
	}
	
	
	
}
