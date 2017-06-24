package com.store_class.model;

import java.util.List;
import java.util.Set;

import com.store.model.StoreVO;

public interface StoreClassDAO_interface {
	
	public List<StoreClassVO> getAll();
	
	//0401新增   透過商家類別編號找出所有商家 (註:商家類別編號Integer跟評價編號String都為sc_id)
	public Set<StoreVO> getStoresBySc_id(Integer sc_id);

}
