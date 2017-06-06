package com.pet.model;

import java.util.List;

public interface ShotDAO {
	
	public List selectAll(String store_code);
	public List selectShot(String store_code);
	public int insertShot(ShotDTO shotDTO) throws Exception;
	
}
