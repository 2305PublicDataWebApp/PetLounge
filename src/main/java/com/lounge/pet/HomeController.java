package com.lounge.pet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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

//		List<Support> sList = sService.selectSupportList();
		mv.setViewName("home");
		return mv;
	}
	
}
