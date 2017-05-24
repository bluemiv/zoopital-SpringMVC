package com.pet.model;

import java.util.List;

public interface StoreDAO {
	// 관리자 회원가입
    public int insert(StoreDTO dto);
     
    // 회원 가입 목록 보기
 	public List<StoreDTO> getSelectAll();
 	
 	//관리자 수정 세부페이지
 	public StoreDTO adminUpdate(StoreDTO dto);
 	
 	//관리자 수정 process 과정
 	public int adminUpdatePro(StoreDTO dto);
 	
 	//관리자 삭제
 	public int adminDelete(StoreDTO dto);

 	// 전체 리스트 개수
	public int getListCount();

	// 페이지 값에 따라 리스트를 출력
	public List<StoreDTO> getPageSelectAll(PageDTO pageDTO);
 	
	//store_name 으로 검색기능
	public List<StoreDTO> searchStore(StoreDTO dto);
	
	// ROLE_SUPER_ADMIN 권한을 가진 store_code 가져오기
	public List<String> getStoreRole() throws Exception;
}
