package com.lounge.pet.user.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class UserSupport {
	
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
	private int sHNo;
	private String uId;
	private String sHName;
	private int sHAmount;
	private Timestamp sHPaydate;
	private String sHPaytype;
	private String sHType;
	private int sRNo;
	private String sRContent;
	private Timestamp sRCreate;
	private Timestamp sRUpdate;
	private String sRStatus;
	private String uNickName;
		
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

	public int getsHNo() {
		return sHNo;
	}

	public void setsHNo(int sHNo) {
		this.sHNo = sHNo;
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

	public Timestamp getsHPaydate() {
		return sHPaydate;
	}

	public void setsHPaydate(Timestamp sHPaydate) {
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

	public int getsRNo() {
		return sRNo;
	}

	public void setsRNo(int sRNo) {
		this.sRNo = sRNo;
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

	public String getuNickName() {
		return uNickName;
	}

	public void setuNickName(String uNickName) {
		this.uNickName = uNickName;
	}

	@Override
	public String toString() {
		return "UserSupport [sNo=" + sNo + ", sCategory=" + sCategory + ", sTitle=" + sTitle + ", sContent=" + sContent
				+ ", sGroup=" + sGroup + ", sCreate=" + sCreate + ", sUpdate=" + sUpdate + ", sStart=" + sStart
				+ ", sEnd=" + sEnd + ", sTargetAmount=" + sTargetAmount + ", sFundAmount=" + sFundAmount + ", sCount="
				+ sCount + ", sStatus=" + sStatus + ", sImageUrl=" + sImageUrl + ", sHNo=" + sHNo + ", uId=" + uId
				+ ", sHName=" + sHName + ", sHAmount=" + sHAmount + ", sHPaydate=" + sHPaydate + ", sHPaytype="
				+ sHPaytype + ", sHType=" + sHType + ", sRNo=" + sRNo + ", sRContent=" + sRContent + ", sRCreate="
				+ sRCreate + ", sRUpdate=" + sRUpdate + ", sRStatus=" + sRStatus + "]";
	}

	
	

}
