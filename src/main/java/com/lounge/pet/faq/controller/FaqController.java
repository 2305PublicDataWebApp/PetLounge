package com.lounge.pet.faq.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// faq 리스트 조회
	@ResponseBody
	@GetMapping("/show.pet")
	public String showFaqView(Integer faqNo) {
        List<Faq> faqList = fService.getFaqList(faqNo);
        Gson gson = new Gson();
        return gson.toJson(faqList);
	}
	
	// faq 목록 페이지로 이동
	@GetMapping("/list.pet")
	public String showFaqView() {
        return "faq/list";
	}
	
	// faq 등록 페이지로 이동
	@GetMapping("/insert.pet")
	public String showFaqInsert() {
		return "faq/insert";
	}
	
	// faq 수정 페이지로 이동
	@GetMapping("/modify.pet")
	public String showFaqModify(Faq faqNo
			, HttpSession session
			, Model model) {
		try {
			String sessionId = (String)session.getAttribute("uId"); // 세션 id
			if(sessionId.equals("admin") && !sessionId.isEmpty()) {
				Faq faq = fService.selectOneByNo(faqNo);
				if(faq != null) {
					model.addAttribute("faq", faq);
					return "faq/modify";
				} else {
					model.addAttribute("msg", "페이지 이동에 실패하였습니다.");
					model.addAttribute("url", "/faq/modify.pet?faqNo="+faqNo);
					return "common/message";
				}
			} else {
				model.addAttribute("msg", "로그인 후 이용 가능합니다.");
				model.addAttribute("url", "/user/login.pet");
				return "common/message";
			}
			
		} catch (Exception e) {
			model.addAttribute("msg", "페이지 이동에 오류가 발생하였습니다..");
			model.addAttribute("url", "/faq/modify.pet?faqNo="+faqNo);
			return "common/message";
		}
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
			faq.setFaqTitle(faqTitle);		// 제목
			faq.setFaqContent(faqContent);	// 내용
			String faqWriter = "admin";		// 작성자 id
			String sessionId = (String)session.getAttribute("uId"); // 세션 id
			int result = 0;
			if(!sessionId.isEmpty() && sessionId.equals(faqWriter)) { // 유효성 검사
				int faqCount = fService.getFaqCount();	// faq 목록 갯수
				int maxFaqItems = 10;					// faq 목록 최대 갯수
				if(faqCount >= maxFaqItems) {			// faq 목록이 10개 이상일 경우
					return "fail"; // 현재 FAQ 항목이 10개 이상이면 실패
				} else {
					result = fService.insertFaq(faq);	// faq 등록
					if(result > 0) {
						return "success";
					} else {
						return "fail";
					}
				}
			} else {
				return "fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	// faq 글 수정
	@PostMapping("/modify.pet")
	public String modifyFaq(Faq faq
			, HttpSession session
			, Model model) {
		try {
			String sessionId = (String)session.getAttribute("uId"); // 세션 id
			if(sessionId.equals("admin") && !sessionId.isEmpty()) {
				int result = fService.modifyFaq(faq);
				if(result > 0) {
					return "faq/list";
				} else {
					model.addAttribute("msg", "FAQ 수정에 실패하였습니다.");
					model.addAttribute("url", "/faq/modify.pet?FaqNo="+faq.getFaqNo());
					return "common/message";
				}
			} else {
				model.addAttribute("msg", "로그인 후 이용가능합니다.");
				model.addAttribute("url", "/user/login.pet");
				return "common/message";
			}
			
		} catch (Exception e) {
			model.addAttribute("msg", "FAQ 수정에 오류가 발생하였습니다.");
			model.addAttribute("url", "/faq/modify.pet?FaqNo="+faq.getFaqNo());
			return "common/message";
		}
	}
	
	// faq 글 삭제
	@ResponseBody
	@PostMapping("/delete.pet")
	public String deleteFaq(@RequestParam Integer faqNo
							, HttpSession session) {
		String sessionId = (String)session.getAttribute("uId"); // 세션 id
		if(sessionId.equals("admin") && !sessionId.isEmpty()) {
			int result = fService.deleteFaq(faqNo);
			if(result > 0) {
				return "success";
			} else {
				return "fail";
			}
		} else {
			return "fail";
		}
	}
	
	
}
