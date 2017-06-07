package com.pet.client.model;

public interface ClientDAO {
	
	//고객 리스트 불러오기
	public ClientDTO selectClientList(ClientDTO dto);
	
	//회원가입하기
	public void insertClient(ClientDTO dto);

	// 특정한 고객 정보 가져오기
	public ClientDTO getClientInfo(ClientDTO dto) throws Exception;
}
