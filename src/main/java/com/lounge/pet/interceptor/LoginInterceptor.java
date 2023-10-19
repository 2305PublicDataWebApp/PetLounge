package com.lounge.pet.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component("loginInterceptor")
public class LoginInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception  {
		HttpSession session = request.getSession();
		String element = "<script> alert('로그인이 필요한 서비스 입니다.'); location.href='/user/login.pet'; </script>";
    	String uId = (String)session.getAttribute("uId");
    	System.out.println("[session Id] : " + uId);
    	if(uId == null || uId.equals("")) {
    		System.out.println();
    		response.setCharacterEncoding("UTF-8");
    		response.setContentType("text/html; charset=UTF-8");	
    		PrintWriter out = response.getWriter();
    		out.println(element);
            out.flush(); //브라우저 출력 비우기
            out.close(); //아웃객체 닫기
    		return false;
    	}
		return true;
	}
}
