package com.test.spring.dto;

public class PredictBusTimeDTO {
	private int s_busstopseq;
	private String s_busstopname;
	private int a_busstopseq;
	private String a_busstopname;
	private int avgTime;
	private int datacnt;
	
	
	public int getS_busstopseq() {
		return s_busstopseq;
	}
	public void setS_busstopseq(int s_busstopseq) {
		this.s_busstopseq = s_busstopseq;
	}
	public int getA_busstopseq() {
		return a_busstopseq;
	}
	public void setA_busstopseq(int a_busstopseq) {
		this.a_busstopseq = a_busstopseq;
	}
	public String getA_busstopname() {
		return a_busstopname;
	}
	public void setA_busstopname(String a_busstopname) {
		this.a_busstopname = a_busstopname;
	}
	public String getS_busstopname() {
		return s_busstopname;
	}
	public void setS_busstopname(String s_busstopname) {
		this.s_busstopname = s_busstopname;
	}
	public int getAvgTime() {
		return avgTime;
	}
	public void setAvgTime(int avgTime) {
		this.avgTime = avgTime;
	}
	public int getDatacnt() {
		return datacnt;
	}
	public void setDatacnt(int datacnt) {
		this.datacnt = datacnt;
	}
	
	
	

}
