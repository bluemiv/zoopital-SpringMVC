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
}
