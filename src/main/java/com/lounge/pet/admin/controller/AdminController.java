package com.lounge.pet.admin.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.lounge.pet.admin.service.AdminService;
import com.lounge.pet.support.domain.Support;
import com.lounge.pet.support.domain.SupportHistory;
import com.lounge.pet.support.domain.SupportTotalAmount;
import com.lounge.pet.support.service.SupportService;
import com.lounge.pet.user.domain.UserSupport;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private SupportService sService;
	
	@Autowired
	private AdminService aService;

	@GetMapping("/board.pet")
	public String adminBoard() {
		return "admin/adminBoard";
	}
	
	@GetMapping("/stats.pet")
	public String adminStats(Model model) {
		List<SupportTotalAmount> sList = sService.selectSupportAmountByPaytype();
		model.addAttribute("sList", sList);
		System.out.println(sList);
		return "admin/adminStats";
	}

	// 관리자페이지 통계관리페이지 후원내역 조회(for 후원순위)
	@ResponseBody
	@RequestMapping(value = "/sRank.pet"
	, produces = "application/json; charset=utf-8"
	, method = RequestMethod.GET)
	public String showSupportHistoryListForRank(Integer currentPage) {
		Integer recordCountPerPage =  5;
		// 페이징을 적용하여 댓글 데이터를 가져오도록 구현 
		int start = (currentPage - 1) * recordCountPerPage;
		int end = start + recordCountPerPage;
		
		List<SupportHistory> sHList = aService.selectHistoryList();
		
		// 범위 체크를 통해 부분 리스트 추출
		if (start < sHList.size()) {
			end = Math.min(end, sHList.size());
			// 범위에 해당하는 부분 리스트를 추출하여 sHList에 대입
			sHList  = sHList.subList(start, end);
		} else {
			sHList  = Collections.emptyList();
		}
		
		// 전체 페이지 수 계산 (후원내역의 총 갯수를 페이지당 글 갯수로 나눠서 계산) 
		int totalRecords = sService.getHistoryListCount(); // 후원내역의 총 갯수 
		int totalPages = (int) Math.ceil((double) totalRecords / recordCountPerPage); // 전체 페이지 수 
		
		// 후원내역 리스트와 전체 페이지 수를 Map에 담아서 보냄 
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("sHList", sHList);
		resultMap.put("totalPages", totalPages);
		resultMap.put("totalRecords", totalRecords);
		
		Gson gson = new Gson();
		return gson.toJson(resultMap);
	}
	
	@GetMapping("/user.pet")
	public String adminUser() {
		return "admin/adminUser";
	}
	
	@GetMapping("/userdetail.pet")
	public String adminUserDetail() {
		return "admin/adminUserDetail";
	}	
	
	@GetMapping("/useredit.pet")
	public String adminUserEdit() {
		return "admin/adminUserEdit";
	}
	
	// 관리자페이지 후원관리페이지로 이동 
	@GetMapping("/support.pet")
	public String adminSupportPage() {
		return "admin/adminSupport";
	}	
	
	// 관리자페이지 후원관리페이지 후원글 조회
	@ResponseBody
	@RequestMapping(value = "/sList.pet"
	, produces = "application/json; charset=utf-8"
	, method = RequestMethod.GET)
	public String showSupportList(Integer currentPage, String status) {
		Integer recordCountPerPage =  5;
		// 페이징을 적용하여 댓글 데이터를 가져오도록 구현 
		int start = (currentPage - 1) * recordCountPerPage;
		int end = start + recordCountPerPage;
		
		List<Support> sList = sService.selectSupportListByStatus(status);
		
		// 범위 체크를 통해 부분 리스트 추출
		if (start < sList.size()) {
			end = Math.min(end, sList.size());
			// 범위에 해당하는 부분 리스트를 추출하여 sList에 대입
			sList  = sList.subList(start, end);
		} else {
			sList  = Collections.emptyList();
		}
		
		// 전체 페이지 수 계산 (후원글의 총 갯수를 페이지당 글 갯수로 나눠서 계산) 
		int totalRecords = sService.getSupportListCountByStatus(status); // 후원글의 총 갯수 
		int totalPages = (int) Math.ceil((double) totalRecords / recordCountPerPage); // 전체 페이지 수 
		
		// 후원글 리스트와 전체 페이지 수를 Map에 담아서 보냄 
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("sList", sList);
		resultMap.put("totalPages", totalPages);
		
		Gson gson = new Gson();
		return gson.toJson(resultMap);
	}
	
	// 관리자페이지 후원관리페이지 후원내역 조회
	@ResponseBody
	@RequestMapping(value = "/sHList.pet"
	, produces = "application/json; charset=utf-8"
	, method = RequestMethod.GET)
	public String showSupportHistoryList(Integer currentPage) {
		Integer recordCountPerPage =  5;
		// 페이징을 적용하여 댓글 데이터를 가져오도록 구현 
		int start = (currentPage - 1) * recordCountPerPage;
		int end = start + recordCountPerPage;
		
		List<UserSupport> sHList = sService.selectHistoryList();
		
		// 범위 체크를 통해 부분 리스트 추출
		if (start < sHList.size()) {
			end = Math.min(end, sHList.size());
			// 범위에 해당하는 부분 리스트를 추출하여 sHList에 대입
			sHList  = sHList.subList(start, end);
		} else {
			sHList  = Collections.emptyList();
		}
		
		// 전체 페이지 수 계산 (후원내역의 총 갯수를 페이지당 글 갯수로 나눠서 계산) 
		int totalRecords = sService.getHistoryListCount(); // 후원내역의 총 갯수 
		int totalPages = (int) Math.ceil((double) totalRecords / recordCountPerPage); // 전체 페이지 수 
		
		// 후원내역 리스트와 전체 페이지 수를 Map에 담아서 보냄 
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("sHList", sHList);
		resultMap.put("totalPages", totalPages);
		
		Gson gson = new Gson();
		return gson.toJson(resultMap);
	}
	
	
	// 관리자페이지 후원관리페이지 댓글 조회
		@ResponseBody
		@RequestMapping(value = "/sRList.pet"
		, produces = "application/json; charset=utf-8"
		, method = RequestMethod.GET)
		public String showSupportReplyList(Integer currentPage) {
			Integer recordCountPerPage =  5;
			// 페이징을 적용하여 댓글 데이터를 가져오도록 구현 
			int start = (currentPage - 1) * recordCountPerPage;
			int end = start + recordCountPerPage;
			
			List<UserSupport> sRList = sService.selectReplyList();
			
			// 범위 체크를 통해 부분 리스트 추출
			if (start < sRList.size()) {
				end = Math.min(end, sRList.size());
				// 범위에 해당하는 부분 리스트를 추출하여 sRList에 대입
				sRList  = sRList.subList(start, end);
			} else {
				sRList  = Collections.emptyList();
			}
			
			// 전체 페이지 수 계산 (후원내역의 총 갯수를 페이지당 글 갯수로 나눠서 계산) 
			int totalRecords = sService.getReplyListCount(); // 후원글 댓글의 총 갯수 
			int totalPages = (int) Math.ceil((double) totalRecords / recordCountPerPage); // 전체 페이지 수 
			
			// 후원내역 리스트와 전체 페이지 수를 Map에 담아서 보냄 
			Map<String, Object> resultMap = new HashMap<>();
			resultMap.put("sRList", sRList);
			resultMap.put("totalPages", totalPages);
			
			Gson gson = new Gson();
			return gson.toJson(resultMap);
		}
}
