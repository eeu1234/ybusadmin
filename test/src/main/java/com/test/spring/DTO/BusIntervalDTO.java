package com.test.spring.DTO;

//버스별 인터벌 DTO
public class BusIntervalDTO {
	private String busIntervalSeq;			//버스 인터벌 seq
	private String busInfoSeq;				//버스 정보 seq
	private String busStopDetailCategorySeq;//인터벌 seq
	public String getBusIntervalSeq() {
		return busIntervalSeq;
	}
	public void setBusIntervalSeq(String busIntervalSeq) {
		this.busIntervalSeq = busIntervalSeq;
	}
	public String getBusInfoSeq() {
		return busInfoSeq;
	}
	public void setBusInfoSeq(String busInfoSeq) {
		this.busInfoSeq = busInfoSeq;
	}
	public String getBusStopDetailCategorySeq() {
		return busStopDetailCategorySeq;
	}
	public void setBusStopDetailCategorySeq(String busStopDetailCategorySeq) {
		this.busStopDetailCategorySeq = busStopDetailCategorySeq;
	}
	
}
