package com.lounge.pet.hospital.domain;

public class Hospital {
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
	private double distance;
	private String uId;
	private String hSearchKeyword;
	private String hBookmark;
	
	public Hospital() {	}
	
	public Hospital(int hNo, double hLat, double hLng) {
		super();
		this.hNo = hNo;
		this.hLat = hLat;
		this.hLng = hLng;
	}
	
	public Hospital(double hLat, double hLng, String uId) {
		super();
		this.hLat = hLat;
		this.hLng = hLng;
		this.uId = uId;
	}

	public Hospital(double hLat, double hLng, String uId, String hSearchKeyword) {
		super();
		this.hLat = hLat;
		this.hLng = hLng;
		this.uId = uId;
		this.hSearchKeyword = hSearchKeyword;
	}

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
	public double getDistance() {
		return distance;
	}
	public void setDistance(double distance) {
		this.distance = distance;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String gethSearchKeyword() {
		return hSearchKeyword;
	}
	public void sethSearchKeyword(String hSearchKeyword) {
		this.hSearchKeyword = hSearchKeyword;
	}
	public String gethBookmark() {
		return hBookmark;
	}
	public void sethBookmark(String hBookmark) {
		this.hBookmark = hBookmark;
	}
	@Override
	public String toString() {
		return "Hospital [hNo=" + hNo + ", hName=" + hName + ", hOpen=" + hOpen + ", hStatus=" + hStatus + ", hPhone="
				+ hPhone + ", hAddr=" + hAddr + ", hRoadAddr=" + hRoadAddr + ", hX=" + hX + ", hY=" + hY + ", hLat="
				+ hLat + ", hLng=" + hLng + ", distance=" + distance + ", uId=" + uId + ", hSearchKeyword="
				+ hSearchKeyword + ", hBookmark=" + hBookmark + "]";
	}

}
