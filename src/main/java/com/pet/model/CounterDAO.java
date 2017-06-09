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
	
	//history에 방문시간을 담기위해 가져오는 메소드
	public CounterDTO getTime(int petaccept_code) throws Exception;
	
	//수납리스트를 뽑기위한 메소드
	public List<CounterDTO> getPayingList(String store_code) throws Exception;
	
	//상세정보를 보기 위해 key값을 이용해 DTO정보를 가져오는 메소드(수납 상세보기)
	public PetHistoryDTO getPayingInfo(int pethistory_key) throws Exception;
	
	//history수정 시 수납완료인지 아닌지 DB체크
	public int checkExist(PetHistoryDTO petHistoryDTO) throws Exception;
}
