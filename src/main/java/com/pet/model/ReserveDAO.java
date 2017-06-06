package com.pet.model;

import java.util.List;

public interface ReserveDAO {
	
	//예약 목록 띄우기
	public List<ReserveDTO> selectReserve(ReserveDTO dto);
	
	//예약 추가하기
	public void insertReserve(ReserveDTO dto);
	
	//예약이 되어있는 시간 셀렉
	public List<ReserveDTO> select_available_time(ReserveDTO dto);
	
	//날짜별로 예약 목록 띄우기
	public List<ReserveDTO> dateSelectedReserve(ReserveDTO dto);
	
	//예약 상태 바꾸기(방문)
	public void changeStatusVisited(String reserve_code);
	
	//예약 상태 바꾸기(미방문)
	public void changeStatusNotVisited(String reserve_code);
	
	//예약 취소(삭제)하기
	public void deleteReserve(String reserve_code);
	
	//지난 예약 보기
	public List<ReserveDTO> passReservationList(ReserveDTO dto);
	
}
