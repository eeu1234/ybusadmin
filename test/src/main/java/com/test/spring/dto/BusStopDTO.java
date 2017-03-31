package com.test.spring.dto;

/*******************************
 * 
 * --20170327
 * 정류장 DTO 최초설계
 * 
 *
 *******************************/

public class BusStopDTO {
	String busStopSeq;						//정류장 고유코드
	String busStop;							//정류장 명
	String busStopLatitude;					//정류장 위도
	String busStopLongitude;				//정류장 경도
	String busStopDetailCategorySeq;		//소유노선 고유코드
	String busStopLine;
	
	public String getBusStopLine() {
		return busStopLine;
	}
	public void setBusStopLine(String busStopLine) {
		this.busStopLine = busStopLine;
	}
	public String getBusStopSeq() {
		return busStopSeq;
	}
	public void setBusStopSeq(String busStopSeq) {
		this.busStopSeq = busStopSeq;
	}
	public String getBusStop() {
		return busStop;
	}
	public void setBusStop(String busStop) {
		this.busStop = busStop;
	}
	public String getBusStopLatitude() {
		return busStopLatitude;
	}
	public void setBusStopLatitude(String busStopLatitude) {
		this.busStopLatitude = busStopLatitude;
	}
	public String getBusStopLongitude() {
		return busStopLongitude;
	}
	public void setBusStopLongitude(String busStopLongitude) {
		this.busStopLongitude = busStopLongitude;
	}
	public String getBusStopDetailCategorySeq() {
		return busStopDetailCategorySeq;
	}
	public void setBusStopDetailCategorySeq(String busStopDetailCategorySeq) {
		this.busStopDetailCategorySeq = busStopDetailCategorySeq;
	}
	
	
}
