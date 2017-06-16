package com.store_commit.model;

import java.util.List;

public interface StoreCommitDAO_interface {
	
//	public void insert(StoreCommitVO storecommit);
//	public void update(StoreCommitVO storecommit);
//	public void delete(String sc_id);
//	public StoreCommitVO findByPrimaryKey(String sc_id);
	public List<StoreCommitVO> getAll(); 

}
