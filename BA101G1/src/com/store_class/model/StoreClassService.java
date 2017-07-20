package com.store_class.model;

import java.util.List;
import java.util.Set;

import com.store.model.StoreVO;

public class StoreClassService {
	
	private StoreClassDAO dao;
	
	public StoreClassService(){
		dao = new StoreClassDAO();
	}
	
	public List<StoreClassVO> getAll(){
		return dao.getAll();
	}
	public StoreClassVO getOneStoreClass(Integer sc_id){
		return dao.findByPrimaryKey(sc_id);
	}
	public Set<StoreVO> getStoresBySc_id(Integer sc_id){
		return dao.getStoresBySc_id(sc_id);
	}
}
