package com.pet.model;

public class PetDTO {
	private int pet_code;
	private String pet_name, pet_type, pet_sex;
	private int pet_age, pet_phone;
	private String store_code ;
	
	public int getPet_code() {
		return pet_code;
	}
	public void setPet_code(int pet_code) {
		this.pet_code = pet_code;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public String getPet_type() {
		return pet_type;
	}
	public void setPet_type(String pet_type) {
		this.pet_type = pet_type;
	}
	public String getPet_sex() {
		return pet_sex;
	}
	public void setPet_sex(String pet_sex) {
		this.pet_sex = pet_sex;
	}
	public int getPet_age() {
		return pet_age;
	}
	public void setPet_age(int pet_age) {
		this.pet_age = pet_age;
	}
	public int getPet_phone() {
		return pet_phone;
	}
	public void setPet_phone(int pet_phone) {
		this.pet_phone = pet_phone;
	}
	public String getStore_code() {
		return store_code;
	}
	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}
	@Override
	public String toString() {
		return "PetDTO [pet_name=" + pet_name + ", pet_type=" + pet_type + ", pet_sex=" + pet_sex + ", pet_age="
				+ pet_age + ", pet_phone=" + pet_phone + ", store_code=" + store_code + "]";
	}
	
	
	
}
