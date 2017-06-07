package com.pet.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String empListForm(Model model, HttpSession session) throws Exception{
		System.out.println("empListForm 컨트롤러 진입");

		// 세션값 가져오기
		EmpDTO dto = new EmpDTO();
		dto.setStore_code((String)session.getAttribute("session_store_code"));
		
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
	public String empInsertPro(EmpDTO dto, Model model, HttpSession session) throws Exception{
		System.out.println("empInsertPro 컨트롤러 진입");
		
		// 직원 추가
		boolean check = false;
		dto.setStore_code((String)session.getAttribute("session_store_code"));
		EmpDAO EmpDAO = sqlSession.getMapper(EmpDAO.class);
		if(EmpDAO.insertEmp(dto) > 0){
			check = true;
		}
		
		return "redirect:empListForm.pet";
	}
	
	@RequestMapping("empUpdateDeleteForm.pet")
	public String empUpdateDeleteForm(EmpDTO dto, Model model) throws Exception{
		System.out.println("empUpdateDeleteForm 컨트롤러 진입");
		EmpDAO EmpDAO = sqlSession.getMapper(EmpDAO.class);
		
		// 직원 세부 정보 가져옴
		EmpDTO selectEmp = EmpDAO.selectEmpList(dto);
		
		model.addAttribute("selectEmp",selectEmp);
		
		return "/emp/empUpdateDeleteForm";
	}
	
	@RequestMapping("empUpdateDeletePro.pet")
	public String empUpdateDeletePro(EmpDTO dto, String command, Model model){
		System.out.println("empUpdateDeletePro 컨트롤러 진입");
		
		EmpDAO EmpDAO = sqlSession.getMapper(EmpDAO.class);
		boolean check = false;
		if (command.equals("update")) {
			// 수정
			EmpDAO.updateEmp(dto);
			check = true;
		} else if (command.equals("delete")) {
			// 삭제
			EmpDAO.deleteEmp(dto);
			check = true;
		}
		return "redirect:empListForm.pet";
	}

	@ResponseBody
	@RequestMapping("/idConfirmAjax.pet")
	public boolean idConfirmAjax(@RequestBody EmpDTO empDTO){
		EmpDAO empDAO = sqlSession.getMapper(EmpDAO.class);
		System.out.println(empDTO.getEmp_code());

		
		boolean check = false;
		try {
			EmpDTO result_empDTO = empDAO.selectEmpList(empDTO);
			if(result_empDTO.getEmp_code() != null){
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
