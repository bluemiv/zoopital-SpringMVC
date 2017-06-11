package com.pet.model;

import java.util.List;

public interface PetHistoryDAO {
	//전체목록 한번 출력해보려고...
	public List<PetHistoryDTO> selectAllHistory(String store);
	
	//처방전 추가
	public void insertHistory(PetHistoryDTO petHistoryDTO);
	
	//처방전 삭제
	public void deleteHistory(int key);
	
	//진료대기자 명단(CounterDAO와 동일한 부분-- 가독성 위해서 한번더 사용)
	public List<CounterDTO> getTreatList(String store_code) throws Exception;
	
	//진료대기자 명단 자신의 환자만 보기
	public List<CounterDTO> searchMyWaiting(String store_code, String emp_name) throws Exception;
	
	//진료대기자 명단에서 삭제
	public void deleteWaiting(int petaccept_code) throws Exception;
	
	//진료대기자 명단 안보이게 하기
	public void updateWaiting(int petaccept_code) throws Exception;
	
	//히스토리 수정을 위해 key값으로 불러오기
	public PetHistoryDTO getDto(int pethistory_key) throws Exception;
	
	//히스토리 수정
	public void updateHistory(PetHistoryDTO petHistoryDTO) throws Exception;
	
	//히스토리 내에서 검색 
	public List<PetHistoryDTO> searchHistory(PetHistoryDTO petHistoryDTO) throws Exception;
	
	//히스토리 내에서 자신의 환자만 나오게 검색 
	public List<PetHistoryDTO> searchMyHistory(PetHistoryDTO petHistoryDTO) throws Exception;
	
	// 월별 손님 수 가져오기
	public List<PetHistoryDTO> getHistoryTodayMonth(PetHistoryDTO petHistoryDTO) throws Exception;
}
