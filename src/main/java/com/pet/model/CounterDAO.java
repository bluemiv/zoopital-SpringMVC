package com.pet.model;

import java.util.List;

public interface CounterDAO {
	//접수를 위해 받아오는 펫 리스트
	public List<PetDTO> getListAll(String store_code) throws Exception;
	
	//접수를 위해 받아오는 펫 리스트(검색기능)
	public List<PetDTO> searchList(PetDTO dto) throws Exception;
	
	//접수버튼 클릭시 간단한 정보를 넘겨 주기 위한 메소드
	public PetDTO getPetInfo(int pet_code) throws Exception;
	
	//접수DB에 insert!
	public int insertAccept(CounterDTO counterDTO) throws Exception;
	
	//접수 대기자 명단 list
	public List<CounterDTO> getListWaiting(String store_code) throws Exception; 
}
