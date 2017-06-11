package com.pet.model;
import java.util.List;

public interface EmpDAO {
	
	//모든 직원 리스트 불러오기
	public List<EmpDTO> getEmpList(EmpDTO dto);
	
	//검색해서 직원 리스트 띄우기
	public EmpDTO selectEmpList(EmpDTO dto);
	
	//직원 추가
	public int insertEmp(EmpDTO dto);
	
	//직원 삭제
	public int deleteEmp(EmpDTO dto);
	
	//직원 수정
	public int updateEmp(EmpDTO dto); 
	
	// 모든 정규직 직원 정보 가져옴
	public List<EmpDTO> getEmpFullTimeInfo() throws Exception;

	// 모든 지점 가져옴
	public List<String> getStoreAll() throws Exception;
	
	// 모든 직원 List 가져옴
	public List<EmpDTO> selectAllEmp() throws Exception;

	// 정규직 및 비정규직 직원 수 가져옴
	public EmpDTO getEmpFullCount(EmpDTO empDTO);
	public EmpDTO getEmpPartCount(EmpDTO empDTO);
	
	public List<EmpDTO> getEmpListFull(EmpDTO dto) throws Exception;
}
