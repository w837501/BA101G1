package com.product_class.model;

import java.util.List;
import java.util.Set;

import com.store.model.StoreVO;

public interface ProductClassDAO_interface {
	
	public void update (ProductClassVO productclassVO);
	public List<ProductClassVO> getAll();
	public List<ProductClassVO> getProductClassById(String sc_id);
}
