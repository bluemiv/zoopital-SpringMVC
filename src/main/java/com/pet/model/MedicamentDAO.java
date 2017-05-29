package com.pet.model;

import java.util.ArrayList;
import java.util.List;

public interface MedicamentDAO {

	// 전체 약품 리스트 가져옴
	public List<MedicamentDTO> selectAll(MedicamentDTO medicamentDTO) throws Exception;
	
	// 약품 자세한 정보 가져옴
	public MedicamentDTO getMedicament(MedicamentDTO medicamentDTO) throws Exception;

	// 약품 정보 추가
	public int insertMedicament(MedicamentDTO medicamentDTO) throws Exception;

	// 약품 정보 수정
	public int updateMedicament(MedicamentDTO medicamentDTO) throws Exception;

	// 약품 정보 삭제
	public int deleteMedicament(MedicamentDTO medicamentDTO);
	
	// 지점 코드 가져오기
	public List<String> getMedicamentStore_code() throws Exception;
	
	// 전체 게시물 개수
	public int getTotalCountOfMedicament(MedicamentDTO medicamentDTO) throws Exception;

	// 약품 정보 다 가져오기(history용)
		public List<MedicamentDTO> getSelectAll() throws Exception;
	// 약품 정보 이름값 넣어서 가져오기(history용)
		public List<MedicamentDTO> getSelectChoice(List<String> list) throws Exception;
	// 약품 정보 이름값 넣어서 가져오기(history용)
		public MedicamentDTO getSelectChoice2(String m_name) throws Exception;
}
