package com.lounge.pet.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.lounge.pet.interceptor.AdminInterceptor;
import com.lounge.pet.interceptor.LoginInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Autowired
	@Qualifier("loginInterceptor")
	private LoginInterceptor loginInterceptor;
	
	@Autowired
	@Qualifier("adminInterceptor")
	private AdminInterceptor adminInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginInterceptor).addPathPatterns("/support/payment.pet", "/support/complete.pet");
		registry.addInterceptor(adminInterceptor).addPathPatterns("/support/insert.pet", "/support/update.pet", "/support/delete.pet");
		
		
		WebMvcConfigurer.super.addInterceptors(registry);
	}
	
}
