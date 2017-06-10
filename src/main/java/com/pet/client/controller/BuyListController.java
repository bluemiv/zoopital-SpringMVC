package com.pet.client.controller;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pet.client.model.BuyListDAO;
import com.pet.client.model.BuyListDTO;

@Controller
@RequestMapping("/client/buyList/")
public class BuyListController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("buyListForm.pet")
	public String buyListForm(Principal principal, BuyListDTO buyListDTO, Model model) throws Exception{
		System.out.println("buyListForm");
		buyListDTO.setClient_id(principal.getName());
		BuyListDAO buyListDAO = sqlSession.getMapper(BuyListDAO.class);
		List<BuyListDTO> list = buyListDAO.selectAllList(buyListDTO);
		model.addAttribute("list",list);
		
		return "/client/buyList/buyListForm";
	}
}
