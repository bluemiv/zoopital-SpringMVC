package com.pet.model;

public class AdminDTO {
	private String admin_id; // varchar2(500) constraint admin_pk primary key, -- admin ID
	private String admin_pwd; // varchar2(500) not null, -- admin 비밀번호
	private int admin_enabled; // int default 1 not null, -- 활성화(1) 및 비활성화(0)
	private String admin_role; // varchar2(500) not null, -- 권한
	private String store_code; // varchar2(500) not null -- 지점 코드
	
	// set get method
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pwd() {
		return admin_pwd;
	}
	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
	}
	public int getAdmin_enabled() {
		return admin_enabled;
	}
	public void setAdmin_enabled(int admin_enabled) {
		this.admin_enabled = admin_enabled;
	}
	public String getAdmin_role() {
		return admin_role;
	}
	public void setAdmin_role(String admin_role) {
		this.admin_role = admin_role;
	}
	public String getStore_code() {
		return store_code;
	}
	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}
	
	
}
