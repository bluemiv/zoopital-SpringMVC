package com.pet.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pet.model.PetDAO;
import com.pet.model.PetDTO;

@Controller
@RequestMapping("/pet/")
public class PetController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("writeForm.pet")
	public String writeForm(){
		System.out.println("writeForm 접근");
		return "/pet/writeForm";	
	}
	
	@RequestMapping("writePro.pet")

	public String writePro(PetDTO dto, Principal principal) throws Exception{
		System.out.println("writePro 접근");

		// 세션 값 가져옴
		dto.setStore_code(principal.getName());

		// 정보 등록
		boolean check = false;
		PetDAO dao = sqlSession.getMapper(PetDAO.class);
		if(dao.insert_pet(dto) > 0){
			check = true;
		}
		System.out.println("등록 여부 : " + check);
		

		return "redirect:list.pet";
	}
	
	@RequestMapping("list.pet")
	public String list(Model model) throws Exception{
		PetDAO dao=sqlSession.getMapper(PetDAO.class);
		
		List list= dao.list_pet();
		model.addAttribute("list", list);
		
		return "/pet/list";
	}
	
	@RequestMapping("updateForm.pet")
	public String updateForm(PetDTO petDTO, Model model) throws Exception{
		
		PetDAO dao = sqlSession.getMapper(PetDAO.class);
		petDTO = dao.select_code(petDTO);
		model.addAttribute("petDTO", petDTO);
		
		return "/pet/update";
	}
	
	@RequestMapping("updatePro.pet")
	public String updatePro(PetDTO dto, Principal principal) throws Exception{
		
		// 세션 값 가져옴
		dto.setStore_code(principal.getName());
		
		// 수정
		PetDAO dao=sqlSession.getMapper(PetDAO.class);
		boolean check = false;
		if(dao.update_pet(dto) > 0){
			check = true;
		}
		System.out.println("수정 여부 : " + check);
		
		return "redirect:list.pet";
	}
	
	@RequestMapping("delete.pet")
	public String delete(PetDTO petDTO) throws Exception{
		System.out.println("delete 접근");
		
		// 삭제
		boolean check = false;
		PetDAO dao = sqlSession.getMapper(PetDAO.class);
		if( dao.delete_pet(petDTO) > 0){
			check = true;
		}
		System.out.println("삭제 여부 : " + check);
		
		return "redirect:list.pet";
		
	}
	
	@RequestMapping("search.pet")
	public ModelAndView search(HttpServletRequest request) throws Exception{
		ModelAndView mav= new ModelAndView();
		String search=request.getParameter("search");
		
		PetDAO dao=sqlSession.getMapper(PetDAO.class);
		
		PetDTO dto=new PetDTO();
		dto.setPet_name(search);
		List list= dao.searchList(dto);

		mav.addObject("list", list);
		mav.setViewName("/pet/list");
		return mav;
	}
	
	@RequestMapping("petDetailForm.pet")
	public String petDetailForm(PetDTO petDTO, Model model) throws Exception{
		System.out.println("petDetailForm 접근");
		
		// 세부 정보 가져옴
		PetDAO dao = sqlSession.getMapper(PetDAO.class);
		petDTO = dao.select_code(petDTO);
		
		model.addAttribute("petDTO", petDTO);
		
		return "/pet/petDetailForm";
	}
	

}
