package com.pet.model;

import java.sql.Timestamp;

public class StoreDTO {
 
    private String store_code;   //지점 코드
	private String store_password;// 지점 패스워드
	private String store_name;   //지점 이름
	private String store_cost;   //지점별 관리비
	private String store_payment;   //지점별 급여
	private String store_income;  //지점별 수입
	private String store_rentCost;  //임대비
	private String store_doctor; //지점 의사
	private String store_worker; //지점 직원
	private Timestamp  store_date=null; // 가입날짜
	
	// set get method
	public String getStore_code() {
		return store_code;
	}
	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}
	public String getStore_password() {
		return store_password;
	}
	public void setStore_password(String store_password) {
		this.store_password = store_password;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getStore_cost() {
		return store_cost;
	}
	public void setStore_cost(String store_cost) {
		this.store_cost = store_cost;
	}
	public String getStore_payment() {
		return store_payment;
	}
	public void setStore_payment(String store_payment) {
		this.store_payment = store_payment;
	}
	public String getStore_income() {
		return store_income;
	}
	public void setStore_income(String store_income) {
		this.store_income = store_income;
	}
	public String getStore_rentCost() {
		return store_rentCost;
	}
	public void setStore_rentCost(String store_rentCost) {
		this.store_rentCost = store_rentCost;
	}
	public String getStore_doctor() {
		return store_doctor;
	}
	public void setStore_doctor(String store_doctor) {
		this.store_doctor = store_doctor;
	}
	public String getStore_worker() {
		return store_worker;
	}
	public void setStore_worker(String store_worker) {
		this.store_worker = store_worker;
	}
	public Timestamp getStore_date() {
		return store_date;
	}
	public void setStore_date(Timestamp store_date) {
		this.store_date = store_date;
	}
	
}
