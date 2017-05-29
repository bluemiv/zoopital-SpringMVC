package com.pet.model;

import java.util.List;
import java.util.Map;

public interface PetDAO {

	// 동물 등록
	public int insert_pet(PetDTO petDTO) throws Exception;
	
	// 전체 동물 리스트 가져옴
	public List list_pet() throws Exception;
	
	// 동물 코드를 이용해서 상세정보 가져옴
	public PetDTO select_code(PetDTO petDTO) throws Exception;
	
	// 수정
	public int update_pet(PetDTO dto) throws Exception;
	
	// 삭제
	public int delete_pet(PetDTO dto) throws Exception;
	
	// 검색
	public List searchList(PetDTO dto) throws Exception;
	
}
