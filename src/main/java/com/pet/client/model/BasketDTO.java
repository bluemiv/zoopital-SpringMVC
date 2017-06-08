package com.pet.client.model;

public class BasketDTO {

	private int basket_code; // number constraint basket_pk primary key, -- 내부코드
	private String product_code; // varchar2(500) not null, -- 상품 이름
	private int product_amount; // number not null, -- 상품 개수
	private String client_id; // varchar2(500) not null -- 고객 아이디
	private String product_name; // varchar2(500) not null, -- 상품 이름
	private int product_cost; // number not null, -- 상품 가격
	private String product_url; // varchar2(500) -- 상품 이미지 경로
	private String product_category; // varchar2(500) not null, -- 상품 종류
	
	// set get method
	public int getBasket_code() {
		return basket_code;
	}
	public void setBasket_code(int basket_code) {
		this.basket_code = basket_code;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public int getProduct_amount() {
		return product_amount;
	}
	public void setProduct_amount(int product_amount) {
		this.product_amount = product_amount;
	}
	public String getClient_id() {
		return client_id;
	}
	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_cost() {
		return product_cost;
	}
	public void setProduct_cost(int product_cost) {
		this.product_cost = product_cost;
	}
	public String getProduct_url() {
		return product_url;
	}
	public void setProduct_url(String product_url) {
		this.product_url = product_url;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	
	
}
