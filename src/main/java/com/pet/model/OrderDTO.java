package com.pet.model;

public class OrderDTO {
	private int order_code; // number constraint order_pet_pk primary key,
	private String order_name; // varchar2(500) not null, -- 물품 내용
	private int order_amount; // number not null, -- 요청한 물품 개수
	private String order_check; // varchar2(500) not null, -- 승인 및 거부
	private String order_delivery; // varchar2(500) not null, -- 수령 완료 및 미완료
	private String order_to; // varchar2(500) not null, -- 목적지 (대상)
	private String order_from; // varchar2(500) not null, -- 출발지 (요청하는 곳)
    private String store_code; // varchar2(500) not null -- 지점 코드
	private int medicament_amount; // 현재 가지고 있는 약품 개수
	private String store_role; // 현재 로그인 한 아이디의 권한
	
	// set get method
	public int getOrder_code() {
		return order_code;
	}
	public void setOrder_code(int order_code) {
		this.order_code = order_code;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public int getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}
	public String getOrder_check() {
		return order_check;
	}
	public void setOrder_check(String order_check) {
		this.order_check = order_check;
	}
	public String getOrder_delivery() {
		return order_delivery;
	}
	public void setOrder_delivery(String order_delivery) {
		this.order_delivery = order_delivery;
	}
	public String getOrder_to() {
		return order_to;
	}
	public void setOrder_to(String order_to) {
		this.order_to = order_to;
	}
	public String getOrder_from() {
		return order_from;
	}
	public void setOrder_from(String order_from) {
		this.order_from = order_from;
	}
	public String getStore_code() {
		return store_code;
	}
	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}
	public int getMedicament_amount() {
		return medicament_amount;
	}
	public void setMedicament_amount(int medicament_amount) {
		this.medicament_amount = medicament_amount;
	}
	public String getStore_role() {
		return store_role;
	}
	public void setStore_role(String store_role) {
		this.store_role = store_role;
	}
}
