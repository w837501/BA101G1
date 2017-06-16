package com.ad.model;

import java.sql.Timestamp;

public class AdVO implements java.io.Serializable{
	private String ad_id;
	private String store_id;
	private String ad_name;
	private String ad_content;
	private byte[] ad_image;
	private Timestamp ad_time;
	private Number ad_state;
	private String ad_push_content;
	
	public String getAd_id() {
		return ad_id;
	}
	public void setAd_id(String ad_id) {
		this.ad_id = ad_id;
	}
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public String getAd_name() {
		return ad_name;
	}
	public void setAd_name(String ad_name) {
		this.ad_name = ad_name;
	}
	public String getAd_content() {
		return ad_content;
	}
	public void setAd_content(String ad_content) {
		this.ad_content = ad_content;
	}
	public byte[] getAd_image() {
		return ad_image;
	}
	public void setAd_image(byte[] ad_image) {
		this.ad_image = ad_image;
	}
	public Timestamp getAd_time() {
		return ad_time;
	}
	public void setAd_time(Timestamp ad_time) {
		this.ad_time = ad_time;
	}
	public Number getAd_state() {
		return ad_state;
	}
	public void setAd_state(Number ad_state) {
		this.ad_state = ad_state;
	}
	public String getAd_push_content() {
		return ad_push_content;
	}
	public void setAd_push_content(String ad_push_content) {
		this.ad_push_content = ad_push_content;
	}
	
	
}
