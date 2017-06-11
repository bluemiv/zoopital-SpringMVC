package com.pet.model;

import java.sql.Timestamp;

public class CounterDTO {
	 /* petaccept_code number CONSTRAINT petaccept_pk PRIMARY KEY, --접수코드
	  petaccept_petcode number, --펫코드
	  petaccept_date timestamp, --방문시간
	  petaccept_coments varchar2(2000) --접수 시 전할 말*/
	private int petaccept_code;
	private int petaccept_petcode;
	private Timestamp petaccept_date;
	private String petaccept_coments;
	private String store_code; //세션값 받기 위해서
	private String emp_name; //예약시 담당선생님
	private int treat_cost; //진료비 받아오기
	private String petaccept_view;
	//join문에 활용 하기 위한 dto
	private int waiting_num;
	private String pet_name;
	private String pet_type;
	private String pet_sex;
	private Timestamp pethistory_today;
	private int pethistory_key;
	private int pet_age;
	private int m_total_cost;
	
	public int getPetaccept_code() {
		return petaccept_code;
	}
	public void setPetaccept_code(int petaccept_code) {
		this.petaccept_code = petaccept_code;
	}
	public int getPetaccept_petcode() {
		return petaccept_petcode;
	}
	public void setPetaccept_petcode(int petaccept_petcode) {
		this.petaccept_petcode = petaccept_petcode;
	}
	public Timestamp getPetaccept_date() {
		return petaccept_date;
	}
	public void setPetaccept_date(Timestamp petaccept_date) {
		this.petaccept_date = petaccept_date;
	}
	public String getPetaccept_coments() {
		return petaccept_coments;
	}
	public void setPetaccept_coments(String petaccept_coments) {
		this.petaccept_coments = petaccept_coments;
	}
	public String getStore_code() {
		return store_code;
	}
	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}
	public int getWaiting_num() {
		return waiting_num;
	}
	public void setWaiting_num(int waiting_num) {
		this.waiting_num = waiting_num;
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
	public int getM_total_cost() {
		return m_total_cost;
	}
	public void setM_total_cost(int m_total_cost) {
		this.m_total_cost = m_total_cost;
	}
	public int getTreat_cost() {
		return treat_cost;
	}
	public void setTreat_cost(int treat_cost) {
		this.treat_cost = treat_cost;
	}
	public String getPetaccept_view() {
		return petaccept_view;
	}
	public void setPetaccept_view(String petaccept_view) {
		this.petaccept_view = petaccept_view;
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
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	
	
}
