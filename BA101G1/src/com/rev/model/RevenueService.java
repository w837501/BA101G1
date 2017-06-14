package com.rev.model;

import java.util.List;


public class RevenueService {
private RevenueDAO_interface dao;
	
	public RevenueService() {
		dao = new RevenueDAO();
	}
	
	public RevenueVO addRev(String store_id, String revenue_month, String man_id, Number store_revenue,Number state){
		RevenueVO revVO=new RevenueVO();
		
		revVO.setStore_id(store_id);
		revVO.setRevenue_month(revenue_month);
		revVO.setMan_id(man_id);
		revVO.setStore_revenue(store_revenue);
		revVO.setState(state);
		
		dao.insert(revVO);
		
		return revVO;
	}
	
	public RevenueVO updateRev(String store_id, String revenue_month, String man_id, Number store_revenue,Number state){
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
	public RevenueVO getOneEmp(String store_id, String revenue_month) {
		return dao.findByPrimaryKey(store_id,revenue_month);
	}
	public List<RevenueVO> getAll() {
		return dao.getAll();
	}
}
