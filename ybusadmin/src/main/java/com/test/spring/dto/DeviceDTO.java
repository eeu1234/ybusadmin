package com.test.spring.dto;

//장치 DTO
public class DeviceDTO {
	private String deviceSeq;			//장치 번호
	private String deviceModel;			//장치 모델명
	private String deviceTel;			//장치 연락처
	
	private String universitySeq;		//대학교 seq
	private String universityName;		//대학교 이름
	private String busInfoName;
	
	public String getDeviceSeq() {
		return deviceSeq;
	}
	public void setDeviceSeq(String deviceSeq) {
		this.deviceSeq = deviceSeq;
	}
	public String getDeviceModel() {
		return deviceModel;
	}
	public void setDeviceModel(String deviceModel) {
		this.deviceModel = deviceModel;
	}
	public String getDeviceTel() {
		return deviceTel;
	}
	public void setDeviceTel(String deviceTel) {
		this.deviceTel = deviceTel;
	}
	public String getUniversitySeq() {
		return universitySeq;
	}
	public void setUniversitySeq(String universitySeq) {
		this.universitySeq = universitySeq;
	}
	public String getBusInfoName() {
		return busInfoName;
	}
	public void setBusInfoName(String busInfoName) {
		this.busInfoName = busInfoName;
	}
	public String getUniversityName() {
		return universityName;
	}
	public void setUniversityName(String universityName) {
		this.universityName = universityName;
	}
}
