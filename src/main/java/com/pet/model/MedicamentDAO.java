package com.pet.model;

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
	
	// 다른 지점에 보낸 약품 개수 증가
	public int updateMedicamentAmountDiffrentStore(MedicamentDTO medicamentDTO) throws Exception;
}
