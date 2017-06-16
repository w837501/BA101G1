package com.store_report.model;

import java.util.List;

public class StoreReportService {

	private StoreReportDAO_interface dao;

	public StoreReportService() {
		dao = new StoreReportJNDIDAO();
	}

	public StoreReportVO addStoreReport(String store_id, String sc_id, String order_id,
			String man_id, String sr_content, byte[] sr_image, java.sql.Timestamp sr_time, 
			Integer sr_state, Integer sr_result) {

		StoreReportVO srVO = new StoreReportVO();

		srVO.setStore_id(store_id);
		srVO.setSc_id(sc_id);
		srVO.setOrder_id(order_id);
		srVO.setMan_id(man_id);
		srVO.setSr_content(sr_content);
		srVO.setSr_image(sr_image);
		srVO.setSr_time(sr_time);
		srVO.setSr_state(sr_state);
		srVO.setSr_result(sr_result);
		dao.insert(srVO);

		return srVO;
	}

	public StoreReportVO updateStoreReport(String sr_id, String store_id, String sc_id,
			String order_id, String man_id, String sr_content, byte[] sr_image, java.sql.Timestamp sr_time,
			Integer sr_state, Integer sr_result) {

		StoreReportVO srVO = new StoreReportVO();

		srVO.setSr_id(sr_id);
		srVO.setStore_id(store_id);
		srVO.setSc_id(sc_id);
		srVO.setOrder_id(order_id);
		srVO.setMan_id(man_id);
		srVO.setSr_content(sr_content);
		srVO.setSr_image(sr_image);
		srVO.setSr_time(sr_time);
		srVO.setSr_state(sr_state);
		srVO.setSr_result(sr_result);
		dao.update(srVO);

		return srVO;
	}

	public void deleteStoreReport(String sr_id) {
		dao.delete(sr_id);
	}

	public StoreReportVO getOneStoreReport(String sr_id) {
		return dao.findPrimaryKey(sr_id);
	}

	public List<StoreReportVO> getAll() {
		return dao.getAll();
	}
}
