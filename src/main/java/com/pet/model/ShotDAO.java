package com.pet.model;

import java.util.List;

public interface ShotDAO {
	
	public List<ShotDTO> todayList();
	
	public List<MedicamentDTO> categoryList();

	public List detailList(int pet_code);
	
	public String selectCycle();
}
