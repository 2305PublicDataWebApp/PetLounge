package com.lounge.pet.support.domain;

import java.sql.Date;

public class SupportHistory {

	private int sHNo;
	private int sNo;
	private String uId;
	private String sHName;
	private int sHAmount;
	private Date sHPaydate;
	private String sHPaytype;
	private String sHType;
	
	public int getsHNo() {
		return sHNo;
	}
	public void setsHNo(int sHNo) {
		this.sHNo = sHNo;
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
	public String getsHName() {
		return sHName;
	}
	public void setsHName(String sHName) {
		this.sHName = sHName;
	}
	public int getsHAmount() {
		return sHAmount;
	}
	public void setsHAmount(int sHAmount) {
		this.sHAmount = sHAmount;
	}
	public Date getsHPaydate() {
		return sHPaydate;
	}
	public void setsHPaydate(Date sHPaydate) {
		this.sHPaydate = sHPaydate;
	}
	public String getsHPaytype() {
		return sHPaytype;
	}
	public void setsHPaytype(String sHPaytype) {
		this.sHPaytype = sHPaytype;
	}
	public String getsHType() {
		return sHType;
	}
	public void setsHType(String sHType) {
		this.sHType = sHType;
	}
	
	@Override
	public String toString() {
		return "후원 내역 [후원 내역 번호=" + sHNo + ", 후원글 번호=" + sNo + ", 회원 아이디=" + uId + ", 후원자명=" + sHName + ", 후원 금액="
				+ sHAmount + ", 후원결제일자=" + sHPaydate + ", 결제 방법=" + sHPaytype + ", 후원자 타입=" + sHType + "]";
	}
	
	
}
