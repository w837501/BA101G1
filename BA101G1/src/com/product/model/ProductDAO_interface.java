package com.product.model;

import java.util.List;

public interface ProductDAO_interface {
	public void insert(ProductVO productVO);
	public void update(ProductVO productVO);
	public void delete(String pro_id);
	public ProductVO findByPrimaryKey(String pro_id);
	public List<ProductVO> getAll();
	public List<ProductVO> findName(String pro_name);
	public List<ProductVO> ClassLink(String pc_id);
	public List<ProductVO> findProductByStore_id(String store_id);
}
