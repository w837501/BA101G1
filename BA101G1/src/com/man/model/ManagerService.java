package com.man.model;

import java.util.List;



public class ManagerService {
	private ManagerDAO_interface dao;
	
	public ManagerService() {
		dao = new ManagerDAO();
	}
	
	public ManagerVO addMan(String man_name, String man_phone, String man_pw, String man_mail){
		ManagerVO manVO=new ManagerVO();
		
		manVO.setMan_name(man_name);
		manVO.setMan_phone(man_phone);
		manVO.setMan_pw(man_pw);
		manVO.setMan_mail(man_mail);
		
		dao.insert(manVO);
		
		return manVO;
	}
	
	public ManagerVO updateMan(String man_id, String man_name, String man_phone, String man_pw, String man_mail){
		ManagerVO manVO=new ManagerVO();
		
		manVO.setMan_id(man_id);
		manVO.setMan_name(man_name);
		manVO.setMan_phone(man_phone);
		manVO.setMan_pw(man_pw);
		manVO.setMan_mail(man_mail);
		dao.update(manVO);
		
		return manVO;
		
	}
	public void deleteMan(String man_id) {
		dao.delete(man_id);
	}
	public ManagerVO getOneMan(String man_id) {
		return dao.findByPrimaryKey(man_id);
	}
	public List<ManagerVO> getAll() {
		return dao.getAll();
	}


	
	
}
