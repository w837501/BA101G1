package com.rev.model;

import java.sql.SQLException;
import java.util.List;

import com.order.model.Store_OrderVO;


public class RevenueService {
private RevenueDAO_interface dao;
	
	public RevenueService() {
		dao = new RevenueDAO();
	}
	
	public RevenueVO addRev(String store_id, String revenue_month, String man_id, Integer store_revenue) throws SQLException{
		RevenueVO revVO=new RevenueVO();
		
		revVO.setStore_id(store_id);
		revVO.setRevenue_month(revenue_month);
		revVO.setMan_id(man_id);
		revVO.setStore_revenue(store_revenue);
		
		dao.insert(revVO);
		
		return revVO;
	}
	
	public RevenueVO updateRev(String store_id, String revenue_month, String man_id, Integer store_revenue,String state){
		RevenueVO revVO=new RevenueVO();
		
		revVO.setStore_id(store_id);
		revVO.setRevenue_month(revenue_month);
		revVO.setMan_id(man_id);
		revVO.setStore_revenue(store_revenue);
		revVO.setState(state);
		dao.update(revVO);
		
		return revVO;
		
	}
	public void deleteRev(String store_id, String revenue_month) {
		dao.delete(store_id,revenue_month);
	}
	public RevenueVO getOneRev(String store_id, String revenue_month) {
		return dao.findByPrimaryKey(store_id,revenue_month);
	}
	public List<RevenueVO> getAll() {
		return dao.getAll();
	}
	public List<RevenueVO> getByStore(String store_id) {
		return dao.getByStore(store_id);
	}
	public List<RevenueVO> getByMonth(String revenue_month) {
		return dao. getByMonth(revenue_month);
	}
	public List<RevenueVO> getSingleStore_id() {
		return dao.getSingleStore_id();
	}
	public List<Store_OrderVO> getMonthRevenue(String month){
		return dao.getMonthRevenue(month);
	}
}
