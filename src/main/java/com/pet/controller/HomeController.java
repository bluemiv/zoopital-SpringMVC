package com.pet.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	// 테스트 용
	@RequestMapping("home.pet")
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	
}
