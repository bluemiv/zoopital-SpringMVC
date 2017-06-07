package com.pet.client.controller;

import java.util.StringTokenizer;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pet.client.model.ClientDTO;
import com.pet.client.model.ClientDAO;

@Controller
@RequestMapping("/join/")

public class JoinController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("joinForm.pet")
	public String joinForm(ClientDTO dto, Model model){
		
		return "/client/join/joinForm";
	}
	
	@RequestMapping("joinPro.pet")
	public String joinPro(ClientDTO dto, Model model){
		
		ClientDAO joinDAO = sqlSession.getMapper(ClientDAO.class);
		System.out.println(dto.toString());
		joinDAO.insertClient(dto);

		return "redirect:../../home.pet";
	}
	
	
	///////////////////Ajax////////////////////////////////////////
	@ResponseBody
	@RequestMapping("/clientIdConfirmAjax.pet")
	public boolean clientIdConfirmAjax(@RequestBody ClientDTO clientDTO){
		
		
		System.out.println("Ajax실행");
		System.out.println(clientDTO.getClient_id());
		
		ClientDAO joinDAO = sqlSession.getMapper(ClientDAO.class);
		
		boolean check = false;
		
		try {
			ClientDTO result_clientDTO = joinDAO.selectClientList(clientDTO);
			if(result_clientDTO.getClient_id() != null){
				// 아이디가 존재함(사용 불가능)
				check = false;
			}
		} catch (Exception e) {
			// 아이디가 없음 (사용가능)
			// NullPointException에 걸림
			check = true;
		}
		
		return check;
	}

}
