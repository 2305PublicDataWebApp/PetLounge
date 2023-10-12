package com.lounge.pet.weather.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/weather")
public class WeatherController {

	// 산책 날씨 예보 페이지로 이동
	@GetMapping("/weather.do")
	public ModelAndView showFaqView(ModelAndView mv) {
		mv.setViewName("weather/weather");
		return mv;
	}
	
}
