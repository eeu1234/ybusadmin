package com.test.spring.DTO;

//정류장세부분류
public class BusStopDetalCategoryDTO {
	
	private String busStopDetalCategorySeq;				//세부분류SEQ
	private String busStopDetalCategoryName;			//세부분류명
	private String busStopDetalCategoryInterval;		//인터벌타임
	private String busStopCategorySeq;					//정류장분류SEQ
	
	
	public String getBusStopDetalCategorySeq() {
		return busStopDetalCategorySeq;
	}
	public void setBusStopDetalCategorySeq(String busStopDetalCategorySeq) {
		this.busStopDetalCategorySeq = busStopDetalCategorySeq;
	}
	public String getBusStopDetalCategoryName() {
		return busStopDetalCategoryName;
	}
	public void setBusStopDetalCategoryName(String busStopDetalCategoryName) {
		this.busStopDetalCategoryName = busStopDetalCategoryName;
	}
	public String getBusStopDetalCategoryInterval() {
		return busStopDetalCategoryInterval;
	}
	public void setBusStopDetalCategoryInterval(String busStopDetalCategoryInterval) {
		this.busStopDetalCategoryInterval = busStopDetalCategoryInterval;
	}
	public String getBusStopCategorySeq() {
		return busStopCategorySeq;
	}
	public void setBusStopCategorySeq(String busStopCategorySeq) {
		this.busStopCategorySeq = busStopCategorySeq;
	}
	


}
