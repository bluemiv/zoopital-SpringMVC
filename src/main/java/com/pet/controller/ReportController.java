package com.pet.controller;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pet.model.EmpDAO;
import com.pet.model.EmpDTO;
import com.pet.model.ReportDAO;
import com.pet.model.ReportDTO;
import com.pet.model.StoreDAO;


@Controller
@RequestMapping("/report/")
public class ReportController {

	//Mybatis
	@Autowired
	private SqlSession sqlSession;
	
	// 보고서 쓰기
	@RequestMapping("/reportInsert.pet")
	public  ModelAndView report() throws Exception{	
		System.out.println("보고서 쓰기");
		ModelAndView mav = new ModelAndView("/report/reportInsert");
		
	    // 본사 리스트  가져오기
 		EmpDAO empDAO = sqlSession.getMapper(EmpDAO.class);
 		List<EmpDTO> empFullList = empDAO.getEmpFullTimeInfo();
 		mav.addObject("empFullList", empFullList);
 		 
		return mav;
	}
	
	//report 페이지 삽입
	@RequestMapping("/reportPro.pet")
	public ModelAndView reportPro(ReportDTO dto, Principal principal) throws Exception{
		System.out.println("reportPro 접근");
		
		dto.setReport_check("fail");
		dto.setReport_writer(principal.getName());
		
		ModelAndView mav = new ModelAndView("redirect:getReportList.pet");
		ReportDAO dao = sqlSession.getMapper(ReportDAO.class);
		dao.insertReport(dto);
		
		System.out.println("보고서 저장완료");
		return mav;
	}
	
	//report 페이지 리스트 보여주기
	@RequestMapping("/getReportList.pet")
	public ModelAndView getReportList(ReportDTO dto, Principal principal) throws Exception{
		
		// 전체 리스트 가져오기
		dto.setReport_writer(principal.getName());
		ModelAndView mav = new ModelAndView("/report/reportList");
	    ReportDAO dao = sqlSession.getMapper(ReportDAO.class);
	    List getReportList = dao.getReportList(dto);
	    
	    mav.addObject("reportList",getReportList);
		
		return mav;
	}
	
	@RequestMapping("checkReport.pet")
	public String checkReport(Model model, ReportDTO reportDTO) throws Exception {
		System.out.println("checkReport 접근");
		
		boolean check = false;
		ReportDAO reportDAO = sqlSession.getMapper(ReportDAO.class);
		if(reportDAO.checkReport(reportDTO) > 0 ){
			check = true;
		}
		
		model.addAttribute("check", check);
		
		return "redirect:getReportList.pet";
	}
	

	// 보고서 수정 Form
	@RequestMapping("/updateReportForm.pet")
	public String updateReportForm(ReportDTO reportDTO, Principal principal, Model model) throws Exception{
		System.out.println("updateReportForm 접근");
		
		// 자세한 정보 가져오기
		reportDTO.setReport_writer(principal.getName());
		ReportDAO reportDAO = sqlSession.getMapper(ReportDAO.class);
		reportDTO = reportDAO.getReportDetail(reportDTO);
		
		// 본사 리스트  가져오기
 		EmpDAO empDAO = sqlSession.getMapper(EmpDAO.class);
 		List<EmpDTO> empFullList = empDAO.getEmpFullTimeInfo();
		 		
		model.addAttribute("empFullList", empFullList);
		model.addAttribute("reportDTO", reportDTO);
		
		return "/report/reportUpdateForm";
	}
	
	// 보고서 수정 Pro
	@RequestMapping("/updateReportPro.pet")
	public String updateReport(ReportDTO reportDTO, Principal principal, Model model) throws Exception{
		System.out.println("updateReport 접근");
		
		boolean check = false;
		reportDTO.setReport_writer(principal.getName());
		ReportDAO reportDAO = sqlSession.getMapper(ReportDAO.class);
		if(reportDAO.updateReport(reportDTO) > 0 ){
			check = true;
		}
		
		model.addAttribute("check", check);
		return "redirect:getReportList.pet";
	}
	
	// 보고서 삭제
	@RequestMapping("/deleteReport.pet")
	public String deleteReport(ReportDTO reportDTO, Principal principal, Model model) throws Exception{
		System.out.println("deleteReport 접근");
		
		boolean check = false;
		reportDTO.setReport_writer(principal.getName());
		ReportDAO reportDAO = sqlSession.getMapper(ReportDAO.class);
		if(reportDAO.deleteReport(reportDTO) > 0 ){
			check = true;
		}
		
		model.addAttribute("check", check);
		return "redirect:getReportList.pet";
	}
}
