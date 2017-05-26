package com.pet.model;

import java.util.List;

public interface ShotDAO {
	
	public List<ShotDTO> detailList();

	public List<ShotDTO> todayList();
	
}
