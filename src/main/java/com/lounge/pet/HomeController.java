package com.lounge.pet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lounge.pet.support.domain.Support;
import com.lounge.pet.support.service.SupportService;

@Controller
public class HomeController {
	
	@Autowired
	private SupportService sService;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}

	@RequestMapping(value = "/home.pet", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv) {

		// 후원 내역
		List<Support> sList = sService.selectMainSupportList();
		sList = sList.subList(0, 3);
		mv.addObject("sList", sList);
		mv.setViewName("home");
		return mv;
	}
	
}
