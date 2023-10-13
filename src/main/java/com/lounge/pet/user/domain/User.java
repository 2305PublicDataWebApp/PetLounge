package com.lounge.pet.user.domain;

import java.sql.Date;

public class User {
	private String uId;
	private String uPw; 
	private String uPwRe;
	private String uName;
	private String uNickName;
	private String uEmail;
	private String uPhone;
	private String uAddr;
	private String uAddrNo;
	private String uFileName;
	private String uFileReName;
	private String uFilePath;
	private long uFileLength;
	private Date uRegDate;
	private String uStatus;
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPw() {
		return uPw;
	}
	public void setuPw(String uPw) {
		this.uPw = uPw;
	}
	public String getuPwRe() {
		return uPwRe;
	}
	public void setuPwRe(String uPwRe) {
		this.uPwRe = uPwRe;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuNickName() {
		return uNickName;
	}
	public void setuNickName(String uNickName) {
		this.uNickName = uNickName;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}
	public String getuAddr() {
		return uAddr;
	}
	public void setuAddr(String uAddr) {
		this.uAddr = uAddr;
	}
	public String getuAddrNo() {
		return uAddrNo;
	}
	public void setuAddrNo(String uAddrNo) {
		this.uAddrNo = uAddrNo;
	}
	public String getuFileName() {
		return uFileName;
	}
	public void setuFileName(String uFileName) {
		this.uFileName = uFileName;
	}
	public String getuFileReName() {
		return uFileReName;
	}
	public void setuFileReName(String uFileReName) {
		this.uFileReName = uFileReName;
	}
	public String getuFilePath() {
		return uFilePath;
	}
	public void setuFilePath(String uFilePath) {
		this.uFilePath = uFilePath;
	}
	public long getuFileLength() {
		return uFileLength;
	}
	public void setuFileLength(long uFileLength) {
		this.uFileLength = uFileLength;
	}
	public Date getuRegDate() {
		return uRegDate;
	}
	public void setuRegDate(Date uRegDate) {
		this.uRegDate = uRegDate;
	}
	public String getuStatus() {
		return uStatus;
	}
	public void setuStatus(String uStatus) {
		this.uStatus = uStatus;
	}
	
	@Override
	public String toString() {
		return "User [uId=" + uId + ", uPw=" + uPw + ", uPwRe=" + uPwRe + ", uName=" + uName + ", uNickName="
				+ uNickName + ", uEmail=" + uEmail + ", uPhone=" + uPhone + ", uAddr=" + uAddr + ", uAddrNo=" + uAddrNo
				+ ", uFileName=" + uFileName + ", uFileReName=" + uFileReName + ", uFilePath=" + uFilePath
				+ ", uFileLength=" + uFileLength + ", uRegDate=" + uRegDate + ", uStatus=" + uStatus + "]";
	}
	
	
	
	
}