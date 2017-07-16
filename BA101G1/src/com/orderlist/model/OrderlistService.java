package com.orderlist.model;

import java.util.List;
import java.util.Vector;

import com.product.model.ProductVO;

public class OrderlistService {
private OrderlistDAO_interface dao;
	
	public OrderlistService(){
		dao = new OrderlistDAO();
	}
	
	public OrderlistVO addOrderlist(String order_id,ProductVO buylist){
		
		OrderlistVO orderlistVO = new OrderlistVO();
		orderlistVO.setOrder_id(order_id);
		orderlistVO.setPro_name(buylist.getPro_name());
		orderlistVO.setPro_id(buylist.getPro_id());
		orderlistVO.setOrder_amount((Integer) buylist.getQuantity());;
		orderlistVO.setPrice((Integer) buylist.getPro_price());
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
	
	public List<OrderlistVO> getOrderlist(String order_id){
		return dao.findByPrimaryKey(order_id);
	}
	
	public List<OrderlistVO> getAll(){
		return dao.getAll();
	}
	
	public List<OrderlistVO> getDetailOrder(String order_id, String pro_id){
		return dao.getDetailOrder(order_id, pro_id);
	}
	
	public String getDetailProIdByOrderId(String order_id){
		return dao.getDetailProIdByOrderId(order_id);
	}
}
