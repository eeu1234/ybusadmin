package com.test.spring.dto;

import java.util.List;

//버스시간표 선택된 값 저장하는 DTO
public class BusScheduleSearchDTO {
	
	private String busStopCategorySeq;	//버스스탑디테일카테고리 seq
	private String busStopDetailCategorySeq;	//버스스탑
	private String weekDays;			//주말/평일 유무
	
	//가져온 값 담는 용도
	private List<BusScheduleDTO> timeList;
	
	public String getBusStopDetailCategorySeq() {
		return busStopDetailCategorySeq;
	}
	public void setBusStopDetailCategorySeq(String busStopDetailCategorySeq) {
		this.busStopDetailCategorySeq = busStopDetailCategorySeq;
	}
	public List<BusScheduleDTO> getTimeList() {
		return timeList;
	}
	public void setTimeList(List<BusScheduleDTO> timeList) {
		this.timeList = timeList;
	}
	public String getBusStopCategorySeq() {
		return busStopCategorySeq;
	}
	public void setBusStopCategorySeq(String busStopCategorySeq) {
		this.busStopCategorySeq = busStopCategorySeq;
	}
	public String getWeekDays() {
		return weekDays;
	}
	public void setWeekDays(String weekDays) {
		this.weekDays = weekDays;
	}
	
}
