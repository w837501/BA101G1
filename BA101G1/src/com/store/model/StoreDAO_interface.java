package com.store.model;

import java.util.*;

import com.store_commit.model.StoreCommitVO;

public interface StoreDAO_interface {
	
	public void insert(StoreVO storeVO);
	public void update (StoreVO storeVO);
	public void delete(String store_id);

	public List<StoreVO> getAll();

	
	//0401新增  透過商家編號找出所有評價(註:商家類別編號Integer跟評價編號String都為sc_id)
	public Set<StoreCommitVO> getStoreCommitByStore_id(String store_id);

	public StoreVO findByPrimaryKey(String store_id);
	public List<StoreVO> findName(String store_name);
	public List<StoreVO> findZone(String store_zone);

}
