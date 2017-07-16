package com.permission2.model;

import java.util.List;

import com.man.model.ManagerVO;
import com.permission_ability.model.Permission_AbilityVO;

public class PermissionService {

	private PermissionDAO_interface dao;
	
	public PermissionService(){
		dao = new PermissionDAO();
	}
	
	public PermissionVO addPermission(ManagerVO managerVO, Permission_AbilityVO pa_id){
		
		PermissionVO permissionVO = new PermissionVO();
		
		permissionVO.setManagerVO(managerVO);
		permissionVO.setPaVO(pa_id);
		dao.insert(permissionVO);
		
		return permissionVO;
	}
	
	public PermissionVO updatePermission(ManagerVO managerVO, Permission_AbilityVO pa_id){
		PermissionVO permissionVO = new PermissionVO();
		
		permissionVO.setManagerVO(managerVO);
		permissionVO.setPaVO(pa_id);
		dao.update(permissionVO);
		
		return permissionVO;
		
	}
	
	public void deletePermission(ManagerVO managerVO){
		dao.delete(managerVO);
	}
	
	public PermissionVO getOneRecord(ManagerVO managerVO){
		return dao.findByPrimaryKey(managerVO);
	}
	
	public List<PermissionVO>getAll(){
		return dao.getAll();
	}
}
