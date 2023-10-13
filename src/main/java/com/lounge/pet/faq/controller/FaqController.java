package com.lounge.pet.faq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/faq")
public class FaqController {
	
	// faq 목록 페이지로 이동
	@GetMapping("/list.pet")
	public ModelAndView showFaqView(ModelAndView mv) {
		mv.setViewName("faq/list");
		return mv;
	}
	
	// faq 등록 페이지로 이동
	@GetMapping("/insert.pet")
	public ModelAndView showFaqInsert(ModelAndView mv) {
		mv.setViewName("faq/insert");
		return mv;
	}
}
