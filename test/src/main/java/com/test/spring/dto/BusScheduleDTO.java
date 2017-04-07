package com.test.spring.dto;

//버스스케쥴 DTO + join 변수 2개 + 버스노선 이름
public class BusScheduleDTO {
	
	//버스스케쥴 dto 
	private String busScheduleSeq;			//버스스케쥴seq
	private String busTime;					//버스시간
	private String courseName;				//코스이름
	private String weekDays;				//평일/주말유무
	private String busStopDetailCategorySeq;//버스노선 디테일
	//join 변수 2개
	private String busStopCategorySeq;		//버스노선 카테고리
	private String universitySeq;			//대학seq
	//버스노선 이름
	private String busStopCategory;			//버스노선 이름
	
	
	public String getBusStopCategory() {
		return busStopCategory;
	}
	public void setBusStopCategory(String busStopCategory) {
		this.busStopCategory = busStopCategory;
	}
	public String getBusScheduleSeq() {
		return busScheduleSeq;
	}
	public void setBusScheduleSeq(String busScheduleSeq) {
		this.busScheduleSeq = busScheduleSeq;
	}
	public String getBusTime() {
		return busTime;
	}
	public void setBusTime(String busTime) {
		this.busTime = busTime;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getWeekDays() {
		return weekDays;
	}
	public void setWeekDays(String weekDays) {
		this.weekDays = weekDays;
	}
	public String getBusStopDetailCategorySeq() {
		return busStopDetailCategorySeq;
	}
	public void setBusStopDetailCategorySeq(String busStopDetailCategorySeq) {
		this.busStopDetailCategorySeq = busStopDetailCategorySeq;
	}
	public String getBusStopCategorySeq() {
		return busStopCategorySeq;
	}
	public void setBusStopCategorySeq(String busStopCategorySeq) {
		this.busStopCategorySeq = busStopCategorySeq;
	}
	public String getUniversitySeq() {
		return universitySeq;
	}
	public void setUniversitySeq(String universitySeq) {
		this.universitySeq = universitySeq;
	}
	
}
