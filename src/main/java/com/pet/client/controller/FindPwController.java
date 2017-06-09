package com.pet.client.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pet.client.model.ClientDAO;
import com.pet.client.model.ClientDTO;

@Controller
@RequestMapping("/find/")
public class FindPwController {
	
	@Autowired
	SqlSession sqlSession;
	
	/*비번찾기 창 팝업형태로 띄울 때 사용하는 컨트롤러*/
	@RequestMapping("pwSearchForm.pet")
	public String pwSearchForm(){
		System.out.println("비번찾기 창");
		return "/client/client/pwSearchForm";
	}
	
	
	//질문에 대한 답변인지 비교하는!
	@RequestMapping("pw_searchPro.pet")
	public String pwSearchPro(ClientDTO clientDTO, Model model) throws Exception{
		System.out.println("pwSearchPro 컨트롤러 실행");
		ClientDAO clientDAO = sqlSession.getMapper(ClientDAO.class);	
		
		int result = clientDAO.checkAnswer(clientDTO);
		if(result==1){//비번질문과 답변이 일치한다면?
			//10자리 임시 비밀번호 생성해서 업데이트
			String change_pw = RandomStringUtils.randomAlphanumeric(10);
			HashMap<String, Object> map = new HashMap<>();
			map.put("change_pw", change_pw);
			map.put("client_id", clientDTO.getClient_id());
			
			clientDAO.changePw(map);
	
			return "redirect:showPw.pet?change_pw="+change_pw;		
		}else{//일치하지 않으면?에러페이지로..
			
			return "/client/client/pwSearchError";		
		}
		
	}
	
	/*새로운 비번 보여주는 컨트롤러*/
	@RequestMapping("showPw.pet")
	public String showPw(HttpServletRequest request, Model model){
		String change_pw = request.getParameter("change_pw");
		System.out.println("--------------------"+change_pw);
		model.addAttribute("change_pw", change_pw);

		
		return "/client/client/showPw";
	}
	
	////////////////Ajax/////////////
	//
	@ResponseBody
	@RequestMapping("pwSearchAjax.pet")
	public ClientDTO pwSearchAjax(@RequestBody ClientDTO clientDTO) throws Exception{
		System.out.println("Ajax실행");
		System.out.println(clientDTO.getClient_id());
				
		ClientDAO clientDAO = sqlSession.getMapper(ClientDAO.class);
		ClientDTO result_client = clientDAO.getClientInfo(clientDTO);
		
		if(result_client == null){
			//아이디가 없음
			System.out.println("ID가 없네영");
			return null;
			
		} else{
			//아이디가 있음 
			//해당 아이디에 대한 비번 정보 보내야 함!
			System.out.println(result_client.toString());
			return result_client;
		}
		
	}
}
