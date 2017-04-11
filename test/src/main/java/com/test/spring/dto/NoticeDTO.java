package com.test.spring.dto;

import java.util.List;

public class NoticeDTO {
	
	private String noticeSeq;
	private String noticeSubject;
	private String noticeContent;
	private String noticeRegdate;
	private String noticeReadCount;
	private String notisStatus;
	private String adminID;
	
	private String adminName;
	private String adminDepartment;
	private String adminLevel;
	private String universitySeq;
	
	private String universityName;
	
	private List<NoticeFileDTO> filelist;
	

	public List<NoticeFileDTO> getFilelist() {
		return filelist;
	}

	public void setFilelist(List<NoticeFileDTO> filelist) {
		this.filelist = filelist;
	}

	public String getNoticeSeq() {
		return noticeSeq;
	}

	public void setNoticeSeq(String noticeSeq) {
		this.noticeSeq = noticeSeq;
	}

	public String getNoticeSubject() {
		return noticeSubject;
	}

	public void setNoticeSubject(String noticeSubject) {
		this.noticeSubject = noticeSubject;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeRegdate() {
		return noticeRegdate;
	}

	public void setNoticeRegdate(String noticeRegdate) {
		this.noticeRegdate = noticeRegdate;
	}

	public String getNoticeReadCount() {
		return noticeReadCount;
	}

	public void setNoticeReadCount(String noticeReadCount) {
		this.noticeReadCount = noticeReadCount;
	}

	public String getNotisStatus() {
		return notisStatus;
	}

	public void setNotisStatus(String notisStatus) {
		this.notisStatus = notisStatus;
	}

	public String getAdminID() {
		return adminID;
	}

	public void setAdminID(String adminID) {
		this.adminID = adminID;
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
