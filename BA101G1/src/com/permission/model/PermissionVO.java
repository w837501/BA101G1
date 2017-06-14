package com.permission.model;

import java.io.Serializable;

public class PermissionVO implements Serializable{
	private String man_id;
	private String pa_id;
	
	public PermissionVO() {
		super();
	}
	public String getMan_id() {
		return man_id;
	}
	public void setMan_id(String man_id) {
		this.man_id = man_id;
	}
	public String getPa_id() {
		return pa_id;
	}
	public void setPa_id(String pa_id) {
		this.pa_id = pa_id;
	}
	
}
