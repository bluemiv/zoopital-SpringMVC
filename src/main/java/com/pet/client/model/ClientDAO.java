package com.pet.client.model;

import java.util.HashMap;

public interface ClientDAO {
	
	// 고객 리스트 불러오기
	public ClientDTO selectClientList(ClientDTO dto);
	
	// 회원가입하기
	public void insertClient(ClientDTO dto);

	// 특정한 고객 정보 가져오기
	public ClientDTO getClientInfo(ClientDTO dto) throws Exception;

	// 고객 정보 수정
	public int clientUpdatePro(ClientDTO clientDTO) throws Exception;

	//비번 찾기 질문에 대한 답변이 맞는지 확인!
	public int checkAnswer(ClientDTO clientDTO);
	
	// 비번 찾기 비번수정
	public void changePw(HashMap<String, Object> map) throws Exception;
	
	//  Id 찾기
	public String findId(ClientDTO clientDTO) throws Exception;

	// 회원탈퇴
	public int clientDeletePro(ClientDTO clientDTO) throws Exception;
}
