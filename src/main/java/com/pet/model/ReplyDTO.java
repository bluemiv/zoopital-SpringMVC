package com.pet.model;

import java.sql.Timestamp;

public class ReplyDTO {
	
	private int reply_code; // number constraint reply_num primary key, -- 내부 글번호
    private String reply_title; // varchar2(500) not null, -- 댓글 제목
    private String reply_writer;// varchar2(500) not null, -- 댓글 작성자
    private Timestamp reply_regDate;// date not null, -- 댓글 작성 날짜
    private String reply_contents;// varchar2(3000) not null, -- 댓글 내용
    private int notice_code;// number not null, -- 부모글 pk
    private String store_code;// varchar2(500) not null -- 지점 코드
    
	
    // set get method
    public int getReply_code() {
		return reply_code;
	}
	public void setReply_code(int reply_code) {
		this.reply_code = reply_code;
	}
	public String getReply_title() {
		return reply_title;
	}
	public void setReply_title(String reply_title) {
		this.reply_title = reply_title;
	}
	public String getReply_writer() {
		return reply_writer;
	}
	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}
	public Timestamp getReply_regDate() {
		return reply_regDate;
	}
	public void setReply_regDate(Timestamp reply_regDate) {
		this.reply_regDate = reply_regDate;
	}
	public String getReply_contents() {
		return reply_contents;
	}
	public void setReply_contents(String reply_contents) {
		this.reply_contents = reply_contents;
	}
	public int getNotice_code() {
		return notice_code;
	}
	public void setNotice_code(int notice_code) {
		this.notice_code = notice_code;
	}
	public String getStore_code() {
		return store_code;
	}
	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}
    
    
}
