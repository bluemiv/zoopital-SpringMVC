package com.pet.model;

public class CalendarDTO {

	private int reserve_code;
	private String title;
	private String start;
	private String end;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public int getReserve_code() {
		return reserve_code;
	}
	public void setReserve_code(int reserve_code) {
		this.reserve_code = reserve_code;
	}
	
	
}
