package com.lounge.pet.board.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.lounge.pet.board.domain.Board;
import com.lounge.pet.board.service.BoardService;
import com.lounge.pet.user.service.UserService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
//	@Autowired
//	private UserService uService;
	
	
	/**
	 * 자유게시판 리스트 조회
	 */
	@RequestMapping(value = "/free_list.pet"
			, method = RequestMethod.GET)
	public ModelAndView showFreeBoardList1(ModelAndView mv ) {
		mv.setViewName("board/free_list");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/free_list1.pet"
			, produces = "application/json; charset=utf-8"
			, method = RequestMethod.GET)
	public String showFreeBoardList(@RequestParam(defaultValue = "1") Integer currentPage, Integer recordCountPerPage) {
		try {
			// currentPage와 recordCountPerPage를 이용하여 페이징 처리
			// 페이징을 적용하여 댓글 데이터를 가져오도록 구현 
			int start = (currentPage - 1) * recordCountPerPage;
			int end = start + recordCountPerPage;
			
			Map<String, String> fMap = new HashMap();

			// 게시글 리스트 불러옴 
			List<Board> freeBoardList = bService.selectFreeBoardList();
			
			// 범위 체크를 통해 부분 리스트 추출
			if (start < freeBoardList.size()) {
				end = Math.min(end, freeBoardList.size());
				// 범위에 해당하는 부분 리스트를 추출하여 sList에 대입
				freeBoardList  = freeBoardList.subList(start, end);  // 'subList' 메서드를 사용하여 'start'부터 'end'까지의 범위만큼 잘라냄
			} else {
				freeBoardList  = Collections.emptyList();	// Collections.emptyList() 는 빈(무엇도 포함하지 않는) 컬렉션 객체를 반환하는 역할을 하는 정적 메서드
			}

			// 전체 페이지 수 계산 (후원글의 총 갯수를 페이지당 글 갯수로 나눠서 계산) 
//			int totalSearchRecords = bService.getSearchCount(fMap); // 게시글의 총 갯수 
			int totalSearchRecords = freeBoardList.size(); // 게시글의 총 갯수 
			int totalSearchPages = (int) Math.ceil((double) totalSearchRecords / recordCountPerPage); // 전체 페이지 수 
			
//			System.out.println("currentPage: " + currentPage + ", recordCountPerPage: " + recordCountPerPage);
//			System.out.println("searchList size: " + freeBoardList.size() + ", totalSearchRecords: " + totalSearchRecords + ", totalSearchPages: " + totalSearchPages);
			
					
			// 게시글 리스트와 전체 페이지 수를 Map에 담아서 보냄 
			Map<String, Object> resultMap = new HashMap<>();
			resultMap.put("freeBoardList", freeBoardList);
			resultMap.put("totalSearchPages", totalSearchPages);
			
			Gson gson = new Gson();
			return gson.toJson(resultMap);
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
		
	}
	
	
	
}
