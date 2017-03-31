package com.test.spring.dto;

//정류장 주변 명소 DTO
public class AroundPlaceDTO {
	private String aroundPlaceSeq;					//정류장 주변 명소 seq
	private String aroundPlaceName;					//명소 이름
	private String busStopSeq;						//어느정류장인지
	private String aroundPlaceLatitude;				//명소 위도
	private String aroundPlaceLongitude;			//경도
	private String aroundPlaceStat;					//보여짐 안보여짐
	
	public String getAroundPlaceLatitude() {
		return aroundPlaceLatitude;
	}
	public void setAroundPlaceLatitude(String aroundPlaceLatitude) {
		this.aroundPlaceLatitude = aroundPlaceLatitude;
	}
	public String getAroundPlaceLongitude() {
		return aroundPlaceLongitude;
	}
	public void setAroundPlaceLongitude(String aroundPlaceLongitude) {
		this.aroundPlaceLongitude = aroundPlaceLongitude;
	}
	public String getAroundPlaceStat() {
		return aroundPlaceStat;
	}
	public void setAroundPlaceStat(String aroundPlaceStat) {
		this.aroundPlaceStat = aroundPlaceStat;
	}
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
