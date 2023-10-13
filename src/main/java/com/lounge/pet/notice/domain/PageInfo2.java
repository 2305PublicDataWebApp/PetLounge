package com.lounge.pet.notice.domain;

// 페이징 처리 관련 vo
public class PageInfo2 {

	private int currentPage;	// 현재 페이지 번호
	private int recordCountPerPage;		// 각(한) 페이지에 표시할 항목 수
	private int naviCountPerPage;	//페이지 네비게이션에 표시될 페이지 번호의 수
	private int startNavi;	//현재 페이지 범위에서 시작페이지 번호
	private int endNavi;	// 현재 페이지 범위에서 끝 페이지 번호
	private int totalCount;		// 전체 항목 수
	private int naviTotalCount;		// 전체 페이지 네비게이션의 수
	
	public PageInfo2() {
		// TODO Auto-generated constructor stub
	}
	
	public PageInfo2(int currentPage, int recordCountPerPage, int naviCountPerPage, int startNavi, int endNavi,
			int totalCount, int naviTotalCount) {
		super();
		this.currentPage = currentPage;
		this.recordCountPerPage = recordCountPerPage;
		this.naviCountPerPage = naviCountPerPage;
		this.startNavi = startNavi;
		this.endNavi = endNavi;
		this.totalCount = totalCount;
		this.naviTotalCount = naviTotalCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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
	
	@Override
	public String toString() {
		return "페이징 [현재페이지=" + currentPage + ", 한 페이지당 게시되는 갯수=" + recordCountPerPage
				+ ", 한 페이지당 페이지 네비 갯수=" + naviCountPerPage + ", 네비 시작 번호=" + startNavi + ", 네비끝번호=" + endNavi
				+ ", 전체 갯수=" + totalCount + ", 네비 전체 갯수=" + naviTotalCount + "]";
	}
	
	
}
