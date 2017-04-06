package com.test.spring.dto;

//정류장분류
public class BusStopCategoryDTO {
	
	private String busStopCategorySeq;		//정류장분류SEQ
	private String busStopCategory;			//정류장분류명
	private String universitySeq;			//학교SEQ
	
	
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
	public String getUniversitySeq() {
		return universitySeq;
	}
	public void setUniversitySeq(String universitySeq) {
		this.universitySeq = universitySeq;
	}
	
	
	
	
	
	

}
