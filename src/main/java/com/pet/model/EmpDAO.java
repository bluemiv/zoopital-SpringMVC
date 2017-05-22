package com.pet.model;
import java.util.List;

public interface EmpDAO {
	
	//모든 직원 리스트 불러오기
	public List<EmpDTO> getEmpList();
	
	//검색해서 직원 리스트 띄우기
	public List<EmpDTO> selectEmpList(EmpDTO dto);
	
	//직원 추가
	public int insertEmp(EmpDTO dto);
	
	//직원 삭제
	public int deleteEmp(EmpDTO dto);
	
	//직원 수정
	public int updateEmp(EmpDTO dto); 
	
	

}
