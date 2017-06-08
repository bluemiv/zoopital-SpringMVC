package com.pet.model;

import java.util.List;

public interface ShotDAO {
	
	public List selectAll(String store_code);
	public ShotDTO selectShot(int petaccept_code);
	public int insertShot(ShotDTO shotDTO) throws Exception;
	public String divide_medicine(int petaccept_code);
	
}
