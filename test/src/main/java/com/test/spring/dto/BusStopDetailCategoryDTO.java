package com.test.spring.dto;

//정류장세부분류
public class BusStopDetailCategoryDTO {
	
	private String busStopDetailCategorySeq;				//세부분류SEQ
	private String busStopDetailCategoryName;			//세부분류명
	private String busStopDetailCategoryInterval;		//인터벌타임
	private String busStopDetailCategoryIntervalDistance;		//인터벌거리
	private String busStopDetailCategoryStat;			//show,hide
	private String busStopCategorySeq;					//정류장분류SEQ
	
	private String busStopCategory;//버스뷰류 명
	
	private String count;//정류장 갯수
	
	
	public String getBusStopDetailCategorySeq() {
		return busStopDetailCategorySeq;
	}
	public void setBusStopDetailCategorySeq(String busStopDetailCategorySeq) {
		this.busStopDetailCategorySeq = busStopDetailCategorySeq;
	}
	public String getBusStopDetailCategoryName() {
		return busStopDetailCategoryName;
	}
	public void setBusStopDetailCategoryName(String busStopDetailCategoryName) {
		this.busStopDetailCategoryName = busStopDetailCategoryName;
	}
	public String getBusStopDetailCategoryInterval() {
		return busStopDetailCategoryInterval;
	}
	public void setBusStopDetailCategoryInterval(String busStopDetailCategoryInterval) {
		this.busStopDetailCategoryInterval = busStopDetailCategoryInterval;
	}
	public String getBusStopCategorySeq() {
		return busStopCategorySeq;
	}
	public void setBusStopCategorySeq(String busStopCategorySeq) {
		this.busStopCategorySeq = busStopCategorySeq;
	}
	public String getBusStopDetailCategoryIntervalDistance() {
		return busStopDetailCategoryIntervalDistance;
	}
	public void setBusStopDetailCategoryIntervalDistance(String busStopDetailCategoryIntervalDistance) {
		this.busStopDetailCategoryIntervalDistance = busStopDetailCategoryIntervalDistance;
	}
	public String getBusStopDetailCategoryStat() {
		return busStopDetailCategoryStat;
	}
	public void setBusStopDetailCategoryStat(String busStopDetailCategoryStat) {
		this.busStopDetailCategoryStat = busStopDetailCategoryStat;
	}
	public String getBusStopCategory() {
		return busStopCategory;
	}
	public void setBusStopCategory(String busStopCategory) {
		this.busStopCategory = busStopCategory;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	


}
