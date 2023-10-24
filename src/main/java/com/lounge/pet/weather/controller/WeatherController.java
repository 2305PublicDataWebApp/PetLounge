package com.lounge.pet.weather.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.lounge.pet.user.domain.User;
import com.lounge.pet.user.service.UserService;
import com.lounge.pet.weather.domain.Weather;
import com.lounge.pet.weather.service.WeatherService;

@Controller
@RequestMapping("/weather")
public class WeatherController {
	
	@Autowired
	private UserService uService;
	@Autowired
	private WeatherService wService;

	// 산책 날씨 예보 페이지로 이동
	// 회원DB에서 주소 호출
	@GetMapping("/weather.pet")
	public String showFaqView(User user
			, HttpSession sessoin
			, HttpServletRequest request
			, Model model) {
		
		try {
			HttpSession session = request.getSession(); // HttpSession 객체 가져오기
			String sessionId = (String)session.getAttribute("uId");
			if(sessionId != null && sessionId != "") {
				User uOne = uService.selectOneById(sessionId);
				model.addAttribute("user", uOne);
				return "weather/weather";
			} else {
				// 기본값 서울
				return "weather/weather";
			}
		} catch (Exception e) {
			model.addAttribute("msg", "관리자에게 문의바랍니다.");
			model.addAttribute("url", "/weather/weather.pet");
			return "common/message";
		}
	}
	
	
	// tmi 추가
	@ResponseBody
	@PostMapping(value="/insertTmi.pet")
	public String insertTmi(
			@RequestParam("tmiContent") String tmiContent
			, HttpSession session
			, Model model) {
		Weather tmi = new Weather();
		tmi.setTmiContent(tmiContent);
		int result = wService.insertTmi(tmi);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// tmi 조회
	@ResponseBody
	@RequestMapping(value="/show.pet")
	public String showTmiLis() {
		List<Weather> tmiList = wService.selectTmiList();
		Gson gson = new Gson();
		return gson.toJson(tmiList);
	}
	
	
	
	
	
}
