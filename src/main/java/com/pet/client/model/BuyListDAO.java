package com.pet.client.model;

import java.util.List;

public interface BuyListDAO {

	// 구매목록 전체 리스트 가져옴
	public List<BuyListDTO> selectAllList(BuyListDTO buyListDTO) throws Exception;

	// 구매목록 추가
	public int insertBuyList(BuyListDTO buyListDTO) throws Exception;
}
