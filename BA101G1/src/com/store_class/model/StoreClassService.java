package com.store_class.model;

import java.util.List;

public class StoreClassService {
	
	private StoreClassDAO dao;
	
	public StoreClassService(){
		dao = new StoreClassDAO();
	}
	
	public List<StoreClassVO> getAll(){
		return dao.getAll();
	}
	public StoreClassVO  getSC_name(Number sc_id){
		return dao.getSCname(sc_id);
	}
}
