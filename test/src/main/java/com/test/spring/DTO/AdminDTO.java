package com.test.spring.DTO;

//관리자 정보 DTO + 대학교 이름
public class AdminDTO {
	
	private String adminID;						//관리자 아이디
	private String adminPassword;				//관리자 비밀번호
	private String adminName;					//관리자 이름
	private String adminDepartment;				//관리자 부서
	private String adminLevel;					//관리자 레벨
	private String universitySeq;				//대학교 seq
	//admin 관리를 위해 대학명 변수 하나 추가
	private String universityName;				//대학교 이름
	
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
	
}
