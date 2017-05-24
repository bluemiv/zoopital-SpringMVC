package com.pet.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

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
	public String medicamentListForm(MedicamentDTO medicamentDTO, Model model, Principal principal) throws Exception{
		System.out.println("medicamentListForm 접근");
		
		medicamentDTO.setStore_code(principal.getName()); // 세션 아이디 가져옴
		
		// 페이징 처리0
		MedicamentDAO medicamentDAO = sqlSession.getMapper(MedicamentDAO.class);
		int totalCount = medicamentDAO.getTotalCountOfMedicament(medicamentDTO);
		final int pageSize = 5;
		if(medicamentDTO.getPageNum() == 0){
			medicamentDTO.setPageNum(1); // default 값
		}
		medicamentDTO.setStartNum(pageSize * (medicamentDTO.getPageNum() - 1) + 1);
		medicamentDTO.setEndNum(pageSize * medicamentDTO.getPageNum());
		// 전체 페이지  개수
		if(totalCount % pageSize == 0){
			// 정확히 나누어 떨어짐
			medicamentDTO.setPageTotalNum(totalCount / pageSize);
		} else {
			medicamentDTO.setPageTotalNum(1 + totalCount / pageSize);
		}
		
		// 모든 약품 리스트 가져옴
		List<MedicamentDTO> list = medicamentDAO.selectAll(medicamentDTO);
		
		model.addAttribute("list", list);
		model.addAttribute("page", medicamentDTO);
		return "/medicament/medicamentListForm";
	} // 약품 리스트 출력
	
	
	@RequestMapping("medicamentInsertForm.pet")
	public String medicamentInsertForm() throws Exception{
		System.out.println("medicamentInsertForm 접근");
		return "/medicament/medicamentInsertForm";
	} // 약품 추가 Form
	
	
	@RequestMapping("medicamentInsertPro.pet")
	public String medicamentInsertPro(MedicamentDTO medicamentDTO, Model model, Principal principal) throws Exception{
		System.out.println("medicamentInsertPro 접근");

		// 세션 아이디 가져옴
		medicamentDTO.setStore_code(principal.getName());
		
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
	public String medicamentUpdatePro(MedicamentDTO medicamentDTO,  Model model) throws Exception{
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
		
		// 지점 코드 가져오기
		List<String> storeList = medicamentDAO.getMedicamentStore_code();
		
		model.addAttribute("medicamentDTO",medicamentDTO);
		model.addAttribute("storeList",storeList);
		return "/medicament/medicamentDetailForm";
	} // 약품 세부정보 Form
	
	/////////////////////////////////////////////
	//////////////////// AJAX ///////////////////
	/////////////////////////////////////////////
	@ResponseBody
	@RequestMapping("medicamentSearchAjax.pet")
	public List medicamentPreViewAjax(@RequestBody String search, Principal principal) throws Exception{
		StringTokenizer tokenizer = new StringTokenizer(search, "=");
		while(tokenizer.hasMoreTokens()){
			search = tokenizer.nextToken();
		}
		
		MedicamentDTO medicamentDTO = new MedicamentDTO();
		medicamentDTO.setSearch(search);
		medicamentDTO.setStore_code(principal.getName());
		
		MedicamentDAO dao = sqlSession.getMapper(MedicamentDAO.class);
		List<MedicamentDTO> listAll = dao.selectAll(medicamentDTO);
		ArrayList<String> list = new ArrayList<String>();
		for(int i = 0; i < listAll.size(); i++){
			list.add(listAll.get(i).getMedicament_name());
		}
		
		return list;
	} // 검색 추천 기능
}
