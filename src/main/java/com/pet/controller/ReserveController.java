package com.pet.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pet.model.EmpDAO;
import com.pet.model.EmpDTO;
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
	public String reserveInsertForm(Principal principal, Model model){
		System.out.println("reserveListForm 컨트롤러 진입");
		
		EmpDTO dto = new EmpDTO();
		dto.setStore_code(principal.getName());
		EmpDAO empDAO = sqlSession.getMapper(EmpDAO.class);
		List<EmpDTO> empList = empDAO.getEmpList(dto);
		
		model.addAttribute("empList", empList);
		
		return "/reserve/reserveInsertForm";
	}
	
	@RequestMapping("/reserveInsertForm2.pet")
	public String reserveInsertForm2(HttpServletRequest request, Principal principal, Model model){
		System.out.println("reserveListForm2 컨트롤러 진입");
		System.out.println(request.getParameter("emp_name"));
		
		request.getParameter("emp_name");
		EmpDAO empDAO = sqlSession.getMapper(EmpDAO.class);
		
//		List<EmpDTO> empList = empDAO.getEmpList();
		
		//가능한 시간만 리스트형태로 저장해서 넘기기
//		List timeList = 
				
		
		return "/reserve/reserveInsertForm2";
	}
	
	
	
	@RequestMapping("/reserveInsertPro.pet")
	public String reserveInsertPro(ReserveDTO dto, Principal principal){
		System.out.println("reserveInsertPro 컨트롤러 진입");		
		System.out.println(dto.toString());		
		
		/*ReserveDAO reserveDAO = sqlSession.getMapper(ReserveDAO.class);

		dto.setStore_code(principal.getName());	
		reserveDAO.insertReserve(dto);*/
		
		return "/reserve/reserveInsertPro";
	
	}
	
}
