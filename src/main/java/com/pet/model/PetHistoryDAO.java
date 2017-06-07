package com.pet.model;

import java.util.List;

public interface PetHistoryDAO {
	//전체목록 한번 출력해볼려고...
	public List<PetHistoryDTO> selectAllHistory(String store);
	
	//처방전 추가
	public void insertHistory(PetHistoryDTO petHistoryDTO);
	
	//처방전 삭제
	public void deleteHistory(int key);
	
	//진료대기자 명단(CounterDAO와 동일한 부분-- 가독성 위해서 한번더 사용)
	public List<CounterDTO> getTreatList(String store_code) throws Exception;
	
	//진료대기자 명단에서 삭제
	public void deleteWaiting(int petaccept_code) throws Exception;
	
	//진료대기자 명단 안보이게 하기
	public void updateWaiting(int petaccept_code) throws Exception;
}
