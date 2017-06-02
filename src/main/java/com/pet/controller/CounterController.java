package com.pet.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pet.model.CounterDAO;
import com.pet.model.CounterDTO;
import com.pet.model.PetDAO;
import com.pet.model.PetDTO;

@Controller
@RequestMapping("/counter/")
public class CounterController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("list.pet")
	public String list(Model model, HttpSession session) throws Exception{
		CounterDAO counterDAO = sqlSession.getMapper(CounterDAO.class);
		String store_code = (String)session.getAttribute("session_store_code");
		
		List<PetDTO> list= counterDAO.getListAll(store_code);
		
		model.addAttribute("plist", list);
		
		return "/counter/counterPetList";
	}
	
	@RequestMapping("search.pet")
	public String search(String search, Model model) throws Exception{
		CounterDAO counterDAO = sqlSession.getMapper(CounterDAO.class);
		PetDTO dto=new PetDTO();
		dto.setPet_name(search);
		List<PetDTO> list= counterDAO.searchList(dto);
		model.addAttribute("list", list);
		
		return "/counter/counterPetList";
	}
	
	@RequestMapping("accept.pet")
	public String accept(int pet_code, Model model) throws Exception{
		CounterDAO counterDAO = sqlSession.getMapper(CounterDAO.class);
		PetDTO petDTO = new PetDTO();
		petDTO = counterDAO.getPetInfo(pet_code);
		model.addAttribute("pdto", petDTO);
		return "/counter/counterAcceptForm";
	}
	@RequestMapping("insertAccept.pet")
	public String insertAccept(CounterDTO counterDTO, Model model, HttpSession session) throws Exception{
		CounterDAO counterDAO = sqlSession.getMapper(CounterDAO.class);
		counterDTO.setStore_code((String)session.getAttribute("session_store_code"));
		counterDAO.insertAccept(counterDTO);
		return "redirect:/home.pet";
	}
	@RequestMapping("waitingList.pet")
	public String getListWaiting(HttpSession session, Model model) throws Exception{
		CounterDAO counterDAO = sqlSession.getMapper(CounterDAO.class);
		String store_code = (String)session.getAttribute("session_store_code");
		List<CounterDTO> clist = counterDAO.getListWaiting(store_code);
		model.addAttribute("clist", clist);
		return "/counter/counterAcceptView";
	}
}
