package com.member_report.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class MemberReportVO implements Serializable{
	private String mr_id;
	private String mem_id;
	private String order_id;
	private String sc_id;
	private String man_id;
	private String mr_content;
	private byte[] mr_image;
	private Timestamp mr_time;
	private String mr_state;
	private String mr_result;
	
	public MemberReportVO(){
		
	}

	public MemberReportVO(String mr_id, String mem_id, String order_id, String sc_id, String man_id, String mr_content,
			byte[] mr_image, Timestamp mr_time, String mr_state, String mr_result) {
		super();
		this.mr_id = mr_id;
		this.mem_id = mem_id;
		this.order_id = order_id;
		this.sc_id = sc_id;
		this.man_id = man_id;
		this.mr_content = mr_content;
		this.mr_image = mr_image;
		this.mr_time = mr_time;
		this.mr_state = mr_state;
		this.mr_result = mr_result;
	}

	public String getMr_id() {
		return mr_id;
	}

	public void setMr_id(String mr_id) {
		this.mr_id = mr_id;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getSc_id() {
		return sc_id;
	}

	public void setSc_id(String sc_id) {
		this.sc_id = sc_id;
	}

	public String getMan_id() {
		return man_id;
	}

	public void setMan_id(String man_id) {
		this.man_id = man_id;
	}

	public String getMr_content() {
		return mr_content;
	}

	public void setMr_content(String mr_content) {
		this.mr_content = mr_content;
	}

	public byte[] getMr_image() {
		return mr_image;
	}

	public void setMr_image(byte[] mr_image) {
		this.mr_image = mr_image;
	}

	public Timestamp getMr_time() {
		return mr_time;
	}

	public void setMr_time(Timestamp mr_time) {
		this.mr_time = mr_time;
	}

	public String getMr_state() {
		return mr_state;
	}

	public void setMr_state(String mr_state) {
		this.mr_state = mr_state;
	}

	public String getMr_result() {
		return mr_result;
	}

	public void setMr_result(String mr_result) {
		this.mr_result = mr_result;
	}

	

}
