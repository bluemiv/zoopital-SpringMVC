package com.pet.model;

import java.sql.Timestamp;

public class ReserveDTO {
	
	private String reserve_code;
	private Timestamp reserve_date;
	private String emp_code;
	private String reserve_contents;
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
	public String getEmp_code() {
		return emp_code;
	}
	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}
	public String getReserve_contents() {
		return reserve_contents;
	}
	public void setReserve_contents(String reserve_contents) {
		this.reserve_contents = reserve_contents;
	}
	@Override
	public String toString() {
		return "ReserveDTO [reserve_code=" + reserve_code + ", reserve_date=" + reserve_date + ", emp_code=" + emp_code
				+ ", reserve_contents=" + reserve_contents + "]";
	}
	
	
	

}
