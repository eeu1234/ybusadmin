package com.test.spring.dto;

import java.util.List;

public class BusStopDetailCategoryDTO {
	private String busStopDetailCategorySeq;				//세부분류SEQ
	private String busStopDetailCategoryName;			//세부분류명
	private String busStopDetailCategoryInterval;		//인터벌타임
	private String busStopDetailCategoryIntervalDistance;		//인터벌거리
	private String busStopCategorySeq;					//정류장분류SEQ
	
	public String getBusStopDetailCategorySeq() {
		return busStopDetailCategorySeq;
	}
	public void setBusStopDetailCategorySeq(String busStopDetailCategorySeq) {
		this.busStopDetailCategorySeq = busStopDetailCategorySeq;
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
	public String getBusStopCategorySeq() {
		return busStopCategorySeq;
	}
	public void setBusStopCategorySeq(String busStopCategorySeq) {
		this.busStopCategorySeq = busStopCategorySeq;
	}
	
	
}
