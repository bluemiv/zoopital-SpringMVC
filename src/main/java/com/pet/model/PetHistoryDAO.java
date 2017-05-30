package com.pet.model;

import java.util.List;

public interface PetHistoryDAO {
	//전체목록 한번 출력해볼려고...
	public List<PetHistoryDTO> selectAllHistory();
	
	//처방전 추가
	public void insertHistory(PetHistoryDTO petHistoryDTO);
	
	//처방전 삭제
	public void deleteHistory(int key);
}
