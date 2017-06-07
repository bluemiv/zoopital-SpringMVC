package com.pet.client.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pet.client.model.ClientDAO;
import com.pet.client.model.ClientDTO;

@Controller
@RequestMapping("/client/")

public class ClientController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("clientJoinForm.pet")
	public String joinForm(ClientDTO dto, Model model){
		
		return "/client/join/joinForm";
	}
	
	@RequestMapping("clientJoinPro.pet")
	public String joinPro(ClientDTO dto, Model model){
		
		ClientDAO joinDAO = sqlSession.getMapper(ClientDAO.class);
		System.out.println(dto.toString());
		joinDAO.insertClient(dto);

		return "redirect:clientJoinForm.pet";
	}
	
	
	//////////////////////////Ajax////////////////////////////////////////
	@ResponseBody
	@RequestMapping("/clientIdConfirmAjax.pet")
	public boolean clientIdConfirmAjax(@RequestBody ClientDTO clientDTO){
		
		System.out.println("Ajax실행");
		System.out.println(clientDTO.getClient_id());
		
		ClientDAO joinDAO = sqlSession.getMapper(ClientDAO.class);
		
		boolean check = false;
		
		try {
			List<ClientDTO> result = joinDAO.selectClient(clientDTO);
			System.out.println("----------------");
			System.out.println(result);
			System.out.println("----------------");
		
			if(result != null){
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
