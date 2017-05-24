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

@Controller
@RequestMapping("/emp/")
public class EmpController {
	Principal principal;
	
	@Autowired
	SqlSession sqlSession;
	
	// 직원 목록 모두 띄워주기
	@RequestMapping("empListForm.pet")
	public String empListForm(Model model ) {
		System.out.println("empListForm 컨트롤러 진입");
		
		EmpDTO empDTO = new EmpDTO();
//		empDTO.setStore_code(principal.getName());
		empDTO.setStore_code("pankyo");
		

		EmpDAO EmpDAO = sqlSession.getMapper(EmpDAO.class);
		List<EmpDTO> empList = EmpDAO.getEmpList(empDTO);
		model.addAttribute("emplist", empList);

		return "/emp/empListForm";
	}
	
	@RequestMapping("empInsertForm.pet")
	public String empInsertForm(Model model){
		System.out.println("empInsertForm 컨트롤러 진입");
		
		//
		return "/emp/empInsertForm";
	}
	
	@RequestMapping("empInsertpro.pet")
	public String empInsertPro(EmpDTO dto){		
		System.out.println(dto.toString());
		System.out.println("empInsertPro 컨트롤러 진입");
		EmpDAO EmpDAO = sqlSession.getMapper(EmpDAO.class);
		EmpDAO.insertEmp(dto);
		
		return "redirect:empListForm.pet";
	}
	
	@RequestMapping("empUpdateDeleteForm.pet")
	public String empUpdateDeleteForm(EmpDTO dto, Model model){
		System.out.println("empUpdateDeleteForm 컨트롤러 진입");
		EmpDAO EmpDAO = sqlSession.getMapper(EmpDAO.class);
		
		
		List<EmpDTO> selectEmpList = EmpDAO.selectEmpList(dto);
		
		
		model.addAttribute("selectEmpList",selectEmpList);
		
		return "/emp/empUpdateDeleteForm";
	}
	
	@RequestMapping("empUpdateDeletePro.pet")
	public String empUpdateDeletePro(HttpServletRequest request, EmpDTO dto, String command){
		System.out.println("empUpdateDeletePro 컨트롤러 진입");
		System.out.println("command: "+command);
		EmpDAO EmpDAO = sqlSession.getMapper(EmpDAO.class);
		System.out.println(dto.toString());
		
		if (command.equals("update")) {
			EmpDAO.updateEmp(dto);
		} else if (command.equals("delete")) {
			EmpDAO.deleteEmp(dto);
		}

		return "redirect:empListForm.pet";
	}

}
