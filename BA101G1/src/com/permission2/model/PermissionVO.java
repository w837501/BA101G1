package com.permission2.model;

import java.io.Serializable;

import com.permission_ability.model.Permission_AbilityVO;

public class PermissionVO implements Serializable{
	private String man_id;
	private Permission_AbilityVO paVO;
	
	public PermissionVO() {
		super();
	}
	public String getMan_id() {
		return man_id;
	}
	public void setMan_id(String man_id) {
		this.man_id = man_id;
	}

	public Permission_AbilityVO getPaVO() {
		return paVO;
	}
	public void setPaVO(Permission_AbilityVO paVO) {
		this.paVO = paVO;
	}
	
}
