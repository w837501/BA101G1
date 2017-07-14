package com.permission2.model;

import java.util.List;

import com.permission_ability.model.Permission_AbilityVO;

public class PermissionService {

	private PermissionDAO_interface dao;
	
	public PermissionService(){
		dao = new PermissionDAO();
	}
	
	public PermissionVO addPermission(String man_id, Permission_AbilityVO pa_id){
		
		PermissionVO permissionVO = new PermissionVO();
		
		permissionVO.setMan_id(man_id);
		permissionVO.setPaVO(pa_id);
		dao.insert(permissionVO);
		
		return permissionVO;
	}
	
	public PermissionVO updatePermission(String man_id, Permission_AbilityVO pa_id){
		PermissionVO permissionVO = new PermissionVO();
		
		permissionVO.setMan_id(man_id);
		permissionVO.setPaVO(pa_id);
		dao.update(permissionVO);
		
		return permissionVO;
		
	}
	
	public void deletePermission(String man_id){
		dao.delete(man_id);
	}
	
	public PermissionVO getOneRecord(String man_id){
		return dao.findByPrimaryKey(man_id);
	}
	
	public List<PermissionVO>getAll(){
		return dao.getAll();
	}
}
