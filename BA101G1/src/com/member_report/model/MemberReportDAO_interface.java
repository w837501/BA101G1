package com.member_report.model;

import java.util.List;

public interface MemberReportDAO_interface {
	public void insert(MemberReportVO mrVO);
	public void update(MemberReportVO mrVO);
	public void delete(String mrId);
	public MemberReportVO findPrimaryKey(String mrId);
	public List<MemberReportVO> getAll();
	public List<MemberReportVO> findbyMem_id(String mem_id);
}
