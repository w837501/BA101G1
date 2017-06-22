package com.product.model;

public class ProductVO implements java.io.Serializable {
	private String pro_id;
	private String store_id;
	private String pro_name;
	private Number pro_price;
	private Number pro_total;
	private Number pro_state;
	private byte[] pro_image;
	private Number pro_type;
	private String pro_content;
	
	public String getPro_id() {
		return pro_id;
	}
	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public Number getPro_price() {
		return pro_price;
	}
	public void setPro_price(Number pro_price) {
		this.pro_price = pro_price;
	}
	public Number getPro_total() {
		return pro_total;
	}
	public void setPro_total(Number pro_total) {
		this.pro_total = pro_total;
	}
	public Number getPro_state() {
		return pro_state;
	}
	public void setPro_state(Number pro_state) {
		this.pro_state = pro_state;
	}
	public byte[] getPro_image() {
		return pro_image;
	}
	public void setPro_image(byte[] pro_image) {
		this.pro_image = pro_image;
	}
	public Number getPro_type() {
		return pro_type;
	}
	public void setPro_type(Number pro_type) {
		this.pro_type = pro_type;
	}
	public String getPro_content() {
		return pro_content;
	}
	public void setPro_content(String pro_content) {
		this.pro_content = pro_content;
	}
}
