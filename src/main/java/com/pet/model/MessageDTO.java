package com.pet.model;

import java.sql.Timestamp;

public class MessageDTO {

	private int message_code; // number constraint message_pk primary key, -- 메세지 pk
	private String message_title; // varchar2(500) not null, -- 메세지 제목
	private String message_body; // varchar2(2000) not null, -- 메세지 내용
	private Timestamp message_date; // timestamp not null, -- 메세지 보낸 시간
	private String message_writer; // varchar2(500) not null, -- 보낸 사람
	private String message_reader; // varchar2(500) not null, -- 받는사람
	private String message_read; // varchar2(100) not null -- 읽음(y), 안읽음(n)
	private String message_delete_writer; // varchar2(100) not null, -- 삭제(y), 삭제안함(n)
	private String message_delete_reader; // varchar2(100) not null -- 삭제(y), 삭제안함(n)
	
	// set get method
	public int getMessage_code() {
		return message_code;
	}

	public void setMessage_code(int message_code) {
		this.message_code = message_code;
	}

	public String getMessage_title() {
		return message_title;
	}

	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}

	public String getMessage_body() {
		return message_body;
	}

	public void setMessage_body(String message_body) {
		this.message_body = message_body;
	}

	public Timestamp getMessage_date() {
		return message_date;
	}

	public void setMessage_date(Timestamp message_date) {
		this.message_date = message_date;
	}

	public String getMessage_writer() {
		return message_writer;
	}

	public void setMessage_writer(String message_writer) {
		this.message_writer = message_writer;
	}

	public String getMessage_reader() {
		return message_reader;
	}

	public void setMessage_reader(String message_reader) {
		this.message_reader = message_reader;
	}

	public String getMessage_read() {
		return message_read;
	}

	public void setMessage_read(String message_read) {
		this.message_read = message_read;
	}

	public String getMessage_delete_writer() {
		return message_delete_writer;
	}

	public void setMessage_delete_writer(String message_delete_writer) {
		this.message_delete_writer = message_delete_writer;
	}

	public String getMessage_delete_reader() {
		return message_delete_reader;
	}

	public void setMessage_delete_reader(String message_delete_reader) {
		this.message_delete_reader = message_delete_reader;
	}

	@Override
	public String toString() {
		return "MessageDTO [message_code=" + message_code + ", message_title=" + message_title + ", message_body="
				+ message_body + ", message_date=" + message_date + ", message_writer=" + message_writer
				+ ", message_reader=" + message_reader + ", message_read=" + message_read + ", message_delete_writer="
				+ message_delete_writer + ", message_delete_reader=" + message_delete_reader + "]";
	}

	
}
