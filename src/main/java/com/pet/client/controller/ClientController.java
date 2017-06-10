package com.pet.client.controller;

import java.security.Principal;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pet.client.model.ClientDAO;
import com.pet.client.model.ClientDTO;
import com.pet.model.EmpDAO;
import com.pet.model.EmpDTO;

@Controller
@RequestMapping("/client/")
public class ClientController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("clientJoinForm.pet")
	public String clientJoinForm(ClientDTO dto, Model model){
		
		return "/client/client/clientJoinForm";
	}
	
	@RequestMapping("joinPro.pet")
	public String joinPro(ClientDTO dto, Model model){
		
		ClientDAO joinDAO = sqlSession.getMapper(ClientDAO.class);
		System.out.println(dto.toString());
		joinDAO.insertClient(dto);

		return "redirect:../webHome.pet";
	}
	
	@RequestMapping("clientMypageForm.pet")
	public String clientMypageForm(Principal principal, Model model) throws Exception{
		System.out.println("clientMypageForm 접근");
		
		// 세션 ID값 가져옴
		ClientDTO clientDTO = new ClientDTO();
		clientDTO.setClient_id(principal.getName());
		// 정보 가져옴
		ClientDAO clientDAO = sqlSession.getMapper(ClientDAO.class);
		clientDTO = clientDAO.getClientInfo(clientDTO);
		
		model.addAttribute("clientDTO",clientDTO);
		return "/client/client/clientMypageForm";
	}
	
	@RequestMapping("clientUpdatePro.pet")
	public String clientUpdatePro(ClientDTO clientDTO, Model model) throws Exception{
		
		boolean check = false;
		ClientDAO clientDAO = sqlSession.getMapper(ClientDAO.class);
		if(clientDAO.clientUpdatePro(clientDTO) > 0){
			check = true;
		}
		System.out.println(check);

		return "redirect:clientMypageForm.pet";
	}
	
	@RequestMapping("clientDeletePro.pet")
	public String clientDeletePro(ClientDTO clientDTO, Principal principal, Model model) throws Exception{
		
		// 세션 ID값 가져옴
		clientDTO.setClient_id(principal.getName());
		
		boolean check = false;
		ClientDAO clientDAO = sqlSession.getMapper(ClientDAO.class);
		if(clientDAO.clientDeletePro(clientDTO) > 0){
			check = true;
		}
		System.out.println(check);
		if(check){
			return "redirect:../j_spring_security_logout";
		} else{
			return "redirect:clientMypageForm.pet";
		}
	}
	
	@RequestMapping("findIDForm.pet")
	public String findIdForm(ClientDTO clientDTO){
		
		return "/client/client/findIDForm";
	}
	
	@RequestMapping("findIDPro.pet")
	public String findIdPro(ClientDTO clientDTO){
		
		return "";
	}
	///////////////////Ajax////////////////////////////////////////
	@ResponseBody
	@RequestMapping("/clientIdConfirmAjax.pet")
	public boolean clientIdConfirmAjax(@RequestBody ClientDTO clientDTO) throws Exception{
		System.out.println("Ajax실행");
		System.out.println(clientDTO.getClient_id());
				
		// 직원 테이블 아이디와 비교
		EmpDAO empDAO = sqlSession.getMapper(EmpDAO.class);
		boolean empCheck = false;
		try {
			EmpDTO empDTO = new EmpDTO();
			empDTO.setEmp_code(clientDTO.getClient_id());
			EmpDTO result_empDTO = empDAO.selectEmpList(empDTO);
			if(result_empDTO.getEmp_code() != null){
				// 아이디가 존재함(사용 불가능)
				empCheck = false;
			}
		} catch (Exception e) {
			// 아이디가 없음 (사용가능)
			// NullPointException에 걸림
			empCheck = true;
		}
		
		// 고객 테이블 아이디와 비교
		ClientDAO clientDAO = sqlSession.getMapper(ClientDAO.class);
		boolean clientCheck = false;
		try {
			clientDTO = clientDAO.getClientInfo(clientDTO);
			if(clientDTO.getClient_id() != null){
				// 아이디가 존재함(사용 불가능)
				clientCheck = false;
			}
		} catch (Exception e) {
			// 아이디가 없음 (사용가능)
			// NullPointException에 걸림
			clientCheck = true;
		}
		
		boolean check = false;
		if(empCheck && clientCheck){
			check = true;
		}
		
		return check;
	}
	
}
