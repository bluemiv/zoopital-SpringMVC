package com.pet.model;

import java.sql.Date;

public class MedicamentDTO {

	private String medicament_code; // number constraint medicament_pk primary key, -- 약품 코드
	private String medicament_name; // varchar2(500) not null, -- 약품 이름
	private int medicament_amount; // number, -- 약품 개수
	private int medicament_cost; // number, -- 약품 가격
	private Date medicament_mandate; // date, -- 약품 제조일자
	private Date medicament_exdate; // date, -- 약품 유통기한
	private String medicament_category; // varchar2(500) not null, -- 약품 종류
	private int medicament_cycle; // number default 0, -- 약품 주기
	private String store_code; // varchar2(500) not null -- 지점 코드
	private int startNum; // 첫번째 글
	private int endNum; // 마지막 글
	private int pageSize; // 한 페이지의 크기 (몇개의 글?)
	private int pageNum; // 몇 페이지?
	private int pageTotalNum; // 전체 페이지 개수
	private String search; // 검색어
	private String amountState; // 개수 감소 혹은 증가 (up 또는 down)
	private int am_count = 0;
	private int amtotal_count = 0;

	// constructor
	public MedicamentDTO() {
	}
	
	// set get method
	public String getMedicament_code() {
		return medicament_code;
	}

	public void setMedicament_code(String medicament_code) {
		this.medicament_code = medicament_code;
	}

	public String getMedicament_name() {
		return medicament_name;
	}

	public void setMedicament_name(String medicament_name) {
		this.medicament_name = medicament_name;
	}

	public int getMedicament_amount() {
		return medicament_amount;
	}

	public void setMedicament_amount(int medicament_amount) {
		this.medicament_amount = medicament_amount;
	}

	public int getMedicament_cost() {
		return medicament_cost;
	}

	public void setMedicament_cost(int medicament_cost) {
		this.medicament_cost = medicament_cost;
	}

	public Date getMedicament_mandate() {
		return medicament_mandate;
	}

	public void setMedicament_mandate(Date medicament_mandate) {
		this.medicament_mandate = medicament_mandate;
	}

	public Date getMedicament_exdate() {
		return medicament_exdate;
	}

	public void setMedicament_exdate(Date medicament_exdate) {
		this.medicament_exdate = medicament_exdate;
	}

	public String getMedicament_category() {
		return medicament_category;
	}

	public void setMedicament_category(String medicament_category) {
		this.medicament_category = medicament_category;
	}

	public int getMedicament_cycle() {
		return medicament_cycle;
	}

	public void setMedicament_cycle(int medicament_cycle) {
		this.medicament_cycle = medicament_cycle;
	}

	public String getStore_code() {
		return store_code;
	}

	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageTotalNum() {
		return pageTotalNum;
	}

	public void setPageTotalNum(int pageTotalNum) {
		this.pageTotalNum = pageTotalNum;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getAmountState() {
		return amountState;
	}

	public void setAmountState(String amountState) {
		this.amountState = amountState;
	}
	public int getAm_count() {
		return am_count;
	}

	public void setAm_count(int am_count) {
		this.am_count = am_count;
	}

	public int getAmtotal_count() {
		return amtotal_count;
	}

	public void setAmtotal_count(int amtotal_count) {
		this.amtotal_count = amtotal_count;
	}

	@Override
	public String toString() {
		return "MedicamentDTO [medicament_code=" + medicament_code + ", medicament_name=" + medicament_name
				+ ", medicament_amount=" + medicament_amount + ", medicament_cost=" + medicament_cost
				+ ", medicament_mandate=" + medicament_mandate + ", medicament_exdate=" + medicament_exdate
				+ ", medicament_category=" + medicament_category + ", medicament_cycle=" + medicament_cycle
				+ ", store_code=" + store_code + ", startNum=" + startNum + ", endNum=" + endNum + ", pageSize="
				+ pageSize + ", pageNum=" + pageNum + ", pageTotalNum=" + pageTotalNum + ", search=" + search
				+ ", amountState=" + amountState + ", am_count=" + am_count + ", amtotal_count=" + amtotal_count + "]";
	}
	
	
}
