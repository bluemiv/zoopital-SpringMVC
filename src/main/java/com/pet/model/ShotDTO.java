package com.pet.model;

import java.util.Date;

public class ShotDTO {
	private String shot_name;
	private String shot_cycle;
	private int pet_code;
	private Date shot_date;
	private Date shot_must;
	public String getShot_name() {
		return shot_name;
	}
	public void setShot_name(String shot_name) {
		this.shot_name = shot_name;
	}
	public String getShot_cycle() {
		return shot_cycle;
	}
	public void setShot_cycle(String shot_cycle) {
		this.shot_cycle = shot_cycle;
	}
	public int getPet_code() {
		return pet_code;
	}
	public void setPet_code(int pet_code) {
		this.pet_code = pet_code;
	}
	public Date getShot_date() {
		return shot_date;
	}
	public void setShot_date(Date shot_date) {
		this.shot_date = shot_date;
	}
	public Date getShot_must() {
		return shot_must;
	}
	public void setShot_must(Date shot_must) {
		this.shot_must = shot_must;
	}

	
	

	
}
