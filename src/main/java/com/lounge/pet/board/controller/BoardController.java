package com.lounge.pet.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

	@GetMapping("/notice_list.pet")
	public String noticeList() {
		return "board/notice_list";
	}
}
