package com.test.spring.admin.detailcategory;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.BusStopCategoryDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;


@Repository
public class AdminDetailCategoryDAO {

	@Autowired
	private SqlSessionTemplate sql;

	
	

	//세션에 있는 대학시퀀스 이용하여 버스종류 리스트 가져오기
	public List<BusStopCategoryDTO> categoryList(String universitySeq) {
		// TODO Auto-generated method stub
		return sql.selectList("adminDetailCategory.busStopCategory",universitySeq);
	}



	//show상태인 카테고리 가져오기
	public List<BusStopDetailCategoryDTO> showDetailCategoryList(String seq) {
		// TODO Auto-generated method stub
		return sql.selectList("adminDetailCategory.showDetailCategoryList",seq);
	}


	//hide상태인 카테고리 가져오기
	public List<BusStopDetailCategoryDTO> hideDetailCategoryList(String seq) {
		// TODO Auto-generated method stub
		return sql.selectList("adminDetailCategory.hideDetailCategoryList",seq);
	}


	//상세분류 추가하기
	public int addDetailCategory(BusStopDetailCategoryDTO dto) {
		// TODO Auto-generated method stub
		return sql.insert("adminDetailCategory.addDetailCategory",dto);
	}


	//글번호로 세부카테고리 정보 가져오기
	public BusStopDetailCategoryDTO getDetailcategory(String seq) {
		// TODO Auto-generated method stub
		return sql.selectOne("adminDetailCategory.getDetailcategory",seq);
	}


	//수정할 내용들을 가지고 업데이트를 날림
	public int updateDetailCategory(BusStopDetailCategoryDTO updateDetailCategory) {
		// TODO Auto-generated method stub
		return sql.update("adminDetailCategory.updateDetailCategory",updateDetailCategory);
	}


	//세부카테고리 삭제
	public int deleteDetailCategory(String seq) {
		// TODO Auto-generated method stub
		try{
			return sql.delete("adminDetailCategory.deleteDetailCategory",seq);			
		}catch(Exception e){
			System.out.println("삭제실패");
		}
		return 0;
	}
	
	
	 
	
}
