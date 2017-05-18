package com.pet.controller;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pet.model.MedicamentDAO;
import com.pet.model.MedicamentDTO;

@Controller
@RequestMapping("/medicament/")
public class MedicamentController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("medicamentListForm.pet")
	public String medicamentListForm(MedicamentDTO medicamentDTO, Model model) throws Exception{
		System.out.println("medicamentListForm 접근");
		
		MedicamentDAO medicamentDAO = sqlSession.getMapper(MedicamentDAO.class);
		List<MedicamentDTO> list = medicamentDAO.selectAll(medicamentDTO); // 모든 약품 리스트 가져옴
		
		model.addAttribute("list", list);
		return "/medicament/medicamentListForm";
	} // 약품 리스트 출력
	
	
	@RequestMapping("medicamentInsertForm.pet")
	public String medicamentInsertForm() throws Exception{
		System.out.println("medicamentInsertForm 접근");
		return "/medicament/medicamentInsertForm";
	} // 약품 추가 Form
	
	
	@RequestMapping("medicamentInsertPro.pet")
	public String medicamentInsertPro(MedicamentDTO medicamentDTO, String exdate, String mandate, Model model) throws Exception{
		System.out.println("medicamentInsertPro 접근");

		// 날짜 Date 형변환
		medicamentDTO.setMedicament_exdate(Date.valueOf(exdate));
		medicamentDTO.setMedicament_mandate(Date.valueOf(mandate));
		
		// 약품 추가
		boolean check = false;
		MedicamentDAO medicamentDAO = sqlSession.getMapper(MedicamentDAO.class);
		if(medicamentDAO.insertMedicament(medicamentDTO) > 0){
			// 성공적으로 약품 추가 됨
			check = true;
		}
		
		model.addAttribute("check", check);
		
		return "/medicament/medicamentInsertPro";
	} // 약품 추가 Pro
	
	
	@RequestMapping("medicamentUpdateForm.pet")
	public String medicamentUpdateForm(MedicamentDTO medicamentDTO, Model model) throws Exception{
		System.out.println("medicamentUpdateForm 접근");
		MedicamentDAO medicamentDAO = sqlSession.getMapper(MedicamentDAO.class);
		MedicamentDTO detail_medicamentDTO = medicamentDAO.getMedicament(medicamentDTO); // 약품 정보 가져옴
		model.addAttribute("medicamentDTO",detail_medicamentDTO);
		return "/medicament/medicamentUpdateForm";
	} // 약품 수정 Form
	
	
	@RequestMapping("medicamentUpdatePro.pet")
	public String medicamentUpdatePro(MedicamentDTO medicamentDTO, String exdate, String mandate, Model model) throws Exception{
		System.out.println("medicamentUpdatePro 접근");
		
		// 정보 수정
		boolean check = false;
		MedicamentDAO medicamentDAO = sqlSession.getMapper(MedicamentDAO.class);
		if(medicamentDAO.updateMedicament(medicamentDTO) > 0){
			// 수정 완료
			check = true;
		}
		model.addAttribute("check",check);
		return "/medicament/medicamentUpdatePro";
	} // 약품 수정 Pro
	
	
	@RequestMapping("medicamentDeletePro.pet")
	public String medicamentDeletePro(MedicamentDTO medicamentDTO, Model model) throws Exception{
		System.out.println("medicamentDeletePro 접근");
		
		// 약품 삭제
		boolean check = false;
		MedicamentDAO medicamentDAO = sqlSession.getMapper(MedicamentDAO.class);
		if(medicamentDAO.deleteMedicament(medicamentDTO) > 0){
			// 삭제 완료
			check = true;
		}
		model.addAttribute("check",check);
		return "/medicament/medicamentDeletePro";
	} // 약품 삭제 Form
	
	
	@RequestMapping("medicamentDetailForm.pet")
	public String medicamentDetailForm(MedicamentDTO medicamentDTO, Model model) throws Exception{
		System.out.println("medicamentDetailForm 접근");
		
		// 자세한 정보 가져오기
		MedicamentDAO medicamentDAO = sqlSession.getMapper(MedicamentDAO.class);
		medicamentDTO = medicamentDAO.getMedicament(medicamentDTO);
		
		model.addAttribute("medicamentDTO",medicamentDTO);
		return "/medicament/medicamentDetailForm";
	} // 약품 세부정보 Form
	
	
	@RequestMapping("medicamentSell.pet")
	public String medicamentSell(MedicamentDTO medicamentDTO, int sellNum) throws Exception{
		System.out.println("medicamentSell 접근");
		
		// 약품 개수 감소
		MedicamentDAO medicamentDAO = sqlSession.getMapper(MedicamentDAO.class);
		medicamentDTO.setMedicament_amount(medicamentDTO.getMedicament_amount() - sellNum); // 전체수량 - 판매수량
		medicamentDAO.updateMedicament(medicamentDTO);

		return "redirect:medicamentDetailForm.pet?medicament_code="+medicamentDTO.getMedicament_code();
	} // 약품 개수 수정
	
	/////////////////////////////////////////////
	//////////////////// AJAX ///////////////////
	/////////////////////////////////////////////
	@ResponseBody
	@RequestMapping("medicamentSellAjax.pet")
	public MedicamentDTO medicamentSellAjax(@RequestBody MedicamentDTO medicamentDTO) throws Exception{
		int cost = medicamentDTO.getMedicament_cost() * medicamentDTO.getMedicament_amount();
		medicamentDTO.setMedicament_cost(cost);
		return medicamentDTO;
	}
	
	
}
