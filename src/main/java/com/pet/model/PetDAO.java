package com.pet.model;

import java.util.List;
import java.util.Map;

public interface PetDAO {

	public void insert_pet(PetDTO petDTO);
	public List list_pet();
	public List select_code(int pet_code);
	public int update_pet(PetDTO dto);
	public void delete_pet(int pet_code);
	public List searchList(PetDTO dto);
	//insert시에 pet정보에서 code 가져오기 (history작성전에 사용될 메소드)
	public List<PetDTO> getCodeForHistory(PetDTO petDTO);
		
	//code를 가져온 뒤 insert할 동물의 정보를 처방전에 뿌려준다.
	public PetDTO getHistoryInfo(int code);
}
