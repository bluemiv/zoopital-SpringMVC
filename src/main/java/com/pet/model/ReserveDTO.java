package com.pet.model;

import java.sql.Timestamp;

public class ReserveDTO {
	
	private String reserve_code;
	private Timestamp reserve_date;
	private int reserve_start_time;
	private int reserve_end_time;
	private String emp_name;
	private String reserve_contents;
	private String store_code;
	private int reserve_status;
	public String getReserve_code() {
		return reserve_code;
	}
	public void setReserve_code(String reserve_code) {
		this.reserve_code = reserve_code;
	}
	public Timestamp getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(Timestamp reserve_date) {
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
	public int getReserve_status() {
		return reserve_status;
	}
	public void setReserve_status(int reserve_status) {
		this.reserve_status = reserve_status;
	}
	@Override
	public String toString() {
		return "ReserveDTO [reserve_code=" + reserve_code + ", reserve_date=" + reserve_date + ", reserve_start_time="
				+ reserve_start_time + ", reserve_end_time=" + reserve_end_time + ", emp_name=" + emp_name
				+ ", reserve_contents=" + reserve_contents + ", store_code=" + store_code + ", reserve_status="
				+ reserve_status + "]";
	}
	
}
