package com.test.spring.dto;

public class NoticeFileDTO {
	
	private String noticeFileSeq;
	private String noticeFileName;
	private String noticeFileType;
	public String getNoticeFileType() {
		return noticeFileType;
	}
	public void setNoticeFileType(String noticeFileType) {
		this.noticeFileType = noticeFileType;
	}
	private String noticeSeq;
	
	public String getNoticeFileSeq() {
		return noticeFileSeq;
	}
	public void setNoticeFileSeq(String noticeFileSeq) {
		this.noticeFileSeq = noticeFileSeq;
	}
	public String getNoticeFileName() {
		return noticeFileName;
	}
	public void setNoticeFileName(String noticeFileName) {
		this.noticeFileName = noticeFileName;
	}
	public String getNoticeSeq() {
		return noticeSeq;
	}
	public void setNoticeSeq(String noticeSeq) {
		this.noticeSeq = noticeSeq;
	}
	
	

}
