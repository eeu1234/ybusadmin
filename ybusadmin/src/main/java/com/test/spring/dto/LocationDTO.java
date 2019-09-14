package com.test.spring.dto;

//버스 실시간 위치 DTO
public class LocationDTO {
	private String locationSeq;					//실시간 위치 seq
	private String locationLatitude;			//위도
	private String locationLongitude;			//경도
	private String locationTime;				//해당시간
	private String staffName;  					//staffName
	private String deviceSeq;					//장비 seq
	
	private String startTable;
	private String endTable;
	
	
	
	
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
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
	public String getStartTable() {
		return startTable;
	}
	public void setStartTable(String startTable) {
		this.startTable = startTable;
	}
	public String getEndTable() {
		return endTable;
	}
	public void setEndTable(String endTable) {
		this.endTable = endTable;
	}
}
