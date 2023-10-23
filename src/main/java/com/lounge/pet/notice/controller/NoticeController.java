package com.lounge.pet.notice.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lounge.pet.notice.domain.Notice;
import com.lounge.pet.notice.domain.PageInfo;
import com.lounge.pet.notice.service.NoticeService;
import com.lounge.pet.user.domain.User;
import com.lounge.pet.user.service.UserService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	@Autowired
	private UserService uService;
	
	/**
	 * 공지글 등록 페이지
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/noticeSubmit.pet", method=RequestMethod.GET)
	public ModelAndView showSubmitForm(ModelAndView mv) {
		mv.setViewName("notice/noticeSubmit");
		return mv;
	}
	
	/**
	 * 공지글 등록
	 * @param mv
	 * @param notice
	 * @param uploadFile
	 * @return
	 */
	@RequestMapping(value = "/noticeSubmit.pet", method = RequestMethod.POST)
	public ModelAndView nSubmitForm(ModelAndView mv
			, @ModelAttribute Notice notice
			, @RequestParam(value="uploadFile", required = false) MultipartFile uploadFile
			, HttpSession session) {
//		System.out.println(notice.toString());
	    String sanitizedContent = notice.getnContent().replaceAll("<p>", "").replaceAll("</p>", "");
	    notice.setnContent(sanitizedContent);
		try {
//			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
//				String sImageUrl = "image";
//				notice.setsImageUrl(sImageUrl);
//				System.out.println(notice.toString());
//			}
	        String uId = (String) session.getAttribute("uId"); 
	        if (uId == null) {
				mv.addObject("msg", "글작성을 위해 로그인을 먼저 해주세요.");
				mv.addObject("url", "/notice/noticeList.pet");
				mv.setViewName("common/message");	        	
	        }
	        // 아이디 설정
	        notice.setuId(uId);
	        
			int result = nService.submitNoticeForm(notice);
			if(result > 0) {
				mv.addObject("msg", "공지가 등록되었습니다.");
				mv.addObject("url", "/notice/noticeList.pet");
				mv.setViewName("common/message");
			} else {
				mv.addObject("msg", "게시글 등록이 완료되지 않았습니다.");
				mv.addObject("url", "/notice/noticeSubmit.pet");
				mv.setViewName("common/message");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/notice/noticeSubmit.pet");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	
	/**
	 * 공지 리스트 조회
	 */
	@RequestMapping(value="/noticeList.pet", method=RequestMethod.GET)
	public ModelAndView showNoticeList(ModelAndView mv
			, @RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		try {
			int totalCount = nService.getListCount2();
			mv.addObject("totalCount", totalCount);
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<Notice> nList = nService.selectNoticeList(pInfo); // 페이지 정보를 'pInfo' 매개변수로 전달
			mv.addObject("nList", nList).addObject("pInfo", pInfo).setViewName("notice/noticeList");
			if(nList.size() > 0) {
				mv.addObject("nList", nList);	// 검색된 공지사항 게시물 목록을 뷰로 전달하기 위한 데이터
				mv.addObject("pInfo", pInfo);	// 페이지 정보를 뷰로 전달하기 위한 데이터
				mv.setViewName("notice/noticeList");
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
	public PageInfo getPageInfo(Integer currentPage, int totalCount) {
		// PageInfo 객체 초기화
		PageInfo pi = null;
		
		// 페이지당 항목 수와 페이지 네비게이션 수 초기화
		int recordCountPerPage = 5;
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
		pi = new PageInfo(currentPage, recordCountPerPage, naviCountPerPage, startNavi, endNavi, totalCount, naviTotalCount);
		return pi;
	}

	
	/**
	 * 공지글 상세 페이지로 이동
	 * @param mv
	 * @param nNo
	 * @return
	 */
	@RequestMapping(value="/noticeDetail.pet", method=RequestMethod.GET)
	public ModelAndView showNoticeDetail(ModelAndView mv
			, @ModelAttribute Notice notice
			, @RequestParam int nNo
			, HttpSession session) {
		try {			
			Notice nOne = nService.selectOneNoticeNo(nNo);
			int result = nService.updateViewCount(nOne);
//	        String uId = (String) session.getAttribute("uId"); 
	        String uId = "admin"; 
	        // 아이디 설정
	        notice.setuId(uId);
	        
			if(result > 0) {				
				mv.addObject("notice", nOne);
				
				String profileImgUrl = null;	// 프로필 이미지 URL 초기화
				if (uId != null) {
					User user = uService.selectOneById(uId);
					 if (user != null) {
		                    String writerNickname = user.getuNickName();
		                    profileImgUrl = user.getuFilePath();
		                    mv.addObject("uNickname", writerNickname); // 작성자의 닉네임을 추가
		                } else {
		                    // 사용자를 찾을 수 없을 때 처리
		                    mv.addObject("uNickname", "UnKnown User");
		                }
		            } else {
		                // U_ID가 없을 때 처리
		                mv.addObject("uNickname", "비회원");
		            }	
				mv.addObject("profileImgUrl", profileImgUrl);
				mv.setViewName("notice/noticeDetail");
			}else {
				mv.addObject("msg", "공지 상세페이지 이동 실패");
				mv.addObject("url","/noticeList.pet");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.addObject("url","/noticeList.pet");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}		
	
	
	/**
	 * 공지 검색
	 * @param searchCondition
	 * @param searchKeyword
	 * @param currentPage
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/noticeSearch.pet", method = RequestMethod.GET)
	public ModelAndView nSearchList(@RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchKeyword") String searchKeyword
			, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage
			, ModelAndView mv) {
		try {
			// 동적 쿼리
			// 2개의 값을 하나의 변수로 다루는 방법
			// HashMap 사용하기
			Map<String, String> nParamMap = new HashMap<String, String>();
			// put()메소드를 사용해서 key-value 설정을 하는데 key값(파란색 글씨)이 mapper.xml에서 사용 됨
			nParamMap.put("searchCondition", searchCondition);
			nParamMap.put("searchKeyword", searchKeyword);
			int totalCount = nService.getListCount(nParamMap);
			
			// 수정: 검색 결과에 따른 총 페이지 수 계산
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<Notice> nList = new ArrayList<Notice>();
			nList = nService.searchByKeyword(pInfo, nParamMap);
			if(!nList.isEmpty()) {
				mv.addObject("nList", nList);
				mv.addObject("pInfo", pInfo);
				mv.addObject("searchCondition", searchCondition);
				mv.addObject("searchKeyword", searchKeyword);
				mv.setViewName("notice/noticeSearch");
			}
			else {
				// 에러가 발생하지 않고 검색 결과가 비어 있는 경우에도 동일한 뷰 페이지를 표시
//				mv.addObject("nList", new ArrayList<Notice>()); // 빈 결과 목록을 추가
//				mv.addObject("pInfo", new PageInfo()); // 빈 페이지 정보를 추가
				mv.addObject("searchCondition", searchCondition);
				mv.addObject("searchKeyword", searchKeyword);
				mv.setViewName("notice/noticeSearch");
			}			
		} catch (Exception e) {
	        // 예외 처리: 에러가 발생했을 때 처리
			mv.setViewName("notice/noticeSearch");
	    }
		return mv;
	}
	
	/**
	 * 공지 수정 표시
	 * @param mv
	 * @param nNo
	 * @return
	 */
	@RequestMapping(value="/noticeUpdate.pet", method = RequestMethod.GET)
	public ModelAndView updateNoticePage(ModelAndView mv
//			, @RequestParam("nNo") int nNo) {
			, @RequestParam int nNo) {
		try {
			Notice nOne = nService.selectOneNoticeNo(nNo);
			mv.addObject("notice", nOne);
			mv.setViewName("notice/noticeUpdate");			
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/notice/noticeList.pet");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 공지글 수정 
	 * @param mv
	 * @param notice
	 * @param uploadFile
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/noticeUpdate.pet", method = RequestMethod.POST)
	public ModelAndView updateNotice(ModelAndView mv
			,@ModelAttribute Notice notice
			, @RequestParam(value="uploadFile", required = false) MultipartFile uploadFile
			, HttpSession session
			, HttpServletRequest request) {
		try {
			int result = nService.updateNotice(notice);
			if(result > 0) {
				mv.addObject("msg", "공지글이 수정되었습니다.");
				mv.setViewName("redirect:/notice/noticeDetail.pet?nNo="+notice.getnNo());
			} else {
				mv.addObject("msg", "공지글 수정이 완료되지 않았습니다.");
				mv.addObject("url", "/notice/noticeUpdate.pet?nNo="+notice.getnNo());
				mv.setViewName("common/errorPage");
			} 
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/notice/noticeUpdate.pet?nNo="+notice.getnNo());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	/**
	 * 공지글 삭제
	 * @param mv
	 * @param nNo
	 * @return
	 */
	@RequestMapping(value="/delete.pet", method = RequestMethod.GET)
	public ModelAndView noticeDelete(ModelAndView mv
			, @RequestParam("nNo") int nNo) {
		try {
				int result = nService.noticeDelete(nNo);
				if(result > 0) {
					mv.addObject("msg", "공지글이 삭제되었습니다.");
					mv.addObject("url", "/notice/noticeList.pet");
					mv.setViewName("common/message");
				} else {
					mv.addObject("msg", "공지글 삭제가 완료되지 않았습니다.");
					mv.addObject("url", "/notice/noticeList.pet");
					mv.setViewName("common/message");
				}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/notice/noticeDetail.pet?nNo="+nNo);
			mv.setViewName("common/errorPage");
		}
		return mv;
	}	
	
	
	
}
