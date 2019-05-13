package com.test.spring.dto;

//정류장분류
public class BusStopCategoryDTO {
	
	private String busStopCategorySeq;		//정류장분류SEQ
	private String busStopCategory;			//정류장분류명
	private String busStopCategoryStat;		//정류장분류 상태
	private String universitySeq;			//학교SEQ
	private String groupbusHash;			//버스그룹키
	private String universityName;			//학교명
	
	
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

	public String getUniversityName() {
		return universityName;
	}
	public void setUniversityName(String universityName) {
		this.universityName = universityName;
	}
	public String getBusStopCategoryStat() {
		return busStopCategoryStat;
	}
	public String getGroupbusHash() {
		return groupbusHash;
	}
	public void setGroupbusHash(String groupbusHash) {
		this.groupbusHash = groupbusHash;
	}
	public void setBusStopCategoryStat(String busStopCategoryStat) {
		this.busStopCategoryStat = busStopCategoryStat;
	}
	
	
	
	
	
	

}
