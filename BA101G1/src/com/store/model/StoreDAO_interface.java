package com.store.model;

import java.sql.SQLException;
import java.util.*;

public interface StoreDAO_interface {
	
//	public void insert(StoreVO store);
//	public void update (StoreVO store);
//	public void delete(String store_id);
//	public StoreVO findByPrimaryKey(String store_id);
	public List<StoreVO> getAll();
	
	

}
