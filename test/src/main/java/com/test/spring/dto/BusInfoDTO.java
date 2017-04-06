package com.test.spring.dto;


//버스 정보 DTO
public class BusInfoDTO {

	private String busInfoSeq;				//버스 정보 seq
	private String busInfoNum;				//버스 번호
	private String busInfoName;				//버스 이름
	private String universitySeq;			//대학교 seq
	private String busCategorySeq;			//버스 카테고리 seq
	
	public String getBusInfoSeq() {
		return busInfoSeq;
	}
	public void setBusInfoSeq(String busInfoSeq) {
		this.busInfoSeq = busInfoSeq;
	}
	public String getBusInfoNum() {
		return busInfoNum;
	}
	public void setBusInfoNum(String busInfoNum) {
		this.busInfoNum = busInfoNum;
	}
	public String getBusInfoName() {
		return busInfoName;
	}
	public void setBusInfoName(String busInfoName) {
		this.busInfoName = busInfoName;
	}
	public String getUniversitySeq() {
		return universitySeq;
	}
	public void setUniversitySeq(String universitySeq) {
		this.universitySeq = universitySeq;
	}
	public String getBusCategorySeq() {
		return busCategorySeq;
	}
	public void setBusCategorySeq(String busCategorySeq) {
		this.busCategorySeq = busCategorySeq;
	}
	
	
	
}
