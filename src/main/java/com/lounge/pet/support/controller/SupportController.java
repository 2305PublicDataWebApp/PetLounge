package com.lounge.pet.support.controller;

import java.sql.Timestamp;
import java.util.Collections;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.lounge.pet.mail.service.MailService;
import com.lounge.pet.support.domain.SPageInfo;
import com.lounge.pet.support.domain.Support;
import com.lounge.pet.support.domain.SupportHistory;
import com.lounge.pet.support.domain.SupportReply;
import com.lounge.pet.support.service.SupportService;
import com.lounge.pet.user.domain.User;
import com.lounge.pet.user.domain.UserSupport;
import com.lounge.pet.user.service.UserService;


@Controller
public class SupportController {
	
	@Autowired
	private SupportService sService;
	
	@Autowired
	private UserService uService;
	
	@Autowired
	private MailService mailService;

	// 후원 등록 페이지
	@RequestMapping(value="/support/insert.pet", method = RequestMethod.GET)
	public ModelAndView supportInsertPage(ModelAndView mv) {
		mv.setViewName("/support/supportInsert");
		return mv;
	}
	
	// 후원 수정 페이지
	@RequestMapping(value="/support/update.pet", method = RequestMethod.GET)
	public ModelAndView supportUpdatePage(ModelAndView mv
			, @RequestParam("sNo") int sNo) {
		try {
			Support support = sService.selectSupportByNo(sNo);
			if(support != null) {
				mv.addObject("support", support);
				mv.setViewName("/support/supportUpdate");
			} else {
				mv.addObject("msg", "데이터 조회가 완료되지 않았습니다.");
				mv.addObject("url", "/support/list.pet");
				mv.setViewName("common/message");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("url", "/support/list.pet");
			mv.setViewName("common/message");
		}
		return mv;
	}

	// 후원글 등록 
	@RequestMapping(value = "/support/insert.pet", method = RequestMethod.POST)
	public ModelAndView insertSupport(ModelAndView mv
			, @ModelAttribute Support support) {
		System.out.println("후원글 등록 : " + support.toString());
		try {
			int result = sService.insertSupport(support);
			if(result > 0) {
				mv.addObject("msg", "게시글이 등록되었습니다.");
				mv.addObject("url", "/support/list.pet");
				mv.setViewName("common/message");
			} else {
				mv.addObject("msg", "게시글 등록이 완료되지 않았습니다.");
				mv.addObject("url", "/support/insert.pet");
				mv.setViewName("common/message");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("url", "/support/insert.pet");
			mv.setViewName("common/message");
		}
		return mv;
	}

	// 후원글 수정 
	@RequestMapping(value="/support/update.pet", method = RequestMethod.POST)
	public ModelAndView updateSupport(ModelAndView mv
			,@ModelAttribute Support support
			, HttpServletRequest request) {
		try {
			int sNo = support.getsNo();
			int historyCount = sService.getHistoryCount(sNo);
			if(historyCount == 0) {
				int result = sService.updateSupport(support);
				if(result > 0) {
					mv.addObject("msg", "게시글이 수정되었습니다.");
					mv.addObject("url", "/support/detail.pet?sNo="+support.getsNo());
					mv.setViewName("common/message");
				} else {
					mv.addObject("msg", "게시글 수정이 완료되지 않았습니다.");
					mv.addObject("url", "/support/update.pet?sNo="+support.getsNo());
					mv.setViewName("common/message");
				} 
			} else {
				mv.addObject("msg", "후원내역이 있는 글은 수정이 불가합니다.");
				mv.addObject("url", "/support/detail.pet?sNo="+support.getsNo());
				mv.setViewName("common/message");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("url", "/support/update.pet?sNo="+support.getsNo());
			mv.setViewName("common/message");
		}
		return mv;
	}

	// 후원글 삭제 
	@RequestMapping(value="/support/delete.pet", method = RequestMethod.GET)
	public ModelAndView deleteSupport(ModelAndView mv
			, @RequestParam("sNo") int sNo) {
		try {
			// 후원 내역 있는지 확인 후 없으면 삭제 
			int historyCount = sService.getHistoryCount(sNo);
			if(historyCount == 0) {
				int result = sService.deleteSupport(sNo);
				if(result > 0) {
					mv.addObject("msg", "게시글이 삭제되었습니다.");
					mv.addObject("url", "/support/list.pet");
					mv.setViewName("common/message");
				} else {
					mv.addObject("msg", "게시글 삭제가 완료되지 않았습니다.");
					mv.addObject("url",  "/support/detail.pet?sNo="+sNo);
					mv.setViewName("common/message");
				}
			} else {
				mv.addObject("msg", "후원내역이 있는 글은 삭제할 수 없습니다.");
				mv.addObject("url", "/support/detail.pet?sNo="+sNo);
				mv.setViewName("common/message");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("url", "/support/detail.pet?sNo="+sNo);
			mv.setViewName("common/message");
		}
		return mv;
	}

	// 후원글 목록 페이지 조회 
	@RequestMapping(value = "/support/list.pet", method = RequestMethod.GET)
	public ModelAndView showSupportList(ModelAndView mv
			, @RequestParam(value = "page", required=false, defaultValue = "1") Integer currentPage) {
		try {
			Map<String, String> sMap = new HashMap();
			sMap.put("category", "all");
			sMap.put("sort", "latest");
			
			
			Integer totalCount = sService.getListCount(sMap);
			SPageInfo sPInfo = this.getPageInfo(currentPage, totalCount);			
			List<Support> sList = sService.selectSupportList(sMap, sPInfo);
			// 오늘 후원 받아오기 
			SupportHistory sHistory = sService.selectTodaySupport();
			
			if(!sList.isEmpty()) {
				mv.addObject("sPInfo", sPInfo).addObject("sList", sList).addObject("sHistory", sHistory).addObject("sMap", sMap).setViewName("support/supportList");
			} else {
				mv.addObject("msg", "게시글 목록 조회가 완료되지 않았습니다.");
				mv.addObject("url", "/home.pet");
				mv.setViewName("common/message");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("url", "/home.pet");
			mv.setViewName("common/message");
		}
		return mv;
	}
	
	// 후원글 목록 페이지 조회 - 카테고리, 정렬 
	@RequestMapping(value = "/support/sList.pet", method = RequestMethod.GET)
	public ModelAndView showSupportSerachList(ModelAndView mv
			, @RequestParam(value = "page", required=false, defaultValue = "1") Integer currentPage
			, @RequestParam(value = "category", required=false, defaultValue = "all") String category
			, @RequestParam(value = "sort", required=false, defaultValue = "latest") String sort) {
		try {
			Map<String, String> sMap = new HashMap();
			sMap.put("category", category);
			sMap.put("sort", sort);
			
			Integer totalCount = sService.getListCount(sMap);
			SPageInfo sPInfo = this.getPageInfo(currentPage, totalCount);			
			List<Support> sList = sService.selectSupportList(sMap, sPInfo);
			
			// 오늘 후원 받아오기 
			SupportHistory sHistory = sService.selectTodaySupport();
			
			if(!sList.isEmpty()) {
				mv.addObject("sPInfo", sPInfo).addObject("sList", sList).addObject("sHistory", sHistory).addObject("sMap", sMap).setViewName("support/supportSearchList");
			} else {
				mv.addObject("msg", "선택하신 카테고리에 글이 존재하지 않습니다.");
				mv.addObject("url", "/support/list.pet");
				mv.setViewName("common/message");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("url", "/home.pet");
			mv.setViewName("common/message");
		}
		return mv;
	}
	
	// 후원 상세 페이지
	@RequestMapping(value="/support/detail.pet", method = RequestMethod.GET)
	public ModelAndView supportDetailPage(ModelAndView mv
			, @RequestParam("sNo") int sNo
			, HttpSession session) {
		try { 
			Support support = sService.selectSupportByNo(sNo);
			// session의 id와 sNo를 넘겨서 후원 내역을 불러오고 존재하면 상세 페이지로 넘겨서 댓글 등록창 보이도록 하기 
			String uId = (String)session.getAttribute("uId");
			SupportHistory sHistory = new SupportHistory();
			sHistory.setuId(uId);
			sHistory.setsNo(sNo);
			int sHistoryCount = sService.getCountSHistory(sHistory); // 후원 여부 uId, sNo로 조회 
			int totalHistoryCount = sService.getHistoryCount(sNo); // 후원 내역 갯수 sNo로 조회 
			if(support != null) {
				mv.addObject("totalHistoryCount", totalHistoryCount);
				mv.addObject("sHistoryCount", sHistoryCount);
				mv.addObject("support", support);
				mv.setViewName("/support/supportDetail");
			} else {
				mv.addObject("msg", "데이터 조회가 완료되지 않았습니다.");
				mv.addObject("url", "/support/list.pet");
				mv.setViewName("common/message");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("url", "/support/list.pet");
			mv.setViewName("common/message");
		}
		return mv;
	}
	
	// 후원 결제 페이지
	@RequestMapping(value="/support/payment.pet", method = RequestMethod.GET)
	public ModelAndView supportPaymentPage(ModelAndView mv
			, @RequestParam("sNo") int sNo
			, HttpSession session) {
		try {
			String uId = (String)session.getAttribute("uId");
			User user = uService.selectOneById(uId);
			Support support = sService.selectSupportByNo(sNo);
			if(support != null && user != null) {
				mv.addObject("user", user);
				mv.addObject("support", support);
				mv.setViewName("/support/supportPayment");
			} else {
				mv.addObject("msg", "데이터 조회가 완료되지 않았습니다.");
				mv.addObject("url", "/support/detail.pet?sNo="+sNo);
				mv.setViewName("common/message");
			}				
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("url", "/support/detail.pet?sNo="+sNo);
			mv.setViewName("common/message");
		}
		return mv;
		
	}
	
	// 후원 결제하고 내역 전송 
	@ResponseBody
	@RequestMapping(value = "/support/payment.pet", method = RequestMethod.POST)
	public String insertSupportHistory(ModelAndView mv
				, @ModelAttribute SupportHistory sHistory) {
		int result1 = sService.insertHistory(sHistory);
		if(result1 > 0) {
			Support sOne = new Support();
			sOne.setsNo(sHistory.getsNo());
			sOne.setsFundAmount(sHistory.getsHAmount());
			System.out.println("글번호 : " + sOne.getsNo() + ", 금액 : " + sOne.getsFundAmount());
			int result2 = sService.updateSupportFund(sOne);
			
			if(result2 > 0) {
				return "success";
			} else {
				return "fail";
			}
		} else {
			return "fail";
		}
	}
	
	// 메일 발송 
	@ResponseBody
	@RequestMapping(value = "/support/sendMail.pet", method = RequestMethod.POST)
	public String supportHistorySendMail(ModelAndView mv
				, @ModelAttribute SupportHistory sHistory) {
		// 후원내역을 메일로 발송하는 코드 들어와야함 
		String uId = sHistory.getuId();
		User user = uService.selectOneById(uId);
		
		// 현재 시간을 java.sql.Timestamp로 변환
		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
		sHistory.setsHPaydate(currentTimestamp);
		String sendMail = mailService.sendMail(sHistory, user);
		
		if(sendMail == "success") {
			System.out.println("메일 발송 완료");
			return "success";
		} else {
			System.out.println("메일 발송 실패");
			return "fail";
		}
	}
	
	// 후원 결제완료 페이지
	@RequestMapping(value="/support/complete.pet", method = RequestMethod.GET)
	public ModelAndView supportPayCompletePage(ModelAndView mv) {
		mv.setViewName("/support/supportPayComplete");
		return mv;
	}
	
	// 댓글 등록 
	@ResponseBody
	@RequestMapping(value="/sReply/insert.pet", method=RequestMethod.POST)
	public String insertReply(ModelAndView mv
			, @ModelAttribute SupportReply sReply
			, HttpSession session) {
		String uId = (String)session.getAttribute("uId");
		int result = 0;
		if(uId != null && !uId.equals("")) {
			sReply.setuId(uId);
			result = sService.insertReply(sReply);
		}
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 댓글 수정 
	@ResponseBody
	@RequestMapping(value="/sReply/update.pet", method=RequestMethod.POST)
	public String updateReply(
			@ModelAttribute SupportReply sReply
			, HttpSession session) {
		String uId = (String)session.getAttribute("uId");
		int result = 0;
		if(uId != null && !uId.equals("")) {
			result = sService.updateReply(sReply);
		}
		if(result > 0) {
			return "success";
		} else {
			return "fail";			
		}
	}
	
	// 댓글 삭제 
	@ResponseBody
	@RequestMapping(value="/sReply/delete.pet", method=RequestMethod.GET)
	public String deleteReply(
			@RequestParam("sRNo") Integer sRNo
			, HttpSession session) {
		String uId = (String)session.getAttribute("uId");
		int result = 0;
		if(uId != null && uId.equals(uId)) {
			result = sService.deleteReply(sRNo);
		}
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 댓글 목록 조회 
	@ResponseBody
	@RequestMapping(value = "/sReply/list.pet"
					, produces = "application/json; charset=utf-8"
					, method = RequestMethod.GET)
	public String showReplyList(Integer sNo, Integer currentPage) {
		int recordCountPerPage = 5; // 페이지당 댓글 수 
		// currentPage와 recordCountPerPage를 이용하여 페이징 처리
		// 페이징을 적용하여 댓글 데이터를 가져오도록 구현 
	    int start = (currentPage - 1) * recordCountPerPage;
	    int end = start + recordCountPerPage;
	    
	    // 글번호 sNo의 전체 댓글 리스트 불러옴 
	    List<SupportReply> sRList = sService.selectSReplyListByNo(sNo);
	    
	    // 범위 체크를 통해 부분 리스트 추출
	    if (start < sRList.size()) {
	        end = Math.min(end, sRList.size());
	     // 범위에 해당하는 부분 리스트를 추출하여 sRList에 대입
	        sRList  = sRList.subList(start, end);
	    } else {
	    	sRList  = Collections.emptyList();
	    }
	    
	    // 댓글 정보에 작성자 닉네임 담아줌 
		for (SupportReply sReply : sRList) {
	        User user = uService.selectOneById(sReply.getuId()); 
	        sReply.setsRWriter(user.getuNickName());
	        sReply.setuFilePath(user.getuFilePath());
	    }
		
		// 전체 페이지 수 계산 (댓글의 총 갯수를 페이지당 댓글 갯수로 나눠서 계산) 
	    int totalRecords = sService.getReplyListCountByNo(sNo); // 댓글의 총 갯수 
	    int totalPages = (int) Math.ceil((double) totalRecords / recordCountPerPage); // 전체 페이지 수 
	    
	    // 댓글 리스트와 전체 페이지 수를 Map에 담아서 보냄 
	    Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("sRList", sRList);
	    resultMap.put("totalPages", totalPages);
	    
		Gson gson = new Gson();
		return gson.toJson(resultMap);
	}
	
	
	// 후원 내역 목록 조회 
	@ResponseBody
	@RequestMapping(value = "/sHistory/list.pet"
	, produces = "application/json; charset=utf-8"
	, method = RequestMethod.GET)
	public String showHistoryList(Integer sNo, Integer currentPage) {
		int recordCountPerPage = 5; // 페이지당 후원내역 수 
		// currentPage와 recordCountPerPage를 이용하여 페이징 처리
		// 페이징을 적용하여 후원 내역 데이터를 가져오도록 구현 
		int start = (currentPage - 1) * recordCountPerPage;
		int end = start + recordCountPerPage;
		
		// 글번호 sNo의 전체 후원 내역 리스트 불러옴 
		List<SupportHistory> sHList = sService.selectSHistoryList(sNo);
		
		// 범위 체크를 통해 부분 리스트 추출
		if (start < sHList.size()) {
			end = Math.min(end, sHList.size());
			// 범위에 해당하는 부분 리스트를 추출하여 sHList에 대입
			sHList  = sHList.subList(start, end);
		} else {
			sHList  = Collections.emptyList();
		}
		
		// 후원자 타입 확인해서 익명 선택시 이름 숨은천사로 넣어줌 
		for (SupportHistory sHistory : sHList) {
			if(sHistory.getsHType() == "A") {
				sHistory.setsHName("숨은천사");
			}
			User user = uService.selectOneById(sHistory.getuId());
			sHistory.setuFilePath(user.getuFilePath());
		}
		
		// 전체 페이지 수 계산 (후원내역의 총 갯수를 페이지당 후원내역 갯수로 나눠서 계산) 
		int totalRecords = sService.getHistoryCount(sNo); // 후원내역의 총 갯수 
		int totalPages = (int) Math.ceil((double) totalRecords / recordCountPerPage); // 후원내역 페이지 수 
		
		// 후원내역 리스트와 전체 페이지 수를 Map에 담아서 보냄 
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("sHList", sHList);
		resultMap.put("totalPages", totalPages);
		
		Gson gson = new Gson();
		return gson.toJson(resultMap);
	}


	private SPageInfo getPageInfo(Integer currentPage, Integer totalCount) {
		int recordCountPerPage = 11;
		int naviCountPerPage = 5;
		int naviTotalCount = (int)Math.ceil((double)totalCount / recordCountPerPage);
		int startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage - 1;
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		SPageInfo pInfo = new SPageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
		return pInfo;
	}
	
		
		
}
