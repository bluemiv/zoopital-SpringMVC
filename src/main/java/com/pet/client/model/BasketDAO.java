package com.pet.client.model;

import java.util.List;

public interface BasketDAO {

	// 전체 리스트 가져옴
	public List<BasketDTO> selectAll(BasketDTO basketDTO) throws Exception;

	// 장바구니 등록
	public int basketInsert(BasketDTO basketDTO) throws Exception;
	
	// 목록 삭제
	public int basketDelete(BasketDTO basketDTO) throws Exception;
	
}
