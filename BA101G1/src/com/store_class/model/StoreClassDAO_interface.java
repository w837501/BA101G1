package com.store_class.model;

import java.util.List;
import java.util.Set;

import com.store.model.StoreVO;

public interface StoreClassDAO_interface {
	
	public StoreClassVO findByPrimaryKey(Integer sc_id);
	
	
	public List<StoreClassVO> getAll();
	
	
	public Set<StoreVO> getStoresBySc_id(Integer sc_id);
}
