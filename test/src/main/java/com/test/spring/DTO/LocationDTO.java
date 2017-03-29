package com.test.spring.DTO;

//버스 실시간 위치 DTO
public class LocationDTO {
	private String locationSeq;					//실시간 위치 seq
	private String locationLatitude;			//위도
	private String locationLongitude;			//경도
	private String locationTime;				//해당시간
	private String deviceSeq;					//장비 seq
	private String busStopSeq;					//버스정류장 seq
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
