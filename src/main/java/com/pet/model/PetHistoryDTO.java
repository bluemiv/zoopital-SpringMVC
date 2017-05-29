package com.pet.model;

import java.sql.Date;

public class PetHistoryDTO {
//	  pethistory_petcode number,
//	  pethistory_medicine varchar2(500),
//	  pethistory_coments varchar2(4000),
//	  pethistory_today date
	private int pethistory_petcode;
	private String pethistory_medicine;
	private String pethistory_coments;
	private Date pethistory_today = null;
	private int pethistory_key;
	
	
	public int getPethistory_petcode() {
		return pethistory_petcode;
	}
	public void setPethistory_petcode(int pethistory_petcode) {
		this.pethistory_petcode = pethistory_petcode;
	}
	public String getPethistory_medicine() {
		return pethistory_medicine;
	}
	public void setPethistory_medicine(String pethistory_medicine) {
		this.pethistory_medicine = pethistory_medicine;
	}
	public String getPethistory_coments() {
		return pethistory_coments;
	}
	public void setPethistory_coments(String pethistory_coments) {
		this.pethistory_coments = pethistory_coments;
	}
	public Date getPethistory_today() {
		return pethistory_today;
	}
	public void setPethistory_today(Date pethistory_today) {
		this.pethistory_today = pethistory_today;
	}
	public int getPethistory_key() {
		return pethistory_key;
	}
	public void setPethistory_key(int pethistory_key) {
		this.pethistory_key = pethistory_key;
	}
	
	
}
