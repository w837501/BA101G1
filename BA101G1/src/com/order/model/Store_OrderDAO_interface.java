package com.order.model;

import java.util.*;

import com.product.model.ProductVO;

public interface Store_OrderDAO_interface {
	public void insert(Store_OrderVO orderVO);
	public void insertOrderandOrderList(Store_OrderVO orderVO,Vector<ProductVO> buylist);
	public void update(Store_OrderVO orderVO);
	public void delete(String order_id);
	public Store_OrderVO findByPrimaryKey(String order_id);
	public List<Store_OrderVO> getAll();
	public List<Store_OrderVO> findOrderByMem(String mem_id);
	public List<Store_OrderVO> findOrderByStore_id(String store_id);
	public List<Store_OrderVO> findOrderByState(String state,String store_id);
	public List<Store_OrderVO> findOrderByStateHandleing(String store_id);
	public void confirm_order(String order_id,String order_state);
}
