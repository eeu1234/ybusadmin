package com.test.spring.dto;

public class BusStopAvgLatLonDTO {
	String avgLat;
	String avgLon;
	String minLat;
	String maxLat;
	String minLon;
	String maxLon;
	
	public String getMinLat() {
		return minLat;
	}
	public void setMinLat(String minLat) {
		this.minLat = minLat;
	}
	public String getMaxLat() {
		return maxLat;
	}
	public void setMaxLat(String maxLat) {
		this.maxLat = maxLat;
	}
	public String getMinLon() {
		return minLon;
	}
	public void setMinLon(String minLon) {
		this.minLon = minLon;
	}
	public String getMaxLon() {
		return maxLon;
	}
	public void setMaxLon(String maxLon) {
		this.maxLon = maxLon;
	}
	public String getAvgLat() {
		return avgLat;
	}
	public void setAvgLat(String avgLat) {
		this.avgLat = avgLat;
	}
	public String getAvgLon() {
		return avgLon;
	}
	public void setAvgLon(String avgLon) {
		this.avgLon = avgLon;
	}
	
	
}
