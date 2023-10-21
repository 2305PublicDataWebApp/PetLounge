package com.lounge.pet.support.domain;

public class SPageInfo {
	private int currentPage;
	private int totalCount;
	private int naviTotalCount;
	private int recordCountPerPage;
	private int naviCountPerPage;
	private int startNavi;
	private int endNavi;
	
	public SPageInfo() {}
	
	public SPageInfo(int currentPage, int totalCount, int naviTotalCount, int recordCountPerPage, int naviCountPerPage,
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
		return "PageInfo [현재 페이지=" + currentPage + ", 총 게시글 갯수=" + totalCount + ", 네비 총 갯수="
				+ naviTotalCount + ", 한 페이지당 게시글 갯수=" + recordCountPerPage + ", 한 페이지당 네비 갯수="
				+ naviCountPerPage + ", 시작 네비=" + startNavi + ", 끝 네비=" + endNavi + "]";
	}
	
	
}

