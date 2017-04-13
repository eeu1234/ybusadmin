package com.test.spring.dto;

//관리자 정보 DTO
public class AdminUniversityDTO {
	
	private String adminID;						//관리자 아이디
	private String adminPassword;				//관리자 비밀번호
	private String adminName;					//관리자 이름
	private String adminDepartment;				//관리자 부서
	private String adminLevel;					//관리자 레벨
	private String universitySeq;				//대학교 seq

	private String universityName;     			 //대학교 명
	private String universityTel;     			 //대학교 연락처
	private String universityLatitude;  		 //대학교 위도
	private String universityLongitude;  		 //대학교 경도
	
	public AdminUniversityDTO(){
		
	}
	
	public String getAdminID() {
		return adminID;
	}
	public void setAdminID(String adminID) {
		this.adminID = adminID;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminDepartment() {
		return adminDepartment;
	}
	public void setAdminDepartment(String adminDepartment) {
		this.adminDepartment = adminDepartment;
	}
	public String getAdminLevel() {
		return adminLevel;
	}
	public void setAdminLevel(String adminLevel) {
		this.adminLevel = adminLevel;
	}
	public String getUniversitySeq() {
		return universitySeq;
	}
	public void setUniversitySeq(String universitySeq) {
		this.universitySeq = universitySeq;
	}
	public String getUniversityName() {
		return universityName;
	}
	public void setUniversityName(String universityName) {
		this.universityName = universityName;
	}
	public String getUniversityTel() {
		return universityTel;
	}
	public void setUniversityTel(String universityTel) {
		this.universityTel = universityTel;
	}
	public String getUniversityLatitude() {
		return universityLatitude;
	}
	public void setUniversityLatitude(String universityLatitude) {
		this.universityLatitude = universityLatitude;
	}
	public String getUniversityLongitude() {
		return universityLongitude;
	}
	public void setUniversityLongitude(String universityLongitude) {
		this.universityLongitude = universityLongitude;
	}
	
	


}
