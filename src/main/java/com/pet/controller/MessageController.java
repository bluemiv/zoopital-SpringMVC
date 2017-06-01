package com.pet.controller;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pet.model.EmpDAO;
import com.pet.model.EmpDTO;
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
		
		// 모든 회원 ID 가져옴
		EmpDAO empDAO = sqlSession.getMapper(EmpDAO.class);
		List<EmpDTO> empDTOList = empDAO.selectAllEmp();
		
		// 리스트 넘김
		model.addAttribute("list", list);
		model.addAttribute("empDTOList", empDTOList);
		return "message/messageListForm";
	}
	
	@RequestMapping("messageSendPro.pet")
	public String messageSendPro(MessageDTO messageDTO, Principal principal, Model model) throws Exception{
		System.out.println("messageSendPro 접근");
		
		// 세션값 가져옴
		messageDTO.setMessage_writer(principal.getName());
		
		boolean check = false;
		MessageDAO messageDAO = sqlSession.getMapper(MessageDAO.class);
		if(messageDAO.sendMessage(messageDTO) > 0){
			check = true;
		}
		
		model.addAttribute("check", check);
		return "redirect:messageListForm.pet";
	}
	
	@Transactional
	@RequestMapping("messageDeletePro.pet")
	public String messageDeletePro(MessageDTO messageDTO, Principal principal, Model model) throws Exception{
		System.out.println("messageDeletePro 접근");
		
		// 세션값 가져옴
		String id = principal.getName();
		try{
			if(messageDTO.getMessage_writer() != null && messageDTO.getMessage_writer().equals(id)){
				messageDTO.setMessage_delete_writer("y");
			} else if(messageDTO.getMessage_reader() != null && messageDTO.getMessage_reader().equals(id)){
				messageDTO.setMessage_delete_reader("y");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		boolean check = false;
		MessageDAO messageDAO = sqlSession.getMapper(MessageDAO.class);
		messageDAO.updateMessage(messageDTO);
		
		if(messageDAO.deleteMessage(messageDTO) > 0){
			check = true;
		}
		
		return "redirect:messageListForm.pet";
	}
	
	@ResponseBody
	@RequestMapping("messageOpenUpdateAjax.pet")
	public String messageOpenUpdateAjax(@RequestBody MessageDTO messageDTO) throws Exception{
		System.out.println("messageOpenUpdateAjax 접근");
		
		messageDTO.setMessage_read("y");
		
		boolean check = false;
		MessageDAO messageDAO = sqlSession.getMapper(MessageDAO.class);
		messageDAO.updateMessage(messageDTO);
		
		if(messageDAO.deleteMessage(messageDTO) > 0){
			check = true;
		}
		
		return null;
	}
}
