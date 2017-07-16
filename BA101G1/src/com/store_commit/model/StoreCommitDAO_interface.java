package com.store_commit.model;

import java.util.List;
import java.util.Set;

import com.store.model.StoreVO;

public interface StoreCommitDAO_interface {
	
	public void insert(StoreCommitVO storecommit);
	public void update(StoreCommitVO storecommit);
	public void delete(String sc_id);
	public StoreCommitVO findByPrimaryKey(String sc_id);
	public List<StoreCommitVO> getAll(); 
	public List<StoreCommitVO> getAllByStore_id(String store_id);
	
}
