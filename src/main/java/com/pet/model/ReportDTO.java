package com.pet.model;
import java.sql.Timestamp;

public class ReportDTO {

	private String report_storeName;
	private String report_position;
	private Timestamp report_date=null; 
	private String report_writer;
	private String report_contents;
	public String getReport_storeName() {
		return report_storeName;
	}
	public void setReport_storeName(String report_storeName) {
		this.report_storeName = report_storeName;
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
	public String getReport_writer() {
		return report_writer;
	}
	public void setReport_writer(String report_writer) {
		this.report_writer = report_writer;
	}
	public String getReport_contents() {
		return report_contents;
	}
	public void setReport_contents(String report_contents) {
		this.report_contents = report_contents;
	} 
	
	
	
	
}
