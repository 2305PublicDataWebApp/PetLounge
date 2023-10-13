package com.lounge.pet.hospital.domain;

public class HBookmark {
	private String uId;
	private int hNo;
	
	public HBookmark() {}
	
	public HBookmark(String uId, int hNo) {
		super();
		this.uId = uId;
		this.hNo = hNo;
	}

	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public int gethNo() {
		return hNo;
	}
	public void sethNo(int hNo) {
		this.hNo = hNo;
	}
	
	@Override
	public String toString() {
		return "병원 즐겨찾기 [회원아이디=" + uId + ", 병원번호=" + hNo + "]";
	}
}
