package com.pet.model;

import java.sql.Date;

public class ReserveDTO {
	
	private String reserve_code;
	private Date reserve_date;
	private int reserve_start_time;
	private int reserve_end_time;
	private String emp_name;
	private String reserve_contents;
	private String store_code;
	private String reserve_status;
	private int pet_code;
	private String pet_name;
	private String pet_phone;
	private String start; // 시작 날짜 시간
	private String end; // 끝 날짜 시간
	
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public String getPet_phone() {
		return pet_phone;
	}
	public void setPet_phone(String pet_phone) {
		this.pet_phone = pet_phone;
	}
	public int getPet_code() {
		return pet_code;
	}
	public void setPet_code(int pet_code) {
		this.pet_code = pet_code;
	}
	public String getReserve_code() {
		return reserve_code;
	}
	public void setReserve_code(String reserve_code) {
		this.reserve_code = reserve_code;
	}
	public Date getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(Date reserve_date) {
		this.reserve_date = reserve_date;
	}
	public int getReserve_start_time() {
		return reserve_start_time;
	}
	public void setReserve_start_time(int reserve_start_time) {
		this.reserve_start_time = reserve_start_time;
	}
	public int getReserve_end_time() {
		return reserve_end_time;
	}
	public void setReserve_end_time(int reserve_end_time) {
		this.reserve_end_time = reserve_end_time;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getReserve_contents() {
		return reserve_contents;
	}
	public void setReserve_contents(String reserve_contents) {
		this.reserve_contents = reserve_contents;
	}
	public String getStore_code() {
		return store_code;
	}
	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}
	public String getReserve_status() {
		return reserve_status;
	}
	public void setReserve_status(String reserve_status) {
		this.reserve_status = reserve_status;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
}
