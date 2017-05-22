package com.pet.model;

import java.sql.Date;
import java.sql.Timestamp;

public class MedicamentDTO {

	private String medicament_code; // number constraint medicament_pk primary key, -- 약품 코드
	private String medicament_name; // varchar2(500) not null, -- 약품 이름
	private int medicament_amount; // number, -- 약품 개수
	private int medicament_cost; // number, -- 약품 가격
	private Date medicament_mandate; // date, -- 약품 제조일자
	private Date medicament_exdate; // date, -- 약품 유통기한
	private String store_code; // varchar2(500) not null -- 지점 코드
	private int startNum; // 첫번째 글
	private int endNum; // 마지막 글
	private int pageSize; // 한 페이지의 크기 (몇개의 글?)
	private int pageNum; // 몇 페이지?
	private int pageTotalNum; // 전체 페이지 개수
	private String search; // 검색어
	
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
	
	
}
