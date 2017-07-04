package com.product_class.model;

public class ProductClassVO {
	private String pc_id;
	private String pc_name;
	private byte[] pc_pic;
	
	public String getPc_id() {
		return pc_id;
	}
	public void setPc_id(String pc_id) {
		this.pc_id = pc_id;
	}
	public String getPc_name() {
		return pc_name;
	}
	public void setPc_name(String pc_name) {
		this.pc_name = pc_name;
	}
	public byte[] getPc_pic() {
		return pc_pic;
	}
	public void setPc_pic(byte[] pc_pic) {
		this.pc_pic = pc_pic;
	}
}
