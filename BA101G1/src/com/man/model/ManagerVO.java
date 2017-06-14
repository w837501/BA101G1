package com.man.model;

import java.io.Serializable;

public class ManagerVO implements Serializable{
	
	private String man_id;
	private String man_name;
	private String man_phone;
	private String man_pw;
	private String man_mail;
	
	
	public ManagerVO(String man_name, String man_phone, String man_pw, String man_mail) {
		super();
		this.man_name = man_name;
		this.man_phone = man_phone;
		this.man_pw = man_pw;
		this.man_mail = man_mail;
	}

	
	public ManagerVO(String man_id, String man_name, String man_phone, String man_pw, String man_mail) {
		super();
		this.man_id = man_id;
		this.man_name = man_name;
		this.man_phone = man_phone;
		this.man_pw = man_pw;
		this.man_mail = man_mail;
	}


	public String getMan_id() {
		return man_id;
	}

	public void setMan_id(String man_id) {
		this.man_id = man_id;
	}

	public String getMan_name() {
		return man_name;
	}

	public void setMan_name(String man_name) {
		this.man_name = man_name;
	}

	public String getMan_phone() {
		return man_phone;
	}

	public void setMan_phone(String man_phone) {
		this.man_phone = man_phone;
	}

	public String getMan_pw() {
		return man_pw;
	}

	public void setMan_pw(String man_pw) {
		this.man_pw = man_pw;
	}

	public String getMan_mail() {
		return man_mail;
	}

	public void setMan_mail(String man_mail) {
		this.man_mail = man_mail;
	}

	public ManagerVO() {
		// TODO Auto-generated constructor stub
	}

}
