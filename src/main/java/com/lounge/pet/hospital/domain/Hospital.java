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
	private String hSearchKeyword;
	
	public Hospital() {	}
	
	public Hospital(double hLat, double hLng) {
		super();
		this.hLat = hLat;
		this.hLng = hLng;
	}

	public Hospital(int hNo, double hLat, double hLng) {
		super();
		this.hNo = hNo;
		this.hLat = hLat;
		this.hLng = hLng;
	}
	
	public Hospital(double hLat, double hLng, String hSearchKeyword) {
		super();
		this.hLat = hLat;
		this.hLng = hLng;
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
	public String gethSearchKeyword() {
		return hSearchKeyword;
	}
	public void sethSearchKeyword(String hSearchKeyword) {
		this.hSearchKeyword = hSearchKeyword;
	}

	@Override
	public String toString() {
		return "동물병원 [번호=" + hNo + ", 이름=" + hName + ", 개방서비스명=" + hOpen + ", 상세영업상태명=" + hStatus + ", 전화번호="
				+ hPhone + ", 전체주소=" + hAddr + ", 도로명전체주소=" + hRoadAddr + ", x좌표=" + hX + ", y좌표=" + hY + ", 위도=" 
				+ hLat + ", 경도=" + hLng + ", 검색어=" + hSearchKeyword + "]";
	}
}
