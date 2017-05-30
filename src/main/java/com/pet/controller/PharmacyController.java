package com.pet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("pharmacy")
public class PharmacyController {
	
	@RequestMapping("pharmacyListForm.pet")
	public String pharmacyListForm() throws Exception{
		System.out.println("pharmacyListForm 접근");
		
		return "pharmacy/pharmacyListForm";
	}
	
}
