package com.test.spring.dto;

//버스 카테고리 DTO
public class BusCategoryDTO {
	private String busCategorySeq;			//버스카테고리 seq
	private String busCategoryName;			//버스카테고리 이름
	
	public String getBusCategorySeq() {
		return busCategorySeq;
	}
	public void setBusCategorySeq(String busCategorySeq) {
		this.busCategorySeq = busCategorySeq;
	}
	public String getBusCategoryName() {
		return busCategoryName;
	}
	public void setBusCategoryName(String busCategoryName) {
		this.busCategoryName = busCategoryName;
	}
	
	
}
