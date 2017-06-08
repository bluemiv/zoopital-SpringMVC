package com.pet.client.model;

public interface ClientDAO {
	
	// 고객 리스트 불러오기
	public ClientDTO selectClientList(ClientDTO dto);
	
	// 회원가입하기
	public void insertClient(ClientDTO dto);

	// 특정한 고객 정보 가져오기
	public ClientDTO getClientInfo(ClientDTO dto) throws Exception;

	// 고객 정보 수정
	public int clientUpdatePro(ClientDTO clientDTO) throws Exception;

	// 회원탈퇴
	public int clientDeletePro(ClientDTO clientDTO) throws Exception;

	// 구매자 정보 가져옴
	public ClientDTO getClientBuyInfo(ClientDTO clientDTO) throws Exception;
}
