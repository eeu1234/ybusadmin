package com.test.spring.dto;

//버스기사 정보 DTO
public class DriverInfoDTO {
	private String driverInfoSeq;				//기사 정보 seq
	private String driverInfoName;				//기사 이름
	private String driverInfoGender;			//기사 성별
	private String driverInfoAge;				//기사 나이
	private String universitySeq;				//대학교 seq
	
	public String getDriverInfoSeq() {
		return driverInfoSeq;
	}
	public void setDriverInfoSeq(String driverInfoSeq) {
		this.driverInfoSeq = driverInfoSeq;
	}
	public String getDriverInfoName() {
		return driverInfoName;
	}
	public void setDriverInfoName(String driverInfoName) {
		this.driverInfoName = driverInfoName;
	}
	public String getDriverInfoGender() {
		return driverInfoGender;
	}
	public void setDriverInfoGender(String driverInfoGender) {
		this.driverInfoGender = driverInfoGender;
	}
	public String getDriverInfoAge() {
		return driverInfoAge;
	}
	public void setDriverInfoAge(String driverInfoAge) {
		this.driverInfoAge = driverInfoAge;
	}
	public String getUniversitySeq() {
		return universitySeq;
	}
	public void setUniversitySeq(String universitySeq) {
		this.universitySeq = universitySeq;
	}
	
	
}
