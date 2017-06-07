package com.pet.client.model;

import java.sql.Date;

public class ClientDTO {
	
	//11개 값
	private String client_id;
	private String client_pw;
	private String client_name;
	private String client_nickname;
	private int client_age;
	private String client_tel;
	private String client_email;
	private Date client_join_date;
	private int client_enabled;
	private String client_add;
	private String client_add_detail;
	private String client_postcode;
	
	public String getClient_id() {
		return client_id;
	}
	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}
	public String getClient_pw() {
		return client_pw;
	}
	public void setClient_pw(String client_pw) {
		this.client_pw = client_pw;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public String getClient_nickname() {
		return client_nickname;
	}
	public void setClient_nickname(String client_nickname) {
		this.client_nickname = client_nickname;
	}
	public int getClient_age() {
		return client_age;
	}
	public void setClient_age(int client_age) {
		this.client_age = client_age;
	}
	public String getClient_tel() {
		return client_tel;
	}
	public void setClient_tel(String client_tel) {
		this.client_tel = client_tel;
	}
	public Date getClient_join_date() {
		return client_join_date;
	}
	public void setClient_join_date(Date client_join_date) {
		this.client_join_date = client_join_date;
	}
	public int getClient_enabled() {
		return client_enabled;
	}
	public void setClient_enabled(int client_enabled) {
		this.client_enabled = client_enabled;
	}
	public String getClient_add() {
		return client_add;
	}
	public void setClient_add(String client_add) {
		this.client_add = client_add;
	}
	public String getClient_add_detail() {
		return client_add_detail;
	}
	public void setClient_add_detail(String client_add_detail) {
		this.client_add_detail = client_add_detail;
	}
	public String getClient_postcode() {
		return client_postcode;
	}
	public void setClient_postcode(String client_postcode) {
		this.client_postcode = client_postcode;
	}	
	public String getClient_email() {
		return client_email;
	}
	public void setClient_email(String client_email) {
		this.client_email = client_email;
	}
	
}
