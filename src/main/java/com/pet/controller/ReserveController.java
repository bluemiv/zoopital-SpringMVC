package com.pet.controller;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pet.model.ReserveDAO;
import com.pet.model.ReserveDTO;

@Controller
@RequestMapping("/reserve/")
public class ReserveController {
	
	//Mybatis
			@Autowired
			private SqlSession sqlSession;
			
	@RequestMapping("/reserveListForm.pet")
	public String reserveListForm(Model model, Principal principal){
		System.out.println("reserveListForm 컨트롤러 진입");
		
		ReserveDTO reserveDTO = new ReserveDTO();
		reserveDTO.setStore_code(principal.getName());		

		ReserveDAO reserveDAO = sqlSession.getMapper(ReserveDAO.class);
		List<ReserveDTO> reserveList = reserveDAO.selectReserve(reserveDTO);
		model.addAttribute("reserveList", reserveList);

		return "/reserve/reserveListForm";
	}
	
	@RequestMapping("/reserveInsertForm.pet")
	public String reserveInsertForm(Model model, Principal principal){
		System.out.println("reserveListForm 컨트롤러 진입");
		
	/*	ReserveDTO reserveDTO = new ReserveDTO();
		reserveDTO.setStore_code(principal.getName());		
		
		ReserveDAO reserveDAO = sqlSession.getMapper(ReserveDAO.class);
		List<ReserveDTO> reserveList = reserveDAO.selectReserve(reserveDTO);
		model.addAttribute("reserveList", reserveList);*/
		
		return "/reserve/reserveInsertForm";
	}
	
}
