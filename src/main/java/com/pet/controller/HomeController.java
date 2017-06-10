package com.pet.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pet.model.EmpDAO;
import com.pet.model.EmpDTO;
import com.pet.model.NoticeDAO;
import com.pet.model.NoticeDTO;

@Controller
public class HomeController {

	@Autowired
	SqlSession sqlSession;
	
	// 기본 홈 화면
	@RequestMapping("/home.pet")
	public String home() throws Exception{
		System.out.println("home 접근");
		return "home";
	}
	
	// 로그인
	@RequestMapping("loginForm.pet")
	public String loginForm() {
		System.out.println("loginForm 접근");
		return "loginForm";
	}
	
	// 권한 거부 에러 페이지
	@RequestMapping("accessDeniedPage.pet")
	public String accessDeniedPage(Principal principal){
		System.out.println(principal.getName() + " 접근 거부");
		return "accessDeniedPage";
	}
	
	@ResponseBody
	@RequestMapping("naverSearchKeyWord.pet")
	public List<String> naverSearchKeyWord() throws Exception{
		// 네이버 실시간 검색어 (파싱이용)
		String target = "https://www.naver.com/";
		HttpURLConnection con = (HttpURLConnection) new URL(target).openConnection();
		BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		String temp;
		List<String> naverSearchList = new ArrayList<String>();
		int count = 0;
		while((temp = br.readLine()) != null){
			// 1위부터 10위까지 검색어
			if(temp.contains("class=\"ah_k\"")){
				naverSearchList.add(temp.split("class=\"ah_k\">")[1].split("</span>")[0]);
				count++;
				if(count == 10){
					break;
				}
			}
		}
		
		return naverSearchList;
	}
	@ResponseBody
	@RequestMapping("homeNoticeSelectAll.pet")
	public List<NoticeDTO> homeNoticeSelectAll(HttpSession session) throws Exception{
		
		// 세션 값 가져옴 (지점 코드)
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setStore_code((String)session.getAttribute("session_store_code"));
		// 모든 공지사항 리스트 가져옴
		NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
		List<NoticeDTO> list = noticeDAO.selectAllList(noticeDTO);
		
		return list;
	}
	
	// 클라이언트 웹 화면
	@RequestMapping("/webHome.pet")
	public String webHome() throws Exception{
		System.out.println("webHome 접근");
		
		return "webHome";
	}
	
	// 로그인 성공
	@RequestMapping("/loginSuccess.pet")
	public String loginSuccess(Principal principal, HttpSession session) throws Exception{
		System.out.println("loginSuccess 접근");
		
		// 세션 아이디 값 가져옴
		EmpDTO empDTO = new EmpDTO();
		empDTO.setEmp_code(principal.getName());
		try{
			// 세션 아이디 정보 가져옴 (store_code)
			EmpDAO empDAO = sqlSession.getMapper(EmpDAO.class);
			empDTO = empDAO.selectEmpList(empDTO);
			// 현재 접속자의 store_code(지점명) 세션값에 설정
			session.setAttribute("session_store_code", empDTO.getStore_code());
		}catch (Exception e) {
			System.out.println("client 접속");
		}
		return "loginSuccess";
	}
}
