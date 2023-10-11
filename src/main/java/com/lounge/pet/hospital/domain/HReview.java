package com.lounge.pet.hospital.domain;

import java.sql.Date;

public class HReview {
	private int hRNo;
	private int hNo;
	private String uId;
	private String hRContent;
	private Date hRCreate;
	private Date hRUpdate;
	private String hRStatus;
	
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
	public Date gethRCreate() {
		return hRCreate;
	}
	public void sethRCreate(Date hRCreate) {
		this.hRCreate = hRCreate;
	}
	public Date gethRUpdate() {
		return hRUpdate;
	}
	public void sethRUpdate(Date hRUpdate) {
		this.hRUpdate = hRUpdate;
	}
	public String gethRStatus() {
		return hRStatus;
	}
	public void sethRStatus(String hRStatus) {
		this.hRStatus = hRStatus;
	}
	
	@Override
	public String toString() {
		return "병원리뷰 [리뷰번호=" + hRNo + ", 병원번호=" + hNo + ", 작성자=" + uId + ", 내용=" + hRContent + ", 작성일="
				+ hRCreate + ", 수정일=" + hRUpdate + ", 사용여부=" + hRStatus + "]";
	}
}
