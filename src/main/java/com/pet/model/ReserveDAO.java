package com.pet.model;

import java.util.List;

public interface ReserveDAO {
	
	//예약 목록 띄우기
	public List<ReserveDTO> selectReserve();
	
	
}
