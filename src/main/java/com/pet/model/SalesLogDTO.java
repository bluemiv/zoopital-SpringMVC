package com.pet.model;

public class SalesLogDTO {
	/*create table saleslog(
			  saleslog_key number CONSTRAINT saleslog_pk PRIMARY KEY,
			  saleslog_m_income number, --약품수익
			  saleslog_t_income number, --진료수익
			  saleslog_income number, --수익합
			  saleslog_spending number, --지출
			  saleslog_net_income number, --순수익
			  saleslog_year number, --년
			  saleslog_month number, --월
			  saleslog_day number, --일
			  saleslog_date Date, --date
			  store_code varchar2(500)
			);*/
	private int saleslog_key;
	private int saleslog_m_income;
	private int saleslog_t_income;
	private int saleslog_income;
	private int saleslog_spending;
	private int saleslog_net_income;
	private int saleslog_year;
	private int saleslog_month;
	private int saleslog_day;
	private String saleslog_date;
	private String store_code;
	public int getSaleslog_key() {
		return saleslog_key;
	}
	public void setSaleslog_key(int saleslog_key) {
		this.saleslog_key = saleslog_key;
	}
	public int getSaleslog_m_income() {
		return saleslog_m_income;
	}
	public void setSaleslog_m_income(int saleslog_m_income) {
		this.saleslog_m_income = saleslog_m_income;
	}
	public int getSaleslog_t_income() {
		return saleslog_t_income;
	}
	public void setSaleslog_t_income(int saleslog_t_income) {
		this.saleslog_t_income = saleslog_t_income;
	}
	
	public int getSaleslog_income() {
		return saleslog_income;
	}
	public void setSaleslog_income(int saleslog_income) {
		this.saleslog_income = saleslog_income;
	}
	public int getSaleslog_spending() {
		return saleslog_spending;
	}
	public void setSaleslog_spending(int saleslog_spending) {
		this.saleslog_spending = saleslog_spending;
	}
	public int getSaleslog_net_income() {
		return saleslog_net_income;
	}
	public void setSaleslog_net_income(int saleslog_net_income) {
		this.saleslog_net_income = saleslog_net_income;
	}
	public int getSaleslog_year() {
		return saleslog_year;
	}
	public void setSaleslog_year(int saleslog_year) {
		this.saleslog_year = saleslog_year;
	}
	public int getSaleslog_month() {
		return saleslog_month;
	}
	public void setSaleslog_month(int saleslog_month) {
		this.saleslog_month = saleslog_month;
	}
	public int getSaleslog_day() {
		return saleslog_day;
	}
	public void setSaleslog_day(int saleslog_day) {
		this.saleslog_day = saleslog_day;
	}
	
	public String getSaleslog_date() {
		return saleslog_date;
	}
	public void setSaleslog_date(String saleslog_date) {
		this.saleslog_date = saleslog_date;
	}
	public String getStore_code() {
		return store_code;
	}
	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}
}
