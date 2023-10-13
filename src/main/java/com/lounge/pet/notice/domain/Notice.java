package com.lounge.pet.notice.domain;

import java.sql.Date;

public class Notice {
	
	private int nNo;
	private String nTitle;
	private String nContent;
	private Date nCreate;
	private Date nUpdate;
	private String nFileName;
	private String nFileRename;
	private String nFilePath;
	private int nFileLength;
	private String nStatus;
	private String nViewCount;
	
	public int getnNo() {
		return nNo;
	}
	public void setnNo(int nNo) {
		this.nNo = nNo;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public Date getnCreate() {
		return nCreate;
	}
	public void setnCreate(Date nCreate) {
		this.nCreate = nCreate;
	}
	public Date getnUpdate() {
		return nUpdate;
	}
	public void setnUpdate(Date nUpdate) {
		this.nUpdate = nUpdate;
	}
	public String getnFileName() {
		return nFileName;
	}
	public void setnFileName(String nFileName) {
		this.nFileName = nFileName;
	}
	public String getnFileRename() {
		return nFileRename;
	}
	public void setnFileRename(String nFileRename) {
		this.nFileRename = nFileRename;
	}
	public String getnFilePath() {
		return nFilePath;
	}
	public void setnFilePath(String nFilePath) {
		this.nFilePath = nFilePath;
	}
	public int getnFileLength() {
		return nFileLength;
	}
	public void setnFileLength(int nFileLength) {
		this.nFileLength = nFileLength;
	}
	public String getnStatus() {
		return nStatus;
	}
	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}
	public String getnViewCount() {
		return nViewCount;
	}
	public void setnViewCount(String nViewCount) {
		this.nViewCount = nViewCount;
	}
	@Override
	public String toString() {
		return "공지 [공지번호=" + nNo + ", 제목=" + nTitle + ", 내용=" + nContent + ", 작성일=" + nCreate
				+ ", 수정일=" + nUpdate + ", 파일이름=" + nFileName + ", 파일리네임=" + nFileRename + ", 파일경로="
				+ nFilePath + ", 파일크기=" + nFileLength + ", 사용여부=" + nStatus + ", 조회수=" + nViewCount
				+ "]";
	}
	
	
}
