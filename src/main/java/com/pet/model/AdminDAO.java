package com.pet.model;

public interface AdminDAO {
	// 관리자 회원가입
    public int insert(AdminDTO adminDTO) throws Exception;
    // 관리자 수정
	public int update(AdminDTO adminDTO) throws Exception;
	// 관리자 삭제
	public int deleteAdmin(StoreDTO dto) throws Exception;
  
}
