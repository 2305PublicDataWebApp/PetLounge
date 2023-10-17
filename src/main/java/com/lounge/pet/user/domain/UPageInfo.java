package com.lounge.pet.user.domain;

public class UPageInfo {
	private int currentPage;
	private int totalCount;
	private int naviTotalCount;   // 5.2 - 6 처리 필요
	private int recordCountPerPage;  //고정값
	private int naviCountPerPage;  //고정값
	private int startNavi;
	private int endNavi;
	
	public UPageInfo() {
		// TODO Auto-generated constructor stub
	}

	public UPageInfo(int currentPage, int totalCount, int naviTotalCount, int recordCountPerPage, int naviCountPerPage,
			int startNavi, int endNavi) {
		super();
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.naviTotalCount = naviTotalCount;
		this.recordCountPerPage = recordCountPerPage;
		this.naviCountPerPage = naviCountPerPage;
		this.startNavi = startNavi;
		this.endNavi = endNavi;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getNaviTotalCount() {
		return naviTotalCount;
	}

	public void setNaviTotalCount(int naviTotalCount) {
		this.naviTotalCount = naviTotalCount;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getNaviCountPerPage() {
		return naviCountPerPage;
	}

	public void setNaviCountPerPage(int naviCountPerPage) {
		this.naviCountPerPage = naviCountPerPage;
	}

	public int getStartNavi() {
		return startNavi;
	}

	public void setStartNavi(int startNavi) {
		this.startNavi = startNavi;
	}

	public int getEndNavi() {
		return endNavi;
	}

	public void setEndNavi(int endNavi) {
		this.endNavi = endNavi;
	}

	@Override
	public String toString() {
		return "APageInfo [currentPage=" + currentPage + ", totalCount=" + totalCount + ", naviTotalCount="
				+ naviTotalCount + ", recordCountPerPage=" + recordCountPerPage + ", naviCountPerPage="
				+ naviCountPerPage + ", startNavi=" + startNavi + ", endNavi=" + endNavi + "]";
	}
	
}
