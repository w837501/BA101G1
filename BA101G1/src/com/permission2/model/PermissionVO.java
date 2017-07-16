package com.permission2.model;

import java.io.Serializable;

import com.man.model.ManagerVO;
import com.permission_ability.model.Permission_AbilityVO;

public class PermissionVO implements Serializable{
	private ManagerVO managerVO;
	private Permission_AbilityVO paVO;
	
	public PermissionVO() {
		super();
	}
	

	public ManagerVO getManagerVO() {
		return managerVO;
	}


	public void setManagerVO(ManagerVO managerVO) {
		this.managerVO = managerVO;
	}


	public Permission_AbilityVO getPaVO() {
		return paVO;
	}
	public void setPaVO(Permission_AbilityVO paVO) {
		this.paVO = paVO;
	}
	
}
