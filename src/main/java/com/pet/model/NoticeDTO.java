package com.pet.model;

import java.sql.Timestamp;

public class NoticeDTO {
	private int notice_code; // number constraint notice_num primary key, -- 내부 글번호
    private String notice_title; // varchar2(500) not null, -- 글 제목
    private int  notice_view; // number not null, -- 조회수
    private String notice_writer; // varchar2(500) not null, -- 작성자
    private Timestamp notice_regDate; // date not null, -- 작성 날짜
    private String notice_contents; // varchar2(3000) not null, -- 글 내용
    private int notice_reply; // number not null, -- 댓글 수
    private String store_code; // varchar2(500) not null -- 지점 코드
    private String replyState; // 댓글 등록 or 삭제 - 상태를 표시
    private int startNum; // 첫번째 글
	private int endNum; // 마지막 글
	private int pageSize; // 한 페이지의 크기 (몇개의 글?)
	private int pageNum; // 몇 페이지?
	private int pageTotalNum; // 전체 페이지 개수
	private String search; // 검색어
	
    // set get method
	public int getNotice_code() {
		return notice_code;
	}
	public void setNotice_code(int notice_code) {
		this.notice_code = notice_code;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public int getNotice_view() {
		return notice_view;
	}
	public void setNotice_view(int notice_view) {
		this.notice_view = notice_view;
	}
	public String getNotice_writer() {
		return notice_writer;
	}
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	public Timestamp getNotice_regDate() {
		return notice_regDate;
	}
	public void setNotice_regDate(Timestamp notice_regDate) {
		this.notice_regDate = notice_regDate;
	}
	public String getNotice_contents() {
		return notice_contents;
	}
	public void setNotice_contents(String notice_contents) {
		this.notice_contents = notice_contents;
	}
	public int getNotice_reply() {
		return notice_reply;
	}
	public void setNotice_reply(int notice_reply) {
		this.notice_reply = notice_reply;
	}
	public String getStore_code() {
		return store_code;
	}
	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}
	public String getReplyState() {
		return replyState;
	}
	public void setReplyState(String replyState) {
		this.replyState = replyState;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageTotalNum() {
		return pageTotalNum;
	}
	public void setPageTotalNum(int pageTotalNum) {
		this.pageTotalNum = pageTotalNum;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
}
