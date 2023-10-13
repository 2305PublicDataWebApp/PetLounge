package com.lounge.pet.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lounge.pet.notice.domain.Notice;
import com.lounge.pet.notice.domain.PageInfo2;
import com.lounge.pet.notice.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	
	/**
	 * 공지 리스트 조회
	 */
	@RequestMapping(value="/notice_list.pet", method=RequestMethod.GET)
	public ModelAndView showNoticeList(ModelAndView mv
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
		try {
			int totalCount = nService.getListCount();
			PageInfo2 pInfo = this.getPageInfo(currentPage, totalCount);
			List<Notice> nList = nService.selectNoticeList(pInfo); // 페이지 정보를 'pInfo' 매개변수로 전달
			if(nList.size() > 0) {
				mv.addObject("nList", nList);	// 검색된 공지사항 게시물 목록을 뷰로 전달하기 위한 데이터
				mv.addObject("pInfo", pInfo);	// 페이지 정보를 뷰로 전달하기 위한 데이터
				mv.setViewName("notice/notice_list");
			}else {
				mv.addObject("msg", "리스트 조회 실패");
				mv.addObject("url", "/home.pet");
				mv.setViewName("common/errorPage");				
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.addObject("url", "/home.pet");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	/**
	 * 주어진 현재 페이지 번호와 총 항목 수를 기반으로 페이지 정보를 나타냄
	 * @param currentPage	(현재 페이지 번호)
	 * @param totalCount	(전체 항목 수)
	 * @return				페이지 정보 (PageInfo 객체)
	 */
	public PageInfo2 getPageInfo(Integer currentPage, int totalCount) {
		// PageInfo 객체 초기화
		PageInfo2 pi = null;
		
		// 페이지당 항목 수와 페이지 네비게이션 수 초기화
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int naviTotalCount;  // 페이지 네비에 표시될 총 페이지 수
		int startNavi;
		int endNavi;
		
		// double : 자동형변환, int : 강제형변환
		naviTotalCount = (int)((double)totalCount/recordCountPerPage+0.9);
		
		// currentPage 값이 1~5일때 startNavi가 1로 고정되도록 구하는 식
		startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*naviCountPerPage + 1;
		endNavi = startNavi + naviCountPerPage - 1;
		// endNavi는 startNavi에 무조건 naviCountPerPage값을 더하므로 실제 최대값보다 커질 수 있음
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;  // 최대값을 제한
		}
		pi = new PageInfo2(currentPage, recordCountPerPage, naviCountPerPage, startNavi, endNavi, totalCount, naviTotalCount);
		return pi;
	}

	
	@GetMapping("/notice_detail.pet")
	public String noticeDetail() {
		return "notice/notice_detail";
	}
}
