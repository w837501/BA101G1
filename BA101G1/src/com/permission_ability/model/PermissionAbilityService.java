package com.permission_ability.model;

import java.util.List;

public class PermissionAbilityService {

	private Permission_AbilityDAO_interface dao;
	
	public PermissionAbilityService(){
		dao = new PermissionAbilityDAO();
	}
	//wrong 
	public Permission_AbilityVO addPermission(String man_id, String pa_id){
		
		Permission_AbilityVO paVO = new Permission_AbilityVO();
		
		paVO.setPa_id(man_id);
		paVO.setPa_name(pa_id);
		dao.insert(paVO);
		
		return paVO;
	}
	//wrong 
	public Permission_AbilityVO updatePermission(String man_id, String pa_id){
		Permission_AbilityVO paVO = new Permission_AbilityVO();
		
		paVO.setPa_id(man_id);
		paVO.setPa_id(pa_id);
		dao.update(paVO);
		
		return paVO;
		
	}
	//wrong 
	public void deletePermission(String pa_id){
		dao.delete(pa_id);
	}
	
	public Permission_AbilityVO findByPrimaryKey(String pano){
		return dao.findByPrimaryKey(pano);
	}
	
	public List<Permission_AbilityVO> getAll(){
		return dao.getAll();
	}
	
	public Permission_AbilityVO addPA(String pa_id, String pa_name){
		Permission_AbilityVO paVO = new Permission_AbilityVO();
		
		paVO.setPa_id(pa_id);
		paVO.setPa_name(pa_name);
		dao.insert(paVO);
		
		return paVO;
		
	}
}
