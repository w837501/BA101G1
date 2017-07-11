package com.order.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Store_OrderVO implements Serializable{
	private String order_id;
	private Timestamp order_time;
	private String mem_id;
	private String store_id;
	private String order_state;
	private Integer totalprice;
	private String order_way;
	private String receive_address;
	private String order_note;
	private Timestamp order_taketime;
	private String store_name;
	private String pro_id;
	private String sum_totalprice;
	
	public Store_OrderVO() {
		super();
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public Timestamp getOrder_time() {
		return order_time;
	}

	public void setOrder_time(Timestamp order_time) {
		this.order_time = order_time;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}

	public String getOrder_state() {
		return order_state;
	}

	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}

	public Integer getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(Integer totalprice) {
		this.totalprice = totalprice;
	}

	public String getOrder_way() {
		return order_way;
	}

	public void setOrder_way(String order_way) {
		this.order_way = order_way;
	}

	public String getReceive_address() {
		return receive_address;
	}

	public void setReceive_address(String receive_address) {
		this.receive_address = receive_address;
	}



	public String getOrder_note() {
		return order_note;
	}

	public void setOrder_note(String order_note) {
		this.order_note = order_note;
	}

	public Timestamp getOrder_taketime() {
		return order_taketime;
	}

	public void setOrder_taketime(Timestamp order_taketime) {
		this.order_taketime = order_taketime;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getPro_id() {
		return pro_id;
	}

	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}

	public String getSum_totalprice() {
		return sum_totalprice;
	}

	public void setSum_totalprice(String sum_totalprice) {
		this.sum_totalprice = sum_totalprice;
	}
}
