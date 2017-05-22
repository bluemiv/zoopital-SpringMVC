package com.pet.model;

public interface AdminDAO {
	// 관리자 회원가입
    public int insert(AdminDTO adminDTO) throws Exception;

	public int update(AdminDTO adminDTO) throws Exception;
  
}
