package com.mem.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class MemberVO implements Serializable{
	
	private String mem_id;
	private String mem_name;
	private String mem_phone;
	private String mem_pw;
	private String mem_mail;
	private String mem_state;
	private Number mem_report_count;
	private Timestamp mem_start_time;
	private Timestamp mem_end_time;
	private Number mem_money;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_mail() {
		return mem_mail;
	}
	public void setMem_mail(String mem_mail) {
		this.mem_mail = mem_mail;
	}
	public String getMem_state() {
		return mem_state;
	}
	public void setMem_state(String mem_state) {
		this.mem_state = mem_state;
	}
	public Number getMem_report_count() {
		return mem_report_count;
	}
	public void setMem_report_count(Number mem_report_count) {
		this.mem_report_count = mem_report_count;
	}
	public Timestamp getMem_start_time() {
		return mem_start_time;
	}
	public void setMem_start_time(Timestamp mem_start_time) {
		this.mem_start_time = mem_start_time;
	}
	public Timestamp getMem_end_time() {
		return mem_end_time;
	}
	public void setMem_end_time(Timestamp mem_end_time) {
		this.mem_end_time = mem_end_time;
	}
	public Number getMem_money() {
		return mem_money;
	}
	public void setMem_money(Number mem_money) {
		this.mem_money = mem_money;
	}
	

}
