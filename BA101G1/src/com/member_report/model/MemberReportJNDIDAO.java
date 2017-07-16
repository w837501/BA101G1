package com.member_report.model;

import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.*;

public class MemberReportJNDIDAO implements MemberReportDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA101G1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_STMT = "INSERT INTO MEMBER_REPORT (mr_id,mem_id,order_id,sc_id,man_id,mr_content,mr_image,mr_time,mr_state,mr_result) VALUES ('MR'||'-'||LPAD(to_char(mr_seq.NEXTVAL),6,'0'), ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT * FROM MEMBER_REPORT order by mr_id";
	private static final String GET_ONE_STMT = "SELECT mr_id,mem_id,order_id,sc_id,man_id,mr_content,mr_image,mr_time,mr_state,mr_result FROM MEMBER_REPORT where mr_id = ?";
	private static final String DELETE = "DELETE FROM MEMBER_REPORT where mr_id = ?";
	private static final String UPDATE = "UPDATE MEMBER_REPORT set mem_id=?, order_id=?, sc_id=?, man_id=?, mr_content=?, mr_image=?, mr_time=?, mr_state=?, mr_result=?  where mr_id = ?";

	@Override
	public void insert(MemberReportVO mrVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, mrVO.getMem_id());
			pstmt.setString(2, mrVO.getOrder_id());
			pstmt.setString(3, mrVO.getSc_id());
			pstmt.setString(4, mrVO.getMan_id());
			pstmt.setString(5, mrVO.getMr_content());
			pstmt.setBytes(6, mrVO.getMr_image());
			pstmt.setTimestamp(7, mrVO.getMr_time());
			pstmt.setString(8, mrVO.getMr_state());
			pstmt.setString(9, mrVO.getMr_result());

			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void update(MemberReportVO mrVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, mrVO.getMem_id());
			pstmt.setString(2, mrVO.getOrder_id());
			pstmt.setString(3, mrVO.getSc_id());
			pstmt.setString(4, mrVO.getMan_id());
			pstmt.setString(5, mrVO.getMr_content());
			pstmt.setBytes(6, mrVO.getMr_image());
			pstmt.setTimestamp(7, mrVO.getMr_time());
			pstmt.setString(8, mrVO.getMr_state());
			pstmt.setString(9, mrVO.getMr_result());
			pstmt.setString(10, mrVO.getMr_id());

			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(String mrId) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, mrId);

			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public MemberReportVO findPrimaryKey(String mr_id) {

		MemberReportVO mrVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, mr_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				mrVO = new MemberReportVO();
				mrVO.setMr_id(rs.getString("mr_id"));
				mrVO.setMem_id(rs.getString("mem_id"));
				mrVO.setOrder_id(rs.getString("order_id"));
				mrVO.setSc_id(rs.getString("sc_id"));
				mrVO.setMan_id(rs.getString("man_id"));
				mrVO.setMr_content(rs.getString("mr_content"));
				mrVO.setMr_image(rs.getBytes("mr_image"));
				mrVO.setMr_time(rs.getTimestamp("mr_time"));
				mrVO.setMr_state(rs.getString("mr_state"));
				mrVO.setMr_result(rs.getString("mr_result"));
			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return mrVO;
	}

	@Override
	public List<MemberReportVO> getAll() {
		List<MemberReportVO> list = new ArrayList<MemberReportVO>();
		MemberReportVO mrVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				mrVO = new MemberReportVO();
				mrVO.setMr_id(rs.getString("mr_id"));
				mrVO.setMem_id(rs.getString("mem_id"));
				mrVO.setOrder_id(rs.getString("order_id"));
				mrVO.setSc_id(rs.getString("sc_id"));
				mrVO.setMan_id(rs.getString("man_id"));
				mrVO.setMr_content(rs.getString("mr_content"));
				mrVO.setMr_image(rs.getBytes("mr_image"));
				mrVO.setMr_time(rs.getTimestamp("mr_time"));
				mrVO.setMr_state(rs.getString("mr_state"));
				mrVO.setMr_result(rs.getString("mr_result"));
				list.add(mrVO); // Store the row in the list
			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
}