package com.store.model;

import java.util.List;

import com.store.model.StoreVO;

public class StoreService {
	
	private StoreDAO_interface dao;
	
	public StoreService(){
		dao = new StoreDAO();
	}
	public StoreVO addStore(Number sc_id, String store_name, String store_content, String store_phone,String store_addr, byte[] store_image, String store_pw,String store_acc,String store_out,String store_zone){
		StoreVO storeVO=new StoreVO();
		
		storeVO.setSc_id(sc_id);
		storeVO.setStore_name(store_name);
		storeVO.setStore_content(store_content);
		storeVO.setStore_phone(store_phone);
		storeVO.setStore_addr(store_addr);
		storeVO.setStore_image(store_image);
		storeVO.setStore_pw(store_pw);
		storeVO.setStore_acc(store_acc);
		storeVO.setStore_out(store_out);
		storeVO.setStore_zone(store_zone);
		
		dao.insert(storeVO);
		
		return storeVO;
	}
	
	public StoreVO updateStore(Number sc_id, String store_content, String store_phone, String store_addr,byte[] store_image, String store_out, String store_zone,String store_pw,String store_id){
		StoreVO storeVO=new StoreVO();
		
		storeVO.setSc_id(sc_id);
		storeVO.setStore_content(store_content);
		storeVO.setStore_phone(store_phone);
		storeVO.setStore_addr(store_addr);
		storeVO.setStore_image(store_image);
		storeVO.setStore_out(store_out);
		storeVO.setStore_zone(store_zone);
		storeVO.setStore_pw(store_pw);
		storeVO.setStore_id(store_id);
		dao.update(storeVO);
		
		return storeVO;
		
	}
	public void deleteStore(String store_id) {
		dao.delete(store_id);
	}
	public StoreVO getOneStore(String store_id) {
		return dao.findByPrimaryKey(store_id);
	}
	public List<StoreVO> getAll() {
		return dao.getAll();
	}
	public List<StoreVO> getName(String store_name) {
		return dao.findName(store_name);
	}
	public List<StoreVO> getZone(String store_zone) {
		return dao.findZone(store_zone);
	}
	public List<StoreVO> getStoreClass(String sc_id) {
		return dao.ClassLink(sc_id);
	}
}
