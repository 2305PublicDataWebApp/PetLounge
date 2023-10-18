package com.lounge.pet.user.domain;

import java.sql.Timestamp;

public class UserHosRe {

	private int hNo;
	private String hName;
	private String hOpen; 
	private String hStatus;
	private String hPhone;
	private String hAddr;
	private String hRoadAddr;
	private double hX;
	private double hY;
	private double hLat;
	private double hLng;
	private String uId;
	private int hRNo;
	private String hRContent;
	private Timestamp hRCreate;
	private Timestamp hRUpdate;
	private String hRStatus;
	public int gethNo() {
		return hNo;
	}
	public void sethNo(int hNo) {
		this.hNo = hNo;
	}
	public String gethName() {
		return hName;
	}
	public void sethName(String hName) {
		this.hName = hName;
	}
	public String gethOpen() {
		return hOpen;
	}
	public void sethOpen(String hOpen) {
		this.hOpen = hOpen;
	}
	public String gethStatus() {
		return hStatus;
	}
	public void sethStatus(String hStatus) {
		this.hStatus = hStatus;
	}
	public String gethPhone() {
		return hPhone;
	}
	public void sethPhone(String hPhone) {
		this.hPhone = hPhone;
	}
	public String gethAddr() {
		return hAddr;
	}
	public void sethAddr(String hAddr) {
		this.hAddr = hAddr;
	}
	public String gethRoadAddr() {
		return hRoadAddr;
	}
	public void sethRoadAddr(String hRoadAddr) {
		this.hRoadAddr = hRoadAddr;
	}
	public double gethX() {
		return hX;
	}
	public void sethX(double hX) {
		this.hX = hX;
	}
	public double gethY() {
		return hY;
	}
	public void sethY(double hY) {
		this.hY = hY;
	}
	public double gethLat() {
		return hLat;
	}
	public void sethLat(double hLat) {
		this.hLat = hLat;
	}
	public double gethLng() {
		return hLng;
	}
	public void sethLng(double hLng) {
		this.hLng = hLng;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public int gethRNo() {
		return hRNo;
	}
	public void sethRNo(int hRNo) {
		this.hRNo = hRNo;
	}
	public String gethRContent() {
		return hRContent;
	}
	public void sethRContent(String hRContent) {
		this.hRContent = hRContent;
	}
	public Timestamp gethRCreate() {
		return hRCreate;
	}
	public void sethRCreate(Timestamp hRCreate) {
		this.hRCreate = hRCreate;
	}
	public Timestamp gethRUpdate() {
		return hRUpdate;
	}
	public void sethRUpdate(Timestamp hRUpdate) {
		this.hRUpdate = hRUpdate;
	}
	public String gethRStatus() {
		return hRStatus;
	}
	public void sethRStatus(String hRStatus) {
		this.hRStatus = hRStatus;
	}
	@Override
	public String toString() {
		return "UserHosRe [hNo=" + hNo + ", hName=" + hName + ", hOpen=" + hOpen + ", hStatus=" + hStatus + ", hPhone="
				+ hPhone + ", hAddr=" + hAddr + ", hRoadAddr=" + hRoadAddr + ", hX=" + hX + ", hY=" + hY + ", hLat="
				+ hLat + ", hLng=" + hLng + ", uId=" + uId + ", hRNo=" + hRNo + ", hRContent=" + hRContent
				+ ", hRCreate=" + hRCreate + ", hRUpdate=" + hRUpdate + ", hRStatus=" + hRStatus + "]";
	}
	
	
	
}
