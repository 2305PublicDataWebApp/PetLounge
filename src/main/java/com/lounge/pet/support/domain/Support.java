package com.lounge.pet.support.domain;

import java.sql.Date;

public class Support {
	private int sNo;
	private String sCategory;
	private String sTitle;
	private String sContent;
	private String sGroup;
	private Date sCreate;
	private Date sUpdate;
	private Date sStart;
	private Date sEnd;
	private int sTargetAmount;
	private int sFundAmount;
	private int sCount;
	private String sStatus;
	private String sImageUrl;
	
	
	
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public String getsCategory() {
		return sCategory;
	}
	public void setsCategory(String sCategory) {
		this.sCategory = sCategory;
	}
	public String getsTitle() {
		return sTitle;
	}
	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}
	public String getsContent() {
		return sContent;
	}
	public void setsContent(String sContent) {
		this.sContent = sContent;
	}
	public String getsGroup() {
		return sGroup;
	}
	public void setsGroup(String sGroup) {
		this.sGroup = sGroup;
	}
	public Date getsCreate() {
		return sCreate;
	}
	public void setsCreate(Date sCreate) {
		this.sCreate = sCreate;
	}
	public Date getsUpdate() {
		return sUpdate;
	}
	public void setsUpdate(Date sUpdate) {
		this.sUpdate = sUpdate;
	}
	public Date getsStart() {
		return sStart;
	}
	public void setsStart(Date sStart) {
		this.sStart = sStart;
	}
	public Date getsEnd() {
		return sEnd;
	}
	public void setsEnd(Date sEnd) {
		this.sEnd = sEnd;
	}
	public int getsTargetAmount() {
		return sTargetAmount;
	}
	public void setsTargetAmount(int sTargetAmount) {
		this.sTargetAmount = sTargetAmount;
	}
	public int getsFundAmount() {
		return sFundAmount;
	}
	public void setsFundAmount(int sFundAmount) {
		this.sFundAmount = sFundAmount;
	}
	public int getsCount() {
		return sCount;
	}
	public void setsCount(int sCount) {
		this.sCount = sCount;
	}
	public String getsStatus() {
		return sStatus;
	}
	public void setsStatus(String sStatus) {
		this.sStatus = sStatus;
	}
	public String getsImageUrl() {
		return sImageUrl;
	}
	public void setsImageUrl(String sImageUrl) {
		this.sImageUrl = sImageUrl;
	}
	@Override
	public String toString() {
		return "후원 [후원글 번호=" + sNo + ", 카테고리=" + sCategory + ", 후원 제목=" + sTitle + ", 후원 내용=" + sContent
				+ ", 모금 단체=" + sGroup + ", 작성일=" + sCreate + ", 수정일=" + sUpdate + ", 후원 시작일=" + sStart
				+ ", 후원 종료일=" + sEnd + ", 목표 금액=" + sTargetAmount + ", 모금 금액=" + sFundAmount + ", 후원 인원="
				+ sCount + ", 후원 상태=" + sStatus + ", 썸네일이미지=" + sImageUrl + "]";
	}
	
	
	
	
}
