package com.lounge.pet.board.domain;

public class FBookmark {

	private String uId;
	private int fNo;
	public String getuId() {
		return uId;
	}
	
	public FBookmark() {
	}
	
	public FBookmark(String uId, int fNo) {
		super();
		this.uId = uId;
		this.fNo = fNo;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}
	public int getfNo() {
		return fNo;
	}
	public void setfNo(int fNo) {
		this.fNo = fNo;
	}
	
	@Override
	public String toString() {
		return "자유게시판 즐겨찾기 [회원아이디=" + uId + ", 글번호=" + fNo + "]";
	}
	
	
}
