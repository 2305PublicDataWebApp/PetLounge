package com.lounge.pet.board.domain;

import java.sql.Timestamp;

public class FReply {
	
	private int fRNo;
	private int fNo;
	private String uId;
	private String fRContent;
	private Timestamp fRCreate;
	private Timestamp fRUpdate;
	private String fRStatus;
	private int fRMno;
	private int FRRstatus;
	private String fRNickName;
	private String fRProfileImg;
	
	
	public FReply() {
	}
	
	public int getfRNo() {
		return fRNo;
	}
	public void setfRNo(int fRNo) {
		this.fRNo = fRNo;
	}
	public int getfNo() {
		return fNo;
	}
	public void setfNo(int fNo) {
		this.fNo = fNo;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getfRContent() {
		return fRContent;
	}
	public void setfRContent(String fRContent) {
		this.fRContent = fRContent;
	}
	public Timestamp getfRCreate() {
		return fRCreate;
	}
	public void setfRCreate(Timestamp fRCreate) {
		this.fRCreate = fRCreate;
	}
	public Timestamp getfRUpdate() {
		return fRUpdate;
	}
	public void setfRUpdate(Timestamp fRUpdate) {
		this.fRUpdate = fRUpdate;
	}
	public String getfRStatus() {
		return fRStatus;
	}
	public void setfRStatus(String fRStatus) {
		this.fRStatus = fRStatus;
	}
	public int getfRMno() {
		return fRMno;
	}
	public void setfRMno(int fRMno) {
		this.fRMno = fRMno;
	}
	public int getFRRstatus() {
		return FRRstatus;
	}
	public void setFRRstatus(int fRRstatus) {
		FRRstatus = fRRstatus;
	}
	public String getfRNickName() {
		return fRNickName;
	}
	public void setfRNickName(String fRNickName) {
		this.fRNickName = fRNickName;
	}
	public String getfRProfileImg() {
		return fRProfileImg;
	}
	public void setfRProfileImg(String fRProfileImg) {
		this.fRProfileImg = fRProfileImg;
	}
	@Override
	public String toString() {
		return "자유게시판댓글 [댓글번호=" + fRNo + ", 글번호=" + fNo + ", 회원아이디=" + uId + ", 댓글내용=" + fRContent + ", 작성일="
				+ fRCreate + ", 수정일=" + fRUpdate + ", 사용여부=" + fRStatus + ", 상위댓글번호=" + fRMno + ", 대댓글여부="
				+ FRRstatus + ", fRNickName=" + fRNickName + ", fRProfileImg=" + fRProfileImg + "]";
	}

	
	
}