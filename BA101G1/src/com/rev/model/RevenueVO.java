package com.rev.model;

import java.io.Serializable;

public class RevenueVO implements Serializable{
	
	private String store_id;
	private String revenue_month;
	private String man_id;
	private Integer store_revenue;
	private String state;
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public String getRevenue_month() {
		return revenue_month;
	}
	public void setRevenue_month(String revenue_month) {
		this.revenue_month = revenue_month;
	}
	public String getMan_id() {
		return man_id;
	}
	public void setMan_id(String man_id) {
		this.man_id = man_id;
	}
	public Integer getStore_revenue() {
		return store_revenue;
	}
	public void setStore_revenue(Integer store_revenue) {
		this.store_revenue = store_revenue;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	

}
