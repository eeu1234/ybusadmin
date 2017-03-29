package com.test.spring.DTO;

//장치-버스 관계 DTO
public class DeviceBusDTO {
	private String deviceBusSeq;					//장치-버스 seq
	private String deviceBusRegdate;				//등록날짜
	private String deviceSeq;						//장치 seq
	private String busInfoSeq;						//버스 정보 seq
	public String getDeviceBusSeq() {
		return deviceBusSeq;
	}
	public void setDeviceBusSeq(String deviceBusSeq) {
		this.deviceBusSeq = deviceBusSeq;
	}
	public String getDeviceBusRegdate() {
		return deviceBusRegdate;
	}
	public void setDeviceBusRegdate(String deviceBusRegdate) {
		this.deviceBusRegdate = deviceBusRegdate;
	}
	public String getDeviceSeq() {
		return deviceSeq;
	}
	public void setDeviceSeq(String deviceSeq) {
		this.deviceSeq = deviceSeq;
	}
	public String getBusInfoSeq() {
		return busInfoSeq;
	}
	public void setBusInfoSeq(String busInfoSeq) {
		this.busInfoSeq = busInfoSeq;
	}
	
}
