package com.pet.controller;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pet.model.MessageDAO;
import com.pet.model.MessageDTO;

@Controller
@RequestMapping("/message/")
public class MessageController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("messageListForm.pet")
	public String messageListForm(Principal principal, Model model) throws Exception{
		System.out.println("messageListForm 접근");
		
		// 세션 값 가져옴
		MessageDTO messageDTO = new MessageDTO();
		messageDTO.setMessage_writer(principal.getName());
		
		// 리스트 가져옴
		MessageDAO messageDAO = sqlSession.getMapper(MessageDAO.class);
		List<MessageDTO> list = messageDAO.selectAllMessage(messageDTO);
		
		// 리스트 넘김
		model.addAttribute("list", list);
		return "message/messageListForm";
	}
}
