package com.pet.controller;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pet.model.EmpDAO;
import com.pet.model.EmpDTO;
import com.pet.model.StoreDAO;
import com.pet.model.StoreDTO;

@Controller
@RequestMapping("/emp/")
public class EmpController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("empListForm.pet")
	public String empListForm(Model model, Principal principal) throws Exception{
		System.out.println("empListForm 컨트롤러 진입");

		// 세션값 가져오기
		EmpDTO dto = new EmpDTO();
		dto.setStore_code(principal.getName());
		
		// 직원 목록 모두 띄워주기
		EmpDAO EmpDAO = sqlSession.getMapper(EmpDAO.class);
		List<EmpDTO> empList = EmpDAO.getEmpList(dto);
		model.addAttribute("emplist", empList);
		
		return "/emp/empListForm";
	}
	
	@RequestMapping("empInsertForm.pet")
	public String empInsertForm(Model model){
		System.out.println("empInsertForm 컨트롤러 진입");
		return "/emp/empInsertForm";
	}
	
	@RequestMapping("empInsertpro.pet")
	public String empInsertPro(EmpDTO dto, Model model, Principal principal) throws Exception{
		System.out.println("empInsertPro 컨트롤러 진입");
		
		// 직원 추가
		boolean check = false;
		dto.setStore_code(principal.getName());
		EmpDAO EmpDAO = sqlSession.getMapper(EmpDAO.class);
		if(EmpDAO.insertEmp(dto) > 0){
			check = true;
		}
		
		model.addAttribute("check", check);
		return "redirect:empListForm.pet";
	}
	
	@RequestMapping("empUpdateDeleteForm.pet")
	public String empUpdateDeleteForm(EmpDTO dto, Model model) throws Exception{
		System.out.println("empUpdateDeleteForm 컨트롤러 진입");
		EmpDAO EmpDAO = sqlSession.getMapper(EmpDAO.class);
		
		// 직원 세부 저보 가져옴
		EmpDTO selectEmp = EmpDAO.selectEmpList(dto);
		
		// 모든 지점 코드 가져오기
		StoreDAO storeDAO = sqlSession.getMapper(StoreDAO.class);
		List<StoreDTO> selectAllStoreCode = storeDAO.selectAllStoreCode();
		
		model.addAttribute("storeCodeList", selectAllStoreCode);
		model.addAttribute("selectEmp",selectEmp);
		
		return "/emp/empUpdateDeleteForm";
	}
	
	@RequestMapping("empUpdateDeletePro.pet")
	public String empUpdateDeletePro(EmpDTO dto, String command, Model model){
		System.out.println("empUpdateDeletePro 컨트롤러 진입");
		
		EmpDAO EmpDAO = sqlSession.getMapper(EmpDAO.class);

		boolean check = false;
		if (command.equals("update")) {
			EmpDAO.updateEmp(dto);
			check = true;
		} else if (command.equals("delete")) {
			EmpDAO.deleteEmp(dto);
			check = true;
		}

		model.addAttribute("check", check);
		return "redirect:empListForm.pet";
	}

}
