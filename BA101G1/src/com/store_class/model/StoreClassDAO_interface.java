package com.store_class.model;

import java.util.List;
import java.util.Set;

import com.store.model.StoreVO;

public interface StoreClassDAO_interface {
	public void update (StoreClassVO storeclassVO);
	public List<StoreClassVO> getAll();
	
}
