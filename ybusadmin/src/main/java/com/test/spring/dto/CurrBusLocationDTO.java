package com.test.spring.dto;

public class CurrBusLocationDTO {
	String locationSeq;
	String locationLatitude;
	String locationLongitude;
	String locationTime;
	String deviceSeq;
	String busStopSeq;
	String businfoName;
	String businfoNum;
	String businfoSeq;
	//영광//
	String busStopCategorySeq;
	
	
	//영광
	public String getBusStopCategorySeq() {
		return busStopCategorySeq;
	}
	public void setBusStopCategorySeq(String busStopCategorySeq) {
		this.busStopCategorySeq = busStopCategorySeq;
	}
	//영광끝
	public String getBusinfoName() {
		return businfoName;
	}
	public void setBusinfoName(String businfoName) {
		this.businfoName = businfoName;
	}
	public String getBusinfoNum() {
		return businfoNum;
	}
	public void setBusinfoNum(String businfoNum) {
		this.businfoNum = businfoNum;
	}
	public String getbusinfoSeq() {
		return businfoSeq;
	}
	public void setbusinfoSeq(String businfoSeq) {
		this.businfoSeq = businfoSeq;
	}
	public String getLocationSeq() {
		return locationSeq;
	}
	public void setLocationSeq(String locationSeq) {
		this.locationSeq = locationSeq;
	}
	public String getLocationLatitude() {
		return locationLatitude;
	}
	public void setLocationLatitude(String locationLatitude) {
		this.locationLatitude = locationLatitude;
	}
	public String getLocationLongitude() {
		return locationLongitude;
	}
	public void setLocationLongitude(String locationLongitude) {
		this.locationLongitude = locationLongitude;
	}
	public String getLocationTime() {
		return locationTime;
	}
	public void setLocationTime(String locationTime) {
		this.locationTime = locationTime;
	}
	public String getDeviceSeq() {
		return deviceSeq;
	}
	public void setDeviceSeq(String deviceSeq) {
		this.deviceSeq = deviceSeq;
	}
	public String getBusStopSeq() {
		return busStopSeq;
	}
	public void setBusStopSeq(String busStopSeq) {
		this.busStopSeq = busStopSeq;
	}
	
	
}
