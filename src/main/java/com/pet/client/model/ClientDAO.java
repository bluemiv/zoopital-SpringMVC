package com.pet.client.model;

import java.util.List;

public interface ClientDAO {
	
	//고객 리스트 불러오기
	public List<ClientDTO> selectClient(ClientDTO dto);
	
	//회원가입하기
	public void insertClient(ClientDTO dto);

}
