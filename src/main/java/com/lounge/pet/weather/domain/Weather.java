package com.lounge.pet.weather.domain;

public class Weather {

	// 필드
	private int tmiNo;
	private String tmiContent;
	private String tmiStatus;
	
	// getter, setter 메소드
	public int getTmiNo() {
		return tmiNo;
	}
	public void setTmiNo(int tmiNo) {
		this.tmiNo = tmiNo;
	}
	public String getTmiContent() {
		return tmiContent;
	}
	public void setTmiContent(String tmiContent) {
		this.tmiContent = tmiContent;
	}
	public String getTmiStatus() {
		return tmiStatus;
	}
	public void setTmiStatus(String tmiStatus) {
		this.tmiStatus = tmiStatus;
	}
	
	// toString() 오버라이드 - 정보 확인용
	@Override
	public String toString() {
		return "TMI정보 [글 번호=" + tmiNo + ", 글 내용=" + tmiContent + ", 사용여부=" + tmiStatus + "]";
	}
	
}
