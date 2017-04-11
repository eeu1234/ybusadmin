package com.test.spring.busCategory;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.BusInfoDTO;
import com.test.spring.dto.BusStopCategoryDTO;

@Repository
public class BusStopManageDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	public List<BusStopCategoryDTO> busStopCategoryList(String seq) {
		
		return sql.selectList("bCategory.bCategoryList",seq);
	}
	
	
	public List<BusInfoDTO> busList(String seq){
		
		return sql.selectList("bCategory.busList",seq);
	}


	public int busStopCategoryMatch(HashMap<String, String> bdmap) {
		
		return sql.update("bCategory.upCategory",bdmap);
	}


	// 버스 추가
	public int busInfoAdd(HashMap<String, String> cmap) {
		return sql.insert("bCategory.addBus",cmap);
	}


	// 카테고리 추가
	public int busStopCategoryAdd(HashMap<String, String> caddmap) {
		return sql.insert("bCategory.addCategory", caddmap);
	}

	// 카테고리 삭제
	public int busStopCategoryDelete(String seq) {
		
		return sql.delete("bCategory.delCategory", seq);
	}

	//카테고리 수정을 위해 정보 가져오기
	public BusStopCategoryDTO busStopCategoryEditSel(String seq) {
		
		return sql.selectOne("bCategory.editSelCategory", seq);
	}

	// 카테고리 수정하기
	public int busStopCategoryEdit(BusStopCategoryDTO dto) {
		
		return sql.update("bCategory.editCategory",dto);
	}

	// 학교에 모든 카테고리
	public List<BusStopCategoryDTO> busStopCategoryTotalList(String seq) {

		return sql.selectList("bCategory.bTCategoryList",seq);
	}

	//버스 정보 삭제
	public int busInfoDelete(String seq) {
		
		return sql.delete("bCategory.delBus", seq);
	}

	//버스 수정을 위해 정보 가져오기
	public BusInfoDTO busInfoEditSel(String seq) {
		
		return sql.selectOne("bCategory.editSelBus", seq);
	}


	public int busInfoUpdate(BusInfoDTO bdto) {
		// TODO Auto-generated method stub
		return sql.update("bCategory.editBus", bdto);
	}
	
	
}
