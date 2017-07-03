package com.product_class.model;

import java.util.List;

import com.store_class.model.StoreClassVO;

public class ProductClassService {
	
	private ProductClassDAO dao;
	
	public ProductClassService(){
		dao = new ProductClassDAO();
	}
	
	public List<ProductClassVO> getAll(){
		return dao.getAll();
	}
	
	public List<ProductClassVO> getProductClassById(String pc_id){
		return dao.getProductClassById(pc_id);
	}
}
