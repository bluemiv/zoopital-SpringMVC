package com.pet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	return "/pet/writeForm";	
	}
	
	@RequestMapping("writePro.pet")
	public String writePro(PetDTO dto){
	
		System.out.println(dto.toString());
		PetDAO dao=sqlSession.getMapper(PetDAO.class);
	
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
		System.out.println("pet_code:" + pet_code);
		PetDAO dao=sqlSession.getMapper(PetDAO.class);
		List list=dao.select_code(pet_code);
		model.addAttribute("list", list);
		
		return "/pet/update";
	}
	
	@RequestMapping("updatePro.pet")
	public String updatePro(PetDTO dto){
		PetDAO dao=sqlSession.getMapper(PetDAO.class);
		System.out.println(dto.toString());
		int result = dao.update_pet(dto);
		System.out.println("1");
		System.out.println("result = " + result);
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
		
		System.out.println("search: "+search);
		
		PetDAO dao=sqlSession.getMapper(PetDAO.class);
		
		PetDTO dto=new PetDTO();
		dto.setPet_name(search);
		List list= dao.searchList(dto);
		

		mav.addObject("list", list);
		mav.setViewName("/pet/list");
		return mav;
	}

}
