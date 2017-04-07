package com.test.spring.dto;

//정류장세부분류
public class BusStopDetalCategoryDTO {
	
	private String busStopDetalCategorySeq;				//세부분류SEQ
	private String busStopDetailCategoryName;			//세부분류명
	private String busStopDetailCategoryInterval;		//인터벌타임
	private String busStopDetailCategoryIntervalDistance;		//인터벌거리
	private String busStopCategorySeq;					//정류장분류SEQ
	
	public String getBusStopCategorySeq() {
		return busStopCategorySeq;
	}
	public void setBusStopCategorySeq(String busStopCategorySeq) {
		this.busStopCategorySeq = busStopCategorySeq;
	}
	public String getBusStopDetalCategorySeq() {
		return busStopDetalCategorySeq;
	}
	public void setBusStopDetalCategorySeq(String busStopDetalCategorySeq) {
		this.busStopDetalCategorySeq = busStopDetalCategorySeq;
	}
	public String getBusStopDetailCategoryName() {
		return busStopDetailCategoryName;
	}
	public void setBusStopDetailCategoryName(String busStopDetailCategoryName) {
		this.busStopDetailCategoryName = busStopDetailCategoryName;
	}
	public String getBusStopDetailCategoryInterval() {
		return busStopDetailCategoryInterval;
	}
	public void setBusStopDetailCategoryInterval(String busStopDetailCategoryInterval) {
		this.busStopDetailCategoryInterval = busStopDetailCategoryInterval;
	}
	public String getBusStopDetailCategoryIntervalDistance() {
		return busStopDetailCategoryIntervalDistance;
	}
	public void setBusStopDetailCategoryIntervalDistance(String busStopDetailCategoryIntervalDistance) {
		this.busStopDetailCategoryIntervalDistance = busStopDetailCategoryIntervalDistance;
	}
	


}
