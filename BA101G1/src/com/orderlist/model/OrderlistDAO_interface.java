package com.orderlist.model;

import java.util.List;

public interface OrderlistDAO_interface {
	public void insert(OrderlistVO orderlistVO);
    public void update(OrderlistVO orderVO);
    public void delete(String order_id, String pro_id);
    public OrderlistVO findByPrimaryKey(String order_id, String pro_id);
    public List<OrderlistVO> getAll();
	public List<OrderlistVO> getDetailOrder(String order_id, String pro_id);
}
