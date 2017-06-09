package com.pet.model;

import java.util.List;

public interface SalesLogDAO {
	//오늘날짜가 만들어 져있는지 확인하는 작업메소드
	public int getList(String today, String store_code) throws Exception;
	
	//오늘날짜가 없으면 먼저 insert해주는 메소드
	public void insertSaleslog(SalesLogDTO salesLogDTO) throws Exception;
	
	//전체적으로 쭈욱 확인하기 위한 리스트 출력
	public List<SalesLogDTO> getSalesList(String store_code) throws Exception;
	
	//약품수입 진료수입 업데이트 하는 메소드(HistoryDTO 객체를 파라미터로 넘겨서 사용가능한 메소드)
	public void upDateIncome(PetHistoryDTO petHistoryDTO) throws Exception;
	
	//총수익 업데이트 메소드
	public void upDateNIncome(PetHistoryDTO petHistoryDTO) throws Exception;
	//차트 리스트 메소드
	public List<SalesLogDTO> getMonthList(SalesLogDTO salesLogDTO) throws Exception;
	
	
	//history수정 들어갈때 salesLog에 수익 다시 돌려주기
	public void upDateIncomeForMod(PetHistoryDTO petHistoryDTO) throws Exception;
	
	//history수정 들어갈때 salesLog에 수익 다시 돌려주기 후 총수익 다시 계산
	public void upDateNIncomeForMod(PetHistoryDTO petHistoryDTO) throws Exception;
}
