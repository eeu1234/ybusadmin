package com.test.spring.dto;


//버스 정보 DTO
public class BusInfoDTO {

	private String busInfoSeq;				//버스 정보 seq
	private String busInfoNum;				//버스 번호
	private String busInfoName;				//버스 이름
	private String busInfoStat;				//버스 이름
	private String universitySeq;			//대학교 seq
	private String busStopCategorySeq;			//버스 카테고리 seq
	private String busStopCategory;
	
	private String busStopCategoryStat;			//
	
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
	public String getBusStopCategorySeq() {
		return busStopCategorySeq;
	}
	public void setBusStopCategorySeq(String busStopCategorySeq) {
		this.busStopCategorySeq = busStopCategorySeq;
	}
	public String getBusStopCategory() {
		return busStopCategory;
	}
	public void setBusStopCategory(String busStopCategory) {
		this.busStopCategory = busStopCategory;
	}
	public String getBusStopCategoryStat() {
		return busStopCategoryStat;
	}
	public void setBusStopCategoryStat(String busStopCategoryStat) {
		this.busStopCategoryStat = busStopCategoryStat;
	}
	public String getBusInfoStat() {
		return busInfoStat;
	}
	public void setBusInfoStat(String busInfoStat) {
		this.busInfoStat = busInfoStat;
	}
	
	
	
}
