package com.store_report.model;

import java.util.List;

public interface StoreReportDAO_interface {
	public void insert(StoreReportVO srVO);
	public void update(StoreReportVO srVO);
	public void delete(String sr_id);
	public StoreReportVO findPrimaryKey(String sr_id);
	public List<StoreReportVO> getAll();
	public List<StoreReportVO> getReportByStore_id(String store_id);
}
