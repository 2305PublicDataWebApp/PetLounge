package com.lounge.pet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Controller
public class ExceptionHandlingController {

//	@GetMapping("/error")
//    public ModelAndView handleError()
//    {
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.setViewName("error");
//        return modelAndView;
//    }
	
	@ExceptionHandler(Exception.class)
	public String except(Exception e, Model model) {
		return "error";
	}
}