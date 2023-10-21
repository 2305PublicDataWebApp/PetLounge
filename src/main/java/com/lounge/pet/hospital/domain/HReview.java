package com.lounge.pet.hospital.domain;

import java.sql.Timestamp;

public class HReview {
	private int hRNo;
	private int hNo;
	private String uId;
	private String hRContent;
	private Timestamp hRCreate;
	private Timestamp hRUpdate;
	private String hRStatus;
	private String hRNickName;
	private String hRProfileImg;
	private String hRSearchKeyword;
	
	public HReview() {}
	
	public HReview(int hNo, String hRSearchKeyword) {
		super();
		this.hNo = hNo;
		this.hRSearchKeyword = hRSearchKeyword;
	}

	public int gethRNo() {
		return hRNo;
	}
	public void sethRNo(int hRNo) {
		this.hRNo = hRNo;
	}
	public int gethNo() {
		return hNo;
	}
	public void sethNo(int hNo) {
		this.hNo = hNo;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String gethRContent() {
		return hRContent;
	}
	public void sethRContent(String hRContent) {
		this.hRContent = hRContent;
	}
	public Timestamp gethRCreate() {
		return hRCreate;
	}
	public void sethRCreate(Timestamp hRCreate) {
		this.hRCreate = hRCreate;
	}
	public Timestamp gethRUpdate() {
		return hRUpdate;
	}
	public void sethRUpdate(Timestamp hRUpdate) {
		this.hRUpdate = hRUpdate;
	}
	public String gethRStatus() {
		return hRStatus;
	}
	public void sethRStatus(String hRStatus) {
		this.hRStatus = hRStatus;
	}
	public String gethRNickName() {
		return hRNickName;
	}
	public void sethRNickName(String hRNickName) {
		this.hRNickName = hRNickName;
	}
	public String gethRProfileImg() {
		return hRProfileImg;
	}
	public void sethRProfileImg(String hRProfileImg) {
		this.hRProfileImg = hRProfileImg;
	}
	public String gethRSearchKeyword() {
		return hRSearchKeyword;
	}
	public void sethRSearchKeyword(String hRSearchKeyword) {
		this.hRSearchKeyword = hRSearchKeyword;
	}

	@Override
	public String toString() {
		return "병원리뷰 [리뷰번호=" + hRNo + ", 병원번호=" + hNo + ", 작성자=" + uId + ", 내용=" + hRContent + ", 작성일="
				+ hRCreate + ", 수정일=" + hRUpdate + ", 사용여부=" + hRStatus + "]";
	}
}
