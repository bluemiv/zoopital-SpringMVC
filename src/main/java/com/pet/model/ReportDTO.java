package com.pet.model;
import java.sql.Timestamp;

public class ReportDTO {

	private int report_code; // number constraint report_pk primary key, -- report pk
	private String report_reader; // varchar2(500) not null,-- 결재하는 사람
	private String report_writer; // varchar2(500) not null,-- 작성자
	private String report_position; // varchar2(500) not null,-- 직위(정규직 또는 비정규직)
	private Timestamp report_date; // date not null,-- 작성일
	private String report_contents; // varchar2(500) not null,-- 보고내용
	private String report_check; // varchar2(500) default 'fail' not null  -- 결재 여부
	
	// set get method
	public int getReport_code() {
		return report_code;
	}
	public void setReport_code(int report_code) {
		this.report_code = report_code;
	}
	public String getReport_reader() {
		return report_reader;
	}
	public void setReport_reader(String report_reader) {
		this.report_reader = report_reader;
	}
	public String getReport_writer() {
		return report_writer;
	}
	public void setReport_writer(String report_writer) {
		this.report_writer = report_writer;
	}
	public String getReport_position() {
		return report_position;
	}
	public void setReport_position(String report_position) {
		this.report_position = report_position;
	}
	public Timestamp getReport_date() {
		return report_date;
	}
	public void setReport_date(Timestamp report_date) {
		this.report_date = report_date;
	}
	public String getReport_contents() {
		return report_contents;
	}
	public void setReport_contents(String report_contents) {
		this.report_contents = report_contents;
	}
	public String getReport_check() {
		return report_check;
	}
	public void setReport_check(String report_check) {
		this.report_check = report_check;
	}
	
}
