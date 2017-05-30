package com.pet.model;

import java.sql.Timestamp;

public class EmpDTO {
	
	private String emp_name;
	private String emp_code;
	private int emp_age;
	private String emp_tel;
	private Timestamp emp_hiredate;
	private int emp_pay;
	private String emp_job; // varchar2(500) not null, -- (비)정규직
	private String store_code;
	
	public EmpDTO(){}
	
	//getter setter
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getEmp_code() {
		return emp_code;
	}
	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}
	public int getEmp_age() {
		return emp_age;
	}
	public void setEmp_age(int emp_age) {
		this.emp_age = emp_age;
	}
	public String getEmp_tel() {
		return emp_tel;
	}
	public void setEmp_tel(String emp_tel) {
		this.emp_tel = emp_tel;
	}
	public Timestamp getEmp_hiredate() {
		return emp_hiredate;
	}
	public void setEmp_hiredate(Timestamp emp_hiredate) {
		this.emp_hiredate = emp_hiredate;
	}
	public int getEmp_pay() {
		return emp_pay;
	}
	public void setEmp_pay(int emp_pay) {
		this.emp_pay = emp_pay;
	}
	public String getStore_code() {
		return store_code;
	}
	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}
	public String getEmp_job() {
		return emp_job;
	}
	public void setEmp_job(String emp_job) {
		this.emp_job = emp_job;
	}

}
