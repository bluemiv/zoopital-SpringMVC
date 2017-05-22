package com.pet.model;

import java.sql.Timestamp;

public class EmpDTO {
	
	private String emp_name;
	private String emp_code;
	private int emp_age;
	private String emp_tel;
	private Timestamp emp_hiredate;
	private int emp_pay;
	private String store_code;
//	private String command;
	
	public EmpDTO(){}
	
	//Constructor
	public EmpDTO(String emp_name, String emp_code, int emp_age, String emp_tel, Timestamp emp_hiredate, int emp_pay,
			String store_code) {
		super();
		this.emp_name = emp_name;
		this.emp_code = emp_code;
		this.emp_age = emp_age;
		this.emp_tel = emp_tel;
		this.emp_hiredate = emp_hiredate;
		this.emp_pay = emp_pay;
		this.store_code = store_code;
	}
	
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

	@Override
	public String toString() {
		return "EmpDTO [emp_name=" + emp_name + ", emp_code=" + emp_code + ", emp_age=" + emp_age + ", emp_tel="
				+ emp_tel + ", emp_hiredate=" + emp_hiredate + ", emp_pay=" + emp_pay + ", store_code=" + store_code
				+ "]";
	}

/*	public String getCommand() {
		return command;
	}

	public void setCommand(String command) {
		this.command = command;
	}*/

	


	
	
}
