package com.test.spring.DTO;

//정류장 주변 명소 DTO
public class AroundPlaceDTO {
	private String aroundPlaceSeq;					//정류장 주변 명소 seq
	private String aroundPlaceName;					//명소 이름
	private String busStopSeq;
	public String getAroundPlaceSeq() {
		return aroundPlaceSeq;
	}
	public void setAroundPlaceSeq(String aroundPlaceSeq) {
		this.aroundPlaceSeq = aroundPlaceSeq;
	}
	public String getAroundPlaceName() {
		return aroundPlaceName;
	}
	public void setAroundPlaceName(String aroundPlaceName) {
		this.aroundPlaceName = aroundPlaceName;
	}
	public String getBusStopSeq() {
		return busStopSeq;
	}
	public void setBusStopSeq(String busStopSeq) {
		this.busStopSeq = busStopSeq;
	}
	
}
