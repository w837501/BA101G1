package com.store.model;

import java.sql.SQLException;
import java.util.*;

import com.store_class.model.StoreClassVO;

public interface StoreDAO_interface {
	
	public void insert(StoreVO storeVO);
	public void update (StoreVO storeVO);
	public void delete(String store_id);
	public List<StoreVO> getAll();
	public StoreVO findByPrimaryKey(String store_id);
	public List<StoreVO> findName(String store_name);
	public List<StoreVO> findZone(String store_zone);
	public List<StoreVO> ClassLink(String sc_name);
	public void update2(StoreVO storeVO);
	public List<StoreVO> findHot(Number store_star);
}
