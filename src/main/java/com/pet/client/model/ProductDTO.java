package com.pet.client.model;

public class ProductDTO {

	private int product_code; // number constraint product_pk primary key, -- 상품 내부 코드
	private String product_name; // varchar2(500) not null, -- 상품 이름
	private int product_cost; // number not null, -- 상품 가격
	private int product_amount; // number not null, -- 상품 개수
	private String product_category; // varchar2(500) not null, -- 상품 종류
	private String product_regdate; // varchar2(500) not null, -- 상품 등록 날짜
	private String product_modifyDate; // varchar2(500) -- 수정 날짜
	private String product_url; // varchar2(500) -- 상품 이미지 경로
	
	// set get method
	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
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

	public int getProduct_amount() {
		return product_amount;
	}

	public void setProduct_amount(int product_amount) {
		this.product_amount = product_amount;
	}

	public String getProduct_category() {
		return product_category;
	}

	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}

	public String getProduct_regdate() {
		return product_regdate;
	}

	public void setProduct_regdate(String product_regdate) {
		this.product_regdate = product_regdate;
	}

	public String getProduct_modifyDate() {
		return product_modifyDate;
	}

	public void setProduct_modifyDate(String product_modifyDate) {
		this.product_modifyDate = product_modifyDate;
	}

	public String getProduct_url() {
		return product_url;
	}

	public void setProduct_url(String product_url) {
		this.product_url = product_url;
	}

	@Override
	public String toString() {
		return "ProductDTO [product_code=" + product_code + ", product_name=" + product_name + ", product_cost="
				+ product_cost + ", product_amount=" + product_amount + ", product_category=" + product_category
				+ ", product_regdate=" + product_regdate + ", product_modifyDate=" + product_modifyDate
				+ ", product_url=" + product_url + "]";
	}
	

}
