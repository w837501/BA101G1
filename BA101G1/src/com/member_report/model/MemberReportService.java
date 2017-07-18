package com.member_report.model;

import java.util.List;


public class MemberReportService {


	private MemberReportDAO_interface dao;

	public MemberReportService() {
		dao = new MemberReportJNDIDAO();
	}

	public MemberReportVO addMemberReport(String mem_id, String order_id, String sc_id,String mr_content, byte[] mr_image) {

		MemberReportVO mrVO = new MemberReportVO();

		mrVO.setMem_id(mem_id);
		mrVO.setOrder_id(order_id);
		mrVO.setSc_id(sc_id);
		mrVO.setMr_content(mr_content);
		mrVO.setMr_image(mr_image);
		dao.insert(mrVO);

		return mrVO;
	}

	public MemberReportVO updateMemberReport(String mr_id, String mem_id, String order_id,
			String sc_id, String man_id, String mr_content, byte[] mr_image, java.sql.Timestamp mr_time,
			String mr_state, String mr_result) {

		MemberReportVO mrVO = new MemberReportVO();

		mrVO.setMr_id(mr_id);
		mrVO.setMem_id(mem_id);
		mrVO.setOrder_id(order_id);
		mrVO.setSc_id(sc_id);
		mrVO.setMan_id(man_id);
		mrVO.setMr_content(mr_content);
		mrVO.setMr_image(mr_image);
		mrVO.setMr_time(mr_time);
		mrVO.setMr_state(mr_state);
		mrVO.setMr_result(mr_result);
		dao.update(mrVO);

		return mrVO;
	}

	public void deleteMemberReport(String mr_id) {
		dao.delete(mr_id);
	}

	public MemberReportVO getOneMemberReport(String mr_id) {
		return dao.findPrimaryKey(mr_id);
	}
	public List<MemberReportVO> getMemberReportByMem_id(String mem_id) {
		return dao.findbyMem_id(mem_id);
	}

	public List<MemberReportVO> getAll() {
		return dao.getAll();
	}
}
