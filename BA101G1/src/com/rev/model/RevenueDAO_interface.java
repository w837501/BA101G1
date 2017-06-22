package com.rev.model;

import java.sql.SQLException;
import java.util.List;


public interface RevenueDAO_interface {

	public void insert(RevenueVO revenueVO) throws SQLException ;
    public void update(RevenueVO revenueVO);
    public void delete(String store_id,String revenue_month);
    public RevenueVO findByPrimaryKey(String store_id,String revenue_month);
    public List<RevenueVO> getAll();
    public List<RevenueVO> getByStore(String store_id);
    public List<RevenueVO> getByMonth(String revenue_month);
    public List<RevenueVO> getSingleStore_id();
}
