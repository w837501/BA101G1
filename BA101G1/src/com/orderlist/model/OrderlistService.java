package com.orderlist.model;

import java.util.List;

public class OrderlistService {
private OrderlistDAO_interface dao;
	
	public OrderlistService(){
		dao = new OrderlistDAO();
	}
	
	public OrderlistVO addOrderlist(String order_id, String pro_id){
		
		OrderlistVO orderlistVO = new OrderlistVO();
		
		orderlistVO.setOrder_id(order_id);
		orderlistVO.setPro_id(pro_id);
		dao.insert(orderlistVO);
		
		return orderlistVO;
	}
	
	public OrderlistVO updateOrderlist(String order_id, String pro_id){
		OrderlistVO orderlistVO = new OrderlistVO();
		
		orderlistVO.setOrder_id(order_id);
		orderlistVO.setPro_id(pro_id);
		dao.update(orderlistVO);
		
		return orderlistVO;
		
	}
	
	public void deleteOrderlist(String order_id, String pro_id){
		dao.delete(order_id,pro_id);
	}
	
	public OrderlistVO getOneRecord(String order_id, String pro_id){
		return dao.findByPrimaryKey(order_id, pro_id);
	}
	
	public List<OrderlistVO> getAll(){
		return dao.getAll();
	}
	
	public List<OrderlistVO> getDetailOrder(String order_id, String pro_id){
		return dao.getDetailOrder(order_id, pro_id);
	}
}
