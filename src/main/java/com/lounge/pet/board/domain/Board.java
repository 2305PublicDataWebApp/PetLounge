package com.lounge.pet.board.domain;

import java.sql.Date;

public class Board {

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
	
	@Override
	public String toString() {
		return "자유게시판 [글번호=" + fNo + ", 아이디=" + uId + ", 제목=" + fTitle + ", 내용=" + fContent + ", 작성일="
				+ fCreate + ", 수정일=" + fUpdate + ", 파일이름=" + fFileName + ", 파일리네임=" + fFileRename
				+ ", 파일경로=" + fFilePath + ", 파일크기=" + fFileLength + ", 사용여부=" + fStatus + ", 조회수="
				+ fViewCount + ", 작성자=" + fWriter + "]";
	}
	
	
	
}
