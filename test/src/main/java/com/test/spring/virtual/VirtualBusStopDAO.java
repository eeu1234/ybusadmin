package com.test.spring.virtual;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.BusStopDTO;
import com.test.spring.dto.VirtualBusStopDTO;

@Repository
public class VirtualBusStopDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	
	//세부정류장에 해당하는 가상정류장 모두 삭제
	public int deleteVirtualBusStop(String detailCategorySel) {
		
		return sql.delete("virtualBusStop.deleteVirtualBusStop",detailCategorySel);
	}

	//select를 하여 가상정류장테이블로 복사할 값들을 가져옴
	public List<BusStopDTO> copyBusStop(String detailCategorySel) {
		// TODO Auto-generated method stub
		return sql.selectList("virtualBusStop.copyBusStop",detailCategorySel);
	}
	
	
	//복사한 버스정류장 리스트를 가상정류장 테이블에 붙여넣는다
	public int pasteVirtualBusStop(BusStopDTO busStopDTO) {
		// TODO Auto-generated method stub
		return sql.insert("virtualBusStop.pasteVirtualBusStop",busStopDTO);
	}
	
	//가상정류장 수정
	public int saveVirtualBusStop(VirtualBusStopDTO dto) {
		// TODO Auto-generated method stub
		return sql.update("virtualBusStop.saveVirtualBusStop",dto);
	}
	
	//가상정류장 리스트 가져오기
	public List<VirtualBusStopDTO> virtualBusStop(String bseq) {
		// TODO Auto-generated method stub
		return sql.selectList("virtualBusStop.virtualBusStopList",bseq);
	}
	
	
	
}
