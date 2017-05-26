package com.pet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pet.model.ShotDAO;
import com.pet.model.ShotDTO;

@Controller
@RequestMapping("/shot/")
public class ShotController {
	@Autowired
	SqlSession sqlSession;
	
	
	@RequestMapping("shotListForm.pet")
	public String listForm(){
		
		return "shotListForm";
	}
	
	
	@RequestMapping("vaccination.pet")
	public ModelAndView detailList(HttpServletRequest request, ShotDTO dto){
		ModelAndView mav= new ModelAndView();
		ShotDAO dao=sqlSession.getMapper(ShotDAO.class);
		int pet_code=Integer.parseInt(request.getParameter("pet_code"));

		dto.setPet_code(pet_code);
		
		System.out.println("pet_code: "+ pet_code);
		
		List list= dao.detailList();
		mav.addObject("list", list);
		mav.setViewName("/shot/shotList");
		return mav;
	}
	
	@RequestMapping("todayList.pet")
	public ModelAndView listToday(HttpServletRequest request, ShotDTO dto){
		ModelAndView mav= new ModelAndView();
/*		ShotDAO dao=sqlSession.getMapper(ShotDAO.class);
		
		List list= dao.todayList();
		mav.addObject("list", list);*/
		mav.setViewName("/shot/listToday");
		return mav;
	}
	
	
	
}
