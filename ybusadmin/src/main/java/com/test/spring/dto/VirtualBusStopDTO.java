package com.test.spring.dto;

//가상 정류장 DTO
public class VirtualBusStopDTO {

	private String virtualBusStopSeq;
	private String virtualBusStop;
	private String virtualBusStopOrder;
	private String virtualBusStopLine;
	private String virtualBusStopLatitude;
	private String virtualBusStopLongitude;
	private String busStopDetailCategorySeq;
	public String getVirtualBusStopSeq() {
		return virtualBusStopSeq;
	}
	public void setVirtualBusStopSeq(String virtualBusStopSeq) {
		this.virtualBusStopSeq = virtualBusStopSeq;
	}
	public String getVirtualBusStop() {
		return virtualBusStop;
	}
	public void setVirtualBusStop(String virtualBusStop) {
		this.virtualBusStop = virtualBusStop;
	}
	public String getVirtualBusStopLatitude() {
		return virtualBusStopLatitude;
	}
	public void setVirtualBusStopLatitude(String virtualBusStopLatitude) {
		this.virtualBusStopLatitude = virtualBusStopLatitude;
	}
	public String getVirtualBusStopLongitude() {
		return virtualBusStopLongitude;
	}
	public void setVirtualBusStopLongitude(String virtualBusStopLongitude) {
		this.virtualBusStopLongitude = virtualBusStopLongitude;
	}
	
	public String getVirtualBusStopOrder() {
		return virtualBusStopOrder;
	}
	public void setVirtualBusStopOrder(String virtualBusStopOrder) {
		this.virtualBusStopOrder = virtualBusStopOrder;
	}
	public String getVirtualBusStopLine() {
		return virtualBusStopLine;
	}
	public void setVirtualBusStopLine(String virtualBusStopLine) {
		this.virtualBusStopLine = virtualBusStopLine;
	}
	public String getBusStopDetailCategorySeq() {
		return busStopDetailCategorySeq;
	}
	public void setBusStopDetailCategorySeq(String busStopDetailCategorySeq) {
		this.busStopDetailCategorySeq = busStopDetailCategorySeq;
	}
	
	
	
	
}
