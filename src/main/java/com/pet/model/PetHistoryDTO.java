package com.pet.model;

import java.sql.Timestamp;

public class PetHistoryDTO {
//	  pethistory_petcode number,
//	  pethistory_medicine varchar2(500),
//	  pethistory_coments varchar2(4000),
//	  pethistory_today date
	private int pethistory_key;
	private int pethistory_petcode;
	private String pethistory_name;
	private String pethistory_medicine;
	private String pethistory_coments;
	private Timestamp pethistory_btoday = null;
	private Timestamp pethistory_today = null;
	private String pethistory_m_amount;
	private int pethistory_m_cost; //약값
	private int pethistory_cost; //진료비
	private int pethistory_total_cost;
	private String store_code;
	private int petaccept_code;
	//분리해서 출력하기 위한 필드변수
	private String mName; //약품이름
	private int mAmount; //약품수량
	//join문을 위해 쓰이는 필드변수
	private String pet_name;
	private String pet_type;
	private String pet_sex;
	private int pet_age;
	private String today;//payingDetailView에서 가지고온 값을 바로 업데이트 해주기위해 가져옴
	private String emp_name;
	private String pethistory_count;
	private String pethistory_year;
	private String pethistory_month;
	
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
	public Timestamp getPethistory_today() {
		return pethistory_today;
	}
	public void setPethistory_today(Timestamp pethistory_today) {
		this.pethistory_today = pethistory_today;
	}
	public int getPethistory_key() {
		return pethistory_key;
	}
	public void setPethistory_key(int pethistory_key) {
		this.pethistory_key = pethistory_key;
	}
	public String getPethistory_name() {
		return pethistory_name;
	}
	public void setPethistory_name(String pethistory_name) {
		this.pethistory_name = pethistory_name;
	}
	
	public String getPethistory_m_amount() {
		return pethistory_m_amount;
	}
	public void setPethistory_m_amount(String pethistory_m_amount) {
		this.pethistory_m_amount = pethistory_m_amount;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public int getmAmount() {
		return mAmount;
	}
	public void setmAmount(int mAmount) {
		this.mAmount = mAmount;
	}
	public String getStore_code() {
		return store_code;
	}
	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}
	public Timestamp getPethistory_btoday() {
		return pethistory_btoday;
	}
	public void setPethistory_btoday(Timestamp pethistory_btoday) {
		this.pethistory_btoday = pethistory_btoday;
	}
	public int getPethistory_m_cost() {
		return pethistory_m_cost;
	}
	public void setPethistory_m_cost(int pethistory_m_cost) {
		this.pethistory_m_cost = pethistory_m_cost;
	}
	public int getPethistory_cost() {
		return pethistory_cost;
	}
	public void setPethistory_cost(int pethistory_cost) {
		this.pethistory_cost = pethistory_cost;
	}
	public int getPetaccept_code() {
		return petaccept_code;
	}
	public void setPetaccept_code(int petaccept_code) {
		this.petaccept_code = petaccept_code;
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
	public int getPethistory_total_cost() {
		return pethistory_total_cost;
	}
	public void setPethistory_total_cost(int pethistory_total_cost) {
		this.pethistory_total_cost = pethistory_total_cost;
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getPethistory_count() {
		return pethistory_count;
	}
	public void setPethistory_count(String pethistory_count) {
		this.pethistory_count = pethistory_count;
	}
	
	public String getPethistory_year() {
		return pethistory_year;
	}
	public void setPethistory_year(String pethistory_year) {
		this.pethistory_year = pethistory_year;
	}
	public String getPethistory_month() {
		return pethistory_month;
	}
	public void setPethistory_month(String pethistory_month) {
		this.pethistory_month = pethistory_month;
	}
	
	
}
