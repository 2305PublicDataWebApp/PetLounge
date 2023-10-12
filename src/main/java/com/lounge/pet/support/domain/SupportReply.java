package com.lounge.pet.support.domain;

import java.sql.Timestamp;

public class SupportReply {

	private int sRNo;
	private int sNo;
	private String uId;
	private String sRContent;
	private Timestamp sRCreate;
	private Timestamp sRUpdate;
	private String sRStatus;
	private String sRWriter;
	


	
	public int getsRNo() {
		return sRNo;
	}




	public void setsRNo(int sRNo) {
		this.sRNo = sRNo;
	}




	public int getsNo() {
		return sNo;
	}




	public void setsNo(int sNo) {
		this.sNo = sNo;
	}




	public String getuId() {
		return uId;
	}




	public void setuId(String uId) {
		this.uId = uId;
	}




	public String getsRContent() {
		return sRContent;
	}




	public void setsRContent(String sRContent) {
		this.sRContent = sRContent;
	}




	public Timestamp getsRCreate() {
		return sRCreate;
	}




	public void setsRCreate(Timestamp sRCreate) {
		this.sRCreate = sRCreate;
	}




	public Timestamp getsRUpdate() {
		return sRUpdate;
	}




	public void setsRUpdate(Timestamp sRUpdate) {
		this.sRUpdate = sRUpdate;
	}




	public String getsRStatus() {
		return sRStatus;
	}




	public void setsRStatus(String sRStatus) {
		this.sRStatus = sRStatus;
	}




	public String getsRWriter() {
		return sRWriter;
	}




	public void setsRWriter(String sRWriter) {
		this.sRWriter = sRWriter;
	}




	@Override
	public String toString() {
		return "후원게시판 댓글 [댓글번호=" + sRNo + ", 후원글 번호=" + sNo + ", 회원 아이디=" + uId + ", 댓글 내용=" + sRContent
				+ ", 작성일=" + sRCreate + ", 수정일=" + sRUpdate + ", 사용 여부=" + sRStatus + "]";
	}
	
	
}
