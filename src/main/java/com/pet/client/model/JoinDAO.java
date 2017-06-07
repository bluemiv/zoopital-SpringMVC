package com.pet.client.model;

import java.util.List;

public interface JoinDAO {
	
	//고객 리스트 불러오기
	public ClientDTO selectClientList(ClientDTO dto);
	
	//회원가입하기
	public void insertClient(ClientDTO dto);

}
