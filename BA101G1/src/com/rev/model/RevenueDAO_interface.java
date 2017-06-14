package com.rev.model;

import java.util.List;


public interface RevenueDAO_interface {

	public void insert(RevenueVO revenueVO);
    public void update(RevenueVO revenueVO);
    public void delete(String store_id,String revenue_month);
    public RevenueVO findByPrimaryKey(String store_id,String revenue_month);
    public List<RevenueVO> getAll();
}
