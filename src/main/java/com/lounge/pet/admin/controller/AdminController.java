package com.lounge.pet.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping("/main_board.do")
	public String adminBoard() {
		return "admin/main_board";
	}
	
	@GetMapping("/main_stats.do")
	public String adminStats() {
		return "admin/main_stats";
	}
	
	@GetMapping("/main_user.do")
	public String adminUser() {
		return "admin/main_user";
	}
	
	@GetMapping("/main_userdetail.do")
	public String adminUserDetail() {
		return "admin/main_userdetail";
	}	
	
	@GetMapping("/main_useredit.do")
	public String adminUserEdit() {
		return "admin/main_useredit";
	}	
}
