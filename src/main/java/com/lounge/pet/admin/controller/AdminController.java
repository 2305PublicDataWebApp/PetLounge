package com.lounge.pet.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping("/main_board.pet")
	public String adminBoard() {
		return "admin/main_board";
	}
	
	@GetMapping("/main_stats.pet")
	public String adminStats() {
		return "admin/main_stats";
	}
	
	@GetMapping("/main_user.pet")
	public String adminUser() {
		return "admin/main_user";
	}
	
	@GetMapping("/main_userdetail.pet")
	public String adminUserDetail() {
		return "admin/main_userdetail";
	}	
	
	@GetMapping("/main_useredit.pet")
	public String adminUserEdit() {
		return "admin/main_useredit";
	}	
}
