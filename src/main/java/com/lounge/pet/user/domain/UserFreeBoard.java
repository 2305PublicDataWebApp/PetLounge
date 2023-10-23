package com.lounge.pet.user.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class UserFreeBoard {

	private int fNo;
	private String uId;
	private String fTitle;
	private String fContent;
	private Date fCreate;
	private Date fUpdate;
	private String fFileName;
	private String fFileRename;
	private String fFilePath;
	private int fFileLength;
	private String fStatus;
	private String fViewCount;
	private String fWriter;
	private String fProfileImg;
	private int fRNo;
	private String fRContent;
	private Timestamp fRCreate;
	private Timestamp fRUpdate;
	private String fRStatus;
	private int fRMno;
	private int FRRstatus;
	private String fRNickName;
	private String fRProfileImg;
	
	
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
	public String getfTitle() {
		return fTitle;
	}
	public void setfTitle(String fTitle) {
		this.fTitle = fTitle;
	}
	public String getfContent() {
		return fContent;
	}
	public void setfContent(String fContent) {
		this.fContent = fContent;
	}
	public Date getfCreate() {
		return fCreate;
	}
	public void setfCreate(Date fCreate) {
		this.fCreate = fCreate;
	}
	public Date getfUpdate() {
		return fUpdate;
	}
	public void setfUpdate(Date fUpdate) {
		this.fUpdate = fUpdate;
	}
	public String getfFileName() {
		return fFileName;
	}
	public void setfFileName(String fFileName) {
		this.fFileName = fFileName;
	}
	public String getfFileRename() {
		return fFileRename;
	}
	public void setfFileRename(String fFileRename) {
		this.fFileRename = fFileRename;
	}
	public String getfFilePath() {
		return fFilePath;
	}
	public void setfFilePath(String fFilePath) {
		this.fFilePath = fFilePath;
	}
	public int getfFileLength() {
		return fFileLength;
	}
	public void setfFileLength(int fFileLength) {
		this.fFileLength = fFileLength;
	}
	public String getfStatus() {
		return fStatus;
	}
	public void setfStatus(String fStatus) {
		this.fStatus = fStatus;
	}
	public String getfViewCount() {
		return fViewCount;
	}
	public void setfViewCount(String fViewCount) {
		this.fViewCount = fViewCount;
	}
	public String getfWriter() {
		return fWriter;
	}
	public void setfWriter(String fWriter) {
		this.fWriter = fWriter;
	}
	public String getfProfileImg() {
		return fProfileImg;
	}
	public void setfProfileImg(String fProfileImg) {
		this.fProfileImg = fProfileImg;
	}
	public int getfRNo() {
		return fRNo;
	}
	public void setfRNo(int fRNo) {
		this.fRNo = fRNo;
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
		return "UserFreeBoard [fNo=" + fNo + ", uId=" + uId + ", fTitle=" + fTitle + ", fContent=" + fContent
				+ ", fCreate=" + fCreate + ", fUpdate=" + fUpdate + ", fFileName=" + fFileName + ", fFileRename="
				+ fFileRename + ", fFilePath=" + fFilePath + ", fFileLength=" + fFileLength + ", fStatus=" + fStatus
				+ ", fViewCount=" + fViewCount + ", fWriter=" + fWriter + ", fProfileImg=" + fProfileImg + ", fRNo="
				+ fRNo + ", fRContent=" + fRContent + ", fRCreate=" + fRCreate + ", fRUpdate=" + fRUpdate
				+ ", fRStatus=" + fRStatus + ", fRMno=" + fRMno + ", FRRstatus=" + FRRstatus + ", fRNickName="
				+ fRNickName + ", fRProfileImg=" + fRProfileImg + "]";
	}

	
	
	
	
}
