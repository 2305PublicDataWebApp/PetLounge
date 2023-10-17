package com.lounge.pet.faq.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.lounge.pet.faq.domain.Faq;
import com.lounge.pet.faq.service.FaqService;

@Controller
@RequestMapping("/faq")
public class FaqController {
	
	@Autowired
	private FaqService fService;
	
	// faq 목록 페이지로 이동
	@ResponseBody
	@GetMapping("/show.pet")
	public String showFaqView(Integer faqNo) {
        List<Faq> faqList = fService.getFaqList(faqNo);
        Gson gson = new Gson();
        return gson.toJson(faqList);
	}
	
	@GetMapping("/list.pet")
	public String showFaqView() {
        return "faq/list";
	}
	
	
	// faq 등록 페이지로 이동
	@GetMapping("/insert.pet")
	public String showFaqInsert(ModelAndView mv) {
		return "faq/insert";
	}
	
	// faq 글 등록
	@ResponseBody
	@PostMapping("/insert.pet")
	public String insertFaq(
			@RequestParam("faqContent") String faqContent
			, @RequestParam("faqTitle") String faqTitle
			, HttpSession session) {
		try {
			Faq faq = new Faq();
			faq.setFaqTitle(faqTitle);
			faq.setFaqContent(faqContent);
			String faqWriter = "admin";
			String sessionId = (String)session.getAttribute("uId");
			int result = 0;
			if(!sessionId.isEmpty() && sessionId.equals(faqWriter)) {
				result = fService.insertFaq(faq);
			} else {
				return "fail";
			}
			if(result > 0) {
				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
}
