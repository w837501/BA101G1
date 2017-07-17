package com.member_report.model;

import java.util.List;

public interface MemberReportDAO_interface {
	public void insert(MemberReportVO mrVO);
	public void update(MemberReportVO mrVO);
	public void delete(String mrId);
	public MemberReportVO findPrimaryKey(String mrId);
	public List<MemberReportVO> findByMR_state(String mrState);
	public List<MemberReportVO> getAll();
}
