package com.pet.client.controller;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pet.client.model.BasketDAO;
import com.pet.client.model.BasketDTO;

@Controller
@RequestMapping("/client/basket/")
public class BasketController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("baksetListForm.pet")
	public String baksetListForm(Principal principal, Model model) throws Exception{
		System.out.println("baksetListForm 접근");
		
		// 세션 값 가져옴
		BasketDTO basketDTO = new BasketDTO();
		basketDTO.setClient_id(principal.getName());
		
		// 리스트 가져옴
		BasketDAO basketDAO = sqlSession.getMapper(BasketDAO.class);
		List<BasketDTO> list = basketDAO.selectAll(basketDTO);
		
		model.addAttribute("list",list);
		return "/client/basket/baksetListForm";
	}
	
	@RequestMapping("baksetInsertPro.pet")
	public String baksetInsertPro(Principal principal, BasketDTO basketDTO) throws Exception{
		System.out.println("baksetInsertPro 접근");
	
		// 세션 값 가져옴
		basketDTO.setClient_id(principal.getName());
			
		// 장바구니 담기
		boolean check = false;
		BasketDAO basketDAO = sqlSession.getMapper(BasketDAO.class);
		if(basketDAO.basketInsert(basketDTO)>0){
			check = true;
		}
		
		return "redirect:../product/productListForm.pet";
	}
	
	@RequestMapping("baksetDelete.pet")
	public String baksetDelete(BasketDTO basketDTO) throws Exception{
		System.out.println("baksetDelete 접근");

		// 삭제
		boolean check = false;
		BasketDAO basketDAO = sqlSession.getMapper(BasketDAO.class);
		if(basketDAO.basketDelete(basketDTO)>0){
			check = true;
		}
		
		return "redirect:baksetListForm.pet";
	}
	
}
