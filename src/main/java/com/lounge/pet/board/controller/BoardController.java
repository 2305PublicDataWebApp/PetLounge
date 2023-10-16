package com.lounge.pet.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lounge.pet.board.service.BoardService;
import com.lounge.pet.user.service.UserService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
//	@Autowired
//	private BoardService bService;
//	
//	@Autowired
//	private UserService uService;
	
	@GetMapping("/free_list.pet")
	public String freeList() {
		return "board/free_list";
	}
	
	/**
	 * 자유게시판 리스트 조회
	 */
//	@RequestMapping(value="/free_list.pet", method=RequestMethod.GET)
//	public ModelAndView showFreeBoardList(ModelAndView mv
//			, @RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
//		try {
//			int totalCount = bService.getListCount2();
//			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
//			List<Notice> nList = bService.selectNoticeList(pInfo); // 페이지 정보를 'pInfo' 매개변수로 전달
//			mv.addObject("nList", nList).addObject("pInfo", pInfo).setViewName("board/free_list");
//			if(nList.size() > 0) {
//				mv.addObject("nList", nList);	// 검색된 공지사항 게시물 목록을 뷰로 전달하기 위한 데이터
//				mv.addObject("pInfo", pInfo);	// 페이지 정보를 뷰로 전달하기 위한 데이터
//				mv.setViewName("notice/notice_list");
//			}else {
//				mv.addObject("msg", "리스트 조회 실패");
//				mv.addObject("url", "/home.pet");
//				mv.setViewName("common/errorPage");				
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			mv.addObject("msg", e.getMessage());
//			mv.addObject("url", "/home.pet");
//			mv.setViewName("common/errorPage");
//		}
//		return mv;
//	}
//	
	
	
}
