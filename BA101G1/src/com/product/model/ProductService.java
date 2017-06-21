package com.product.model;

import java.util.List;

import com.product.model.ProductDAO;
import com.product.model.ProductVO;

public class ProductService {
	
	private ProductDAO_interface dao;
	
	public ProductService() {
		dao = new ProductDAO();
	}
	
	public ProductVO addPro(String store_id, String pro_id, String pro_name, Number pro_price,Number pro_total, Number pro_state, byte[] pro_image,Number pro_type,String pro_content){
		ProductVO proVO=new ProductVO();
		
		proVO.setStore_id(store_id);
		proVO.setPro_id(pro_id);
		proVO.setPro_name(pro_name);
		proVO.setPro_price(pro_price);
		proVO.setPro_total(pro_total);
		proVO.setPro_state(pro_state);
		proVO.setPro_image(pro_image);
		proVO.setPro_type(pro_type);
		proVO.setPro_content(pro_content);
		
		dao.insert(proVO);
		
		return proVO;
	}
	
	public ProductVO updatePro(String store_id, String pro_id, String pro_name, Number pro_price,Number pro_total, Number pro_state, byte[] pro_image,Number pro_type,String pro_content){
		ProductVO proVO=new ProductVO();
		
		proVO.setStore_id(store_id);
		proVO.setPro_id(pro_id);
		proVO.setPro_name(pro_name);
		proVO.setPro_price(pro_price);
		proVO.setPro_total(pro_total);
		proVO.setPro_state(pro_state);
		proVO.setPro_image(pro_image);
		proVO.setPro_type(pro_type);
		proVO.setPro_content(pro_content);
		dao.update(proVO);
		
		return proVO;
		
	}
	public void deletePro(String Pro_id) {
		dao.delete(Pro_id);
	}
	public ProductVO getOneEmp(String pro_id) {
		return dao.findByPrimaryKey(pro_id);
	}
	public List<ProductVO> getAll() {
		return dao.getAll();
	}

}
