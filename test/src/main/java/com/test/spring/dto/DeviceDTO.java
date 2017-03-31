package com.test.spring.dto;

//장치 DTO
public class DeviceDTO {
	private String deviceSeq;			//장치 번호
	private String deviceModel;			//장치 모델명
	private String deviceTel;			//장치 연락처
	private String universitySeq;		//대학교 seq
	
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
}
