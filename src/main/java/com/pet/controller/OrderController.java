package com.pet.controller;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pet.model.OrderDAO;
import com.pet.model.OrderDTO;
import com.pet.model.StoreDAO;
import com.pet.model.StoreDTO;

@Controller
@RequestMapping("/order/")
public class OrderController {

	@Autowired
	SqlSession sqlSession;
	
	// 수정 필요
	@RequestMapping("orderInfoForm")
	public String orderInfoForm(Principal principal, Model model) throws Exception{
		System.out.println("orderInfoForm 접근");
		
		// 전체 발주 내역 가져옴
		OrderDAO orderDAO = sqlSession.getMapper(OrderDAO.class);
		OrderDTO orderDTO_input = new OrderDTO();
		orderDTO_input.setStore_code(principal.getName());
		List<OrderDTO> list = orderDAO.selectAllOfOrder(orderDTO_input);
		
		// jsp로 넘겨줌
		model.addAttribute("list", list);
		return "order/orderInfoForm";
	}
	
	@RequestMapping("orderCheckPro")
	public String orderCheckPro(OrderDTO orderDTO) throws Exception{
		System.out.println("orderCheckPro 접근");
		
		// 승인여부
		boolean check = false;
		OrderDAO orderDAO = sqlSession.getMapper(OrderDAO.class);
		if(orderDAO.updateOrder(orderDTO) > 0){
			check = true;
		}
		System.out.println(check);
		
		return "redirect:orderInfoForm.pet";
	}
}
