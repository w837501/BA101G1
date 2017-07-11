package com.product.model;

import java.util.List;

import com.product.model.ProductDAO;
import com.product.model.ProductVO;
import com.store.model.StoreVO;

public class ProductService {
	
	private ProductDAO_interface dao;
	
	public ProductService() {
		dao = new ProductDAO();
	}
	
	public ProductVO addPro(String store_id, String pro_name, Number pro_price, String pro_state, byte[] pro_image,String pc_id,String pro_content){
		ProductVO proVO=new ProductVO();
		
		proVO.setStore_id(store_id);
		proVO.setPro_name(pro_name);
		proVO.setPro_price(pro_price);
		proVO.setPro_state(pro_state);
		proVO.setPro_image(pro_image);
		proVO.setPc_id(pc_id);
		proVO.setPro_content(pro_content);
		
		dao.insert(proVO);
		
		return proVO;
	}
	
	public ProductVO updatePro(String store_id, String pro_id, String pro_name, Number pro_price, String pro_state, byte[] pro_image,String pc_id,String pro_content){
		ProductVO proVO=new ProductVO();
		
		proVO.setStore_id(store_id);
		proVO.setPro_id(pro_id);
		proVO.setPro_name(pro_name);
		proVO.setPro_price(pro_price);
		proVO.setPro_state(pro_state);
		proVO.setPro_image(pro_image);
		proVO.setPc_id(pc_id);
		proVO.setPro_content(pro_content);
		dao.update(proVO);
		
		return proVO;
		
	}
	public void deleteRev(String Pro_id) {
		dao.delete(Pro_id);
	}
	public ProductVO getOnePro(String pro_id) {
		return dao.findByPrimaryKey(pro_id);
	}
	public List<ProductVO> getAll() {
		return dao.getAll();
	}
	public List<ProductVO> getName(String pro_name) {
		return dao.findName(pro_name);
	}
	public List<ProductVO> getProductClass(String pc_id) {
		return dao.ClassLink(pc_id);
	}
	public List<ProductVO> getProductByStore(String store_id){
		return dao.findProductByStore_id(store_id);
	}
}
