package com.pet.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pet.model.EmpDAO;
import com.pet.model.EmpDTO;

@Controller
public class HomeController {

	@Autowired
	SqlSession sqlSession;
	
	// 기본 홈 화면
	@RequestMapping("/home.pet")
	public String home(Principal principal, HttpSession session,Model model) {
		
		// 세션 아이디 값 가져옴
		EmpDTO empDTO = new EmpDTO();
		empDTO.setEmp_code(principal.getName());
		// 세션 아이디 정보 가져옴 (store_code)
		EmpDAO empDAO = sqlSession.getMapper(EmpDAO.class);
		empDTO = empDAO.selectEmpList(empDTO);
		// 현재 접속자의 store_code(지점명) 세션값에 설정
		session.setAttribute("session_store_code", empDTO.getStore_code());
		
		return "home";
	}
	
	// 로그인
	@RequestMapping("loginForm.pet")
	public String loginForm() {
		
		return "loginForm";
	}
	
	// 권한 거부 에러 페이지
	@RequestMapping("accessDeniedPage.pet")
	public String accessDeniedPage(Principal principal){
		System.out.println(principal.getName() + " 접근 거부");
		return "accessDeniedPage";
	}
	
}
