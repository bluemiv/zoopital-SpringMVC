package com.pet.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pet.model.EmpDAO;
import com.pet.model.EmpDTO;
import com.pet.model.MedicamentDAO;
import com.pet.model.MedicamentDTO;
import com.pet.model.OrderDAO;
import com.pet.model.OrderDTO;

@Controller
@RequestMapping("/order/")
public class OrderController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("orderInfoForm")
	public String orderInfoForm(Principal principal, HttpSession session, Model model) throws Exception{
		System.out.println("orderInfoForm 접근");

		// 현재 로그인 한 아이디의 권한 가져오기
		EmpDTO empDTO = new EmpDTO();
		empDTO.setEmp_code(principal.getName());
		EmpDAO empDAO = sqlSession.getMapper(EmpDAO.class);
		empDTO = empDAO.selectEmpList(empDTO);
		
		// 전체 발주 내역 가져옴
		OrderDAO orderDAO = sqlSession.getMapper(OrderDAO.class);
		OrderDTO orderDTO_input = new OrderDTO();
		orderDTO_input.setStore_code((String)session.getAttribute("session_store_code"));
		orderDTO_input.setEmp_role(empDTO.getEmp_role());
		List<OrderDTO> list = orderDAO.selectAllOfOrder(orderDTO_input);
		
		// jsp로 넘겨줌
		model.addAttribute("list", list);
		return "order/orderInfoForm";
	}
	
	@Transactional
	@RequestMapping("orderCheckPro")
	public String orderCheckPro(OrderDTO orderDTO, MedicamentDTO medicamentDTO, HttpSession session, Model model) throws Exception{
		System.out.println("orderCheckPro 접근");
		
		// 승인여부
		boolean check = false;
		OrderDAO orderDAO = sqlSession.getMapper(OrderDAO.class);
		orderDAO.updateOrder(orderDTO);
		
		// 세부정보 가져옴
		orderDTO = orderDAO.selectDetailOrder(orderDTO);
		
		// 개수 업데이트
		medicamentDTO.setMedicament_name(orderDTO.getOrder_name());
		medicamentDTO.setMedicament_amount(orderDTO.getOrder_amount());
		medicamentDTO.setStore_code((String)session.getAttribute("session_store_code"));
		MedicamentDAO medicamentDAO = sqlSession.getMapper(MedicamentDAO.class);
		if(medicamentDAO.updateAmountOfMedicamentAboutOrder(medicamentDTO) > 0){
			check = true;
		}
		
		model.addAttribute("check", check);
		
		return "order/orderResult";
	}
	
	@RequestMapping("orderDeletePro")
	public String orderDeletePro(OrderDTO orderDTO, Model model) throws Exception{
		System.out.println("orderDeletePro 접근");
		
		// 발주 내역 삭제
		boolean check = false;
		OrderDAO orderDAO = sqlSession.getMapper(OrderDAO.class);
		if(orderDAO.deleteOrder(orderDTO) > 0){
			check = true;
		}
		
		// jsp로 넘겨줌
		model.addAttribute("check", check);
		return "order/orderResult";
	}
	
	@RequestMapping("orderUpdateForm")
	public String orderUpdateForm(OrderDTO orderDTO, Model model) throws Exception{
		System.out.println("orderUpdateForm 접근");
		
		// 세부 내용 가져옴
		OrderDAO orderDAO = sqlSession.getMapper(OrderDAO.class);
		orderDTO = orderDAO.selectDetailOrder(orderDTO);
		
		// 본사 리스트  가져오기
		EmpDAO empDAO = sqlSession.getMapper(EmpDAO.class);
		List<String> order_toList = empDAO.getStoreAll();
		
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
		return "order/orderResult";
	}
}
