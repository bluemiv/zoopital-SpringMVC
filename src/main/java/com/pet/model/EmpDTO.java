package com.pet.model;

import java.util.Date;

public class EmpDTO {

	private String emp_code; // varchar2(500) constraint emp_pk primary key, --직원ID
	private String emp_pwd; // varchar2(500) not null, -- 비밀번호
	private String emp_name; // varchar2(500) not null, --이름
	private int emp_age; // number not null, --나이
	private String emp_tel; // varchar2(500) not null, -- 전화번호
	private Date emp_hiredate; // date not null, --일 시작한 날짜
	private int emp_pay; // number not null, --급여
	private int emp_enabled; // number default 1 not null, -- 활성화(1) 및 비활성화(0)
	private String emp_role; // varchar2(500) not null, -- 권한
	private String store_code; // varchar2(500) not null --지점
	private int emp_full_total; // 정규직 인원 수
	private int emp_part_total; // 비정규직 인원 수
	
	// set get method
	public String getEmp_code() {
		return emp_code;
	}

	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}

	public String getEmp_pwd() {
		return emp_pwd;
	}

	public void setEmp_pwd(String emp_pwd) {
		this.emp_pwd = emp_pwd;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
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

	public Date getEmp_hiredate() {
		return emp_hiredate;
	}

	public void setEmp_hiredate(Date emp_hiredate) {
		this.emp_hiredate = emp_hiredate;
	}

	public int getEmp_pay() {
		return emp_pay;
	}

	public void setEmp_pay(int emp_pay) {
		this.emp_pay = emp_pay;
	}

	public int getEmp_enabled() {
		return emp_enabled;
	}

	public void setEmp_enabled(int emp_enabled) {
		this.emp_enabled = emp_enabled;
	}

	public String getEmp_role() {
		return emp_role;
	}

	public void setEmp_role(String emp_role) {
		this.emp_role = emp_role;
	}

	public String getStore_code() {
		return store_code;
	}

	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}

	public int getEmp_full_total() {
		return emp_full_total;
	}

	public void setEmp_full_total(int emp_full_total) {
		this.emp_full_total = emp_full_total;
	}

	public int getEmp_part_total() {
		return emp_part_total;
	}

	public void setEmp_part_total(int emp_part_total) {
		this.emp_part_total = emp_part_total;
	}

	@Override
	public String toString() {
		return "EmpDTO [emp_code=" + emp_code + ", emp_pwd=" + emp_pwd + ", emp_name=" + emp_name + ", emp_age="
				+ emp_age + ", emp_tel=" + emp_tel + ", emp_hiredate=" + emp_hiredate + ", emp_pay=" + emp_pay
				+ ", emp_enabled=" + emp_enabled + ", emp_role=" + emp_role + ", store_code=" + store_code
				+ ", emp_full_total=" + emp_full_total + ", emp_part_total=" + emp_part_total + "]";
	}

}
