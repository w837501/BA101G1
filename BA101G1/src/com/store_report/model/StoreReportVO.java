package com.store_report.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class StoreReportVO implements Serializable{
	private String sr_id;
	private String store_id;
	private String sc_id;
	private String order_id;
	private String man_id;
	private String sr_content;
	private byte[] sr_image;
	private Timestamp sr_time;
	private String sr_state;
	private String sr_result;
	
	public StoreReportVO(){
		
	}



	public StoreReportVO(String sr_id, String store_id, String sc_id, String order_id, String man_id, String sr_content,
			byte[] sr_image, Timestamp sr_time, String sr_state, String sr_result) {
		super();
		this.sr_id = sr_id;
		this.store_id = store_id;
		this.sc_id = sc_id;
		this.order_id = order_id;
		this.man_id = man_id;
		this.sr_content = sr_content;
		this.sr_image = sr_image;
		this.sr_time = sr_time;
		this.sr_state = sr_state;
		this.sr_result = sr_result;
	}



	public String getSr_id() {
		return sr_id;
	}

	public void setSr_id(String sr_id) {
		this.sr_id = sr_id;
	}

	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}

	public String getSc_id() {
		return sc_id;
	}

	public void setSc_id(String sc_id) {
		this.sc_id = sc_id;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getMan_id() {
		return man_id;
	}

	public void setMan_id(String man_id) {
		this.man_id = man_id;
	}

	public String getSr_content() {
		return sr_content;
	}

	public void setSr_content(String sr_content) {
		this.sr_content = sr_content;
	}

	public byte[] getSr_image() {
		return sr_image;
	}

	public void setSr_image(byte[] sr_image) {
		this.sr_image = sr_image;
	}

	public Timestamp getSr_time() {
		return sr_time;
	}

	public void setSr_time(Timestamp sr_time) {
		this.sr_time = sr_time;
	}

	public String getSr_state() {
		return sr_state;
	}

	public void setSr_state(String sr_state) {
		this.sr_state = sr_state;
	}

	public String getSr_result() {
		return sr_result;
	}

	public void setSr_result(String sr_result) {
		this.sr_result = sr_result;
	}


	

	

}
