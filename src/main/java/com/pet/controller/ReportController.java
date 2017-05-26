package com.pet.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pet.model.ReportDAO;
import com.pet.model.ReportDTO;


@Controller
@RequestMapping("/report/")
public class ReportController {

	//Mybatis
	@Autowired
	private SqlSession sqlSession;
	
	//report 페이지 이동
	@RequestMapping("/report.pet")
	public  ModelAndView report(){	
		ModelAndView mav = new ModelAndView("/report/report");
		System.out.println("보고서 페이지 이동!!!~~~");
		return mav;
	}
	//report 페이지 삽입
	@RequestMapping("/reportPro.pet")
	public ModelAndView reportPro(ReportDTO dto){
		ModelAndView mav = new ModelAndView("redirect:getReportList.pet");
		ReportDAO dao = sqlSession.getMapper(ReportDAO.class);
		dao.reportPro(dto);
		System.out.println("보고서 저장완료");
		return mav;
	}
	
	//report 페이지 리스트 보여주기
	@RequestMapping("/getReportList.pet")
	public ModelAndView getReportList(ReportDTO dto){
		ModelAndView mav = new ModelAndView("/report/reportList");
	    ReportDAO dao = sqlSession.getMapper(ReportDAO.class);
	    List getReportList = dao.getReportList(dto);
		mav.addObject("reportList",getReportList);
		
		return mav;
	}
}
