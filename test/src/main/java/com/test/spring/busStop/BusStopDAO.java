package com.test.spring.busStop;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.test.spring.dto.BusStopCategoryDTO;
import com.test.spring.dto.BusStopDTO;
import com.test.spring.dto.BusStopDetailCategoryDTO;
import com.test.spring.dto.UniversityDTO;

@Repository
public class BusStopDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	
	//버스 노선 종류에 따른 정류장 정보 가져오기
	public List<BusStopDTO> busStop(String bseq) {
		// TODO Auto-generated method stub
		return sql.selectList("bbusStop.busStopList",bseq);
	}

	
	
	//버스정류장 수정,추가 등등
	public int saveBusStop(BusStopDTO dto) {
		// TODO Auto-generated method stub
		
		System.out.println("seq : "+dto.getBusStopSeq());
		
		
		//seq가 없다면 추가
		if(dto.getBusStopSeq() == null || dto.getBusStopSeq().equals("") ){
			return sql.insert("bbusStop.addBusStop",dto);
		}else{
			//seq가 존재한다면 수정
			return sql.update("bbusStop.updateBusStop",dto);
			
		}
		
	}


	//정류장 삭제 
	public int deleteBusStop(String seq) {
		// TODO Auto-generated method stub
		return sql.delete("bbusStop.deleteBusStop",seq);
		
	}


	//location테이블에 해당 외래키를 가진 놈을 전부 null처리한다
	public int updateLocation(String seq) {
		// TODO Auto-generated method stub
		return sql.update("bbusStop.updateLocation",seq);
	}


	
	//대학교 가져오기
	   public List<UniversityDTO> list() {
	      
	      return sql.selectList("bbusStop.university");
	   }
	   
	   //대학교 위도,경도
	   public List<UniversityDTO> universityMap(String seq) {
	      
	   return sql.selectList("bbusStop.universityMap",seq);
	   }

	   
	   //버스 분류
	   public List<BusStopCategoryDTO> busStopCategory(String seq) {
	      
	      
	      return sql.selectList("bbusStop.busStopCategory",seq);
	   }

	   //버스 세부 분류
	   public List<BusStopDetailCategoryDTO> busStopDetailCategory(String seq) {
	      
	      return sql.selectList("bbusStop.busStopDetailCategory",seq);
	   }



	
	
	
	
}
