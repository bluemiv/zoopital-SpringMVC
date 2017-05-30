package com.pet.model;

public class MailDTO {

	private String send_email; // 내 계정 이메일 아이디
	private String send_pwd; // 내 계정 비밀번호
	private String receive_email; // 받는 사람
	private String title; // 이메일 제목
	private String contents; // 이메일 내용
	private String email_host; // host
	private String email_port; // 포트 번호
	
	/*
	 	port : 465
		<네이버>
		host : smtp.naver.com
		
		<다음>
		host : smtp.daum.net
	*/
	
	// set get method
	public String getSend_email() {
		return send_email;
	}
	public void setSend_email(String send_email) {
		this.send_email = send_email;
	}
	public String getSend_pwd() {
		return send_pwd;
	}
	public void setSend_pwd(String send_pwd) {
		this.send_pwd = send_pwd;
	}
	public String getReceive_email() {
		return receive_email;
	}
	public void setReceive_email(String receive_email) {
		this.receive_email = receive_email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getEmail_host() {
		return email_host;
	}
	public void setEmail_host(String email_host) {
		this.email_host = email_host;
	}
	public String getEmail_port() {
		return email_port;
	}
	public void setEmail_port(String email_port) {
		this.email_port = email_port;
	}
	
}
