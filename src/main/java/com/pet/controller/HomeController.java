package com.pet.controller;

import java.security.Principal;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	// 테스트 용
	@RequestMapping("/home.pet")
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	
	// 로그인
	@RequestMapping("loginForm.pet")
	public String loginForm() {
		
		return "loginForm";
	}
	
	// 권한 거부 에러 페이지
	@RequestMapping("accessDeniedPage.pet")
	public String accessDeniedPage(Principal principal){
		System.out.println(principal.getName() + " 접근 거부");
		return "accessDeniedPage";
	}
	
}
