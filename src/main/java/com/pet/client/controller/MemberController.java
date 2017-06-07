package com.pet.client.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/client/member/")
public class MemberController {

	@RequestMapping("kakaoLoginForm.pet")
	public String kakaoLoginForm(){
		System.out.println("kakaoLoginForm 접근");
		
		return "client/member/kakaoLoginForm";
	}
	
}
