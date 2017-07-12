package com.permission_ability.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Permission_AbilityVO implements Serializable{
	private String pa_id;
	private String pa_name;
	private Set<com.permission2.model.PermissionVO> permission = new HashSet<com.permission2.model.PermissionVO>();
	
	public String getPa_id() {
		return pa_id;
	}

	public void setPa_id(String pa_id) {
		this.pa_id = pa_id;
	}

	public String getPa_name() {
		return pa_name;
	}

	public void setPa_name(String pa_name) {
		this.pa_name = pa_name;
	}

	public Set<com.permission2.model.PermissionVO> getPermission() {
		return permission;
	}

	public void setPermission(Set<com.permission2.model.PermissionVO> permission) {
		this.permission = permission;
	}
	

}
