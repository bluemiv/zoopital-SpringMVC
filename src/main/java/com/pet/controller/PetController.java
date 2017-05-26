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
	public String writePro(PetDTO dto, Principal principal){
		System.out.println("writePro 접근");
		System.out.println(principal.getName());
		dto.setStore_code(principal.getName());
		
		PetDAO dao = sqlSession.getMapper(PetDAO.class);
		
		dao.insert_pet(dto);
		return "redirect:list.pet";
	}
	
	@RequestMapping("list.pet")
	public String list(Model model){
		PetDAO dao=sqlSession.getMapper(PetDAO.class);
		
		List list= dao.list_pet();
		model.addAttribute("list", list);
		
		return "/pet/list";
	}
	
	@RequestMapping("updateForm.pet")
	public String updateForm(HttpServletRequest request, Model model){
		
		int pet_code=Integer.parseInt(request.getParameter("pet_code"));
		
		PetDAO dao=sqlSession.getMapper(PetDAO.class);
		List list=dao.select_code(pet_code);
		model.addAttribute("list", list);
		
		return "/pet/update";
	}
	
	@RequestMapping("updatePro.pet")
	public String updatePro(PetDTO dto){
		PetDAO dao=sqlSession.getMapper(PetDAO.class);
		
		int result = dao.update_pet(dto);
		return "redirect:list.pet";
	}
	
	@RequestMapping("delete.pet")
	public String delete(HttpServletRequest request){
		int pet_code=Integer.parseInt(request.getParameter("pet_code"));
		PetDAO dao=sqlSession.getMapper(PetDAO.class);
		
		dao.delete_pet(pet_code);
		return "redirect:list.pet";
		
	}
	
	@RequestMapping("search.pet")
	public ModelAndView search(HttpServletRequest request){
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

}
