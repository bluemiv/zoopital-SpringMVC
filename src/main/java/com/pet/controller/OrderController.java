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
	
	@RequestMapping("orderDeletePro")
	public String orderDeletePro(Principal principal, OrderDTO orderDTO, Model model) throws Exception{
		System.out.println("orderDeletePro 접근");
		
		// 발주 내역 삭제
		boolean check = false;
		OrderDAO orderDAO = sqlSession.getMapper(OrderDAO.class);
		if(orderDAO.deleteOrder(orderDTO) > 0){
			check = true;
		}
		
		// jsp로 넘겨줌
		model.addAttribute("check", check);
		return "redirect:orderInfoForm.pet";
	}
	
	@RequestMapping("orderUpdateForm")
	public String orderUpdateForm(OrderDTO orderDTO, Model model) throws Exception{
		System.out.println("orderUpdateForm 접근");
		
		// 세부 내용 가져옴
		OrderDAO orderDAO = sqlSession.getMapper(OrderDAO.class);
		orderDTO = orderDAO.selectDetailOrder(orderDTO);
		
		// 본사 리스트  가져오기
		StoreDAO storeDAO = sqlSession.getMapper(StoreDAO.class);
		List<String> order_toList = storeDAO.getStoreRole();
		
		model.addAttribute("orderDTO", orderDTO);
		model.addAttribute("order_toList", order_toList);
		return "order/orderUpdateForm";
	}
	
	@RequestMapping("orderUpdatePro")
	public String orderUpdatePro(OrderDTO orderDTO, Model model) throws Exception{
		System.out.println("orderUpdatePro 접근");
		
		// 리스트 업데이트
		OrderDAO orderDAO = sqlSession.getMapper(OrderDAO.class);
		boolean check = false;
		if(orderDAO.updateOrder(orderDTO) > 0) {
			check = true;
		}
		
		model.addAttribute("check", check);
		return "redirect:orderInfoForm.pet";
	}
}
