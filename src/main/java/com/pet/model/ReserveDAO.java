package com.pet.model;

import java.util.List;

public interface ReserveDAO {
	
	//예약 목록 띄우기
	public List<ReserveDTO> selectReserve(ReserveDTO dto);
	
	//예약 추가하기
	public void insertReserve(ReserveDTO dto);
	
	
}
