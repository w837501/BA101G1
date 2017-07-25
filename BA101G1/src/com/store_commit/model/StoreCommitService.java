package com.store_commit.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import com.store.model.StoreVO;

public class StoreCommitService {

	private StoreCommitDAO_interface dao;
	
	public StoreCommitService(){
		dao = new StoreCommitDAO();
	}
	
	public StoreCommitVO addStoreCommit(String store_id , String mem_id , 
			String sc_content, Integer sc_score){

		StoreCommitVO scVO = new StoreCommitVO();
		scVO.setStore_id(store_id);
		scVO.setMem_id(mem_id);
		scVO.setSc_content(sc_content);
		scVO.setSc_score(sc_score);
		dao.insert(scVO);
		
		return scVO;
	}
	
	public StoreCommitVO updateStoreCommit(String sc_id , String store_id ,
			String mem_id , String sc_content , Timestamp sc_time , String sc_state){
		
		StoreCommitVO scVO = new StoreCommitVO();
		scVO.setSc_id(sc_id);
		scVO.setStore_id(store_id);
		scVO.setMem_id(mem_id);
		scVO.setSc_content(sc_content);
		scVO.setSc_time(sc_time);
		scVO.setSc_state(sc_state);
		dao.update(scVO);
		
		return scVO;
		
	}
	
	public void deleteStoreCommit(String sc_id){
		dao.delete(sc_id);
	}
	
	public StoreCommitVO getOneStoreCommit(String sc_id){
		return dao.findByPrimaryKey(sc_id);
	}
	
	public List<StoreCommitVO> getAll(){
		return dao.getAll();
	}
	
	public List<StoreCommitVO> getAllByStore_id(String store_id){
		return dao.getAllByStore_id(store_id);
	}
	
	
	
	
}
