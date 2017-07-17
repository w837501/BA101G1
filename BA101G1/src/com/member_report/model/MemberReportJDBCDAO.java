package com.member_report.model;

import java.util.*;
import java.sql.*;

public class MemberReportJDBCDAO implements MemberReportDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BA101G1";
	String passwd = "ba101g1";

	private static final String INSERT_STMT = 
		"INSERT INTO MEMBER_REPORT (mr_id,mem_id,order_id,sc_id,man_id,mr_content,mr_image,mr_time,mr_state,mr_result) VALUES ('MR'||'-'||LPAD(to_char(mr_seq.NEXTVAL),6,'0'), ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
		"SELECT* FROM MEMBER_REPORT order by mr_id";
	private static final String GET_ONE_STMT = 
		"SELECT mr_id,mem_id,order_id,sc_id,man_id,mr_content,mr_image,mr_time,mr_state,mr_result FROM MEMBER_REPORT where mr_id = ?";
	private static final String DELETE = 
		"DELETE FROM MEMBER_REPORT where mr_id = ?";
	private static final String UPDATE = 
		"UPDATE MEMBER_REPORT set mem_id=?, order_id=?, sc_id=?, man_id=?, mr_content=?, mr_image=?, mr_time=?, mr_state=?, mr_result=?  where mr_id = ?";

	@Override
	public void insert(MemberReportVO mrVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, mrId);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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

	public static void main(String[] args) {

		MemberReportJDBCDAO dao = new MemberReportJDBCDAO();

		// 新增
		MemberReportVO mrVO1 = new MemberReportVO();
		mrVO1.setMem_id("MEM-000002");
		mrVO1.setOrder_id("");
		mrVO1.setSc_id("SC-000002");
		mrVO1.setMan_id(new String("MAN-000002"));
		mrVO1.setMr_content(new String("一諾千金"));
		mrVO1.setMr_image(new byte[0]);
		mrVO1.setMr_time(java.sql.Timestamp.valueOf("2002-02-22 22:22:22"));
		mrVO1.setMr_state("審核中");
		mrVO1.setMr_result("");
		dao.insert(mrVO1);

		// 修改
		MemberReportVO mrVO2 = new MemberReportVO();
		mrVO2.setMr_id("MR-000001");
		mrVO2.setMem_id("MEM-000002");
		mrVO2.setOrder_id("20170614-000002");
		mrVO2.setSc_id(null);
		mrVO2.setMan_id(new String("MAN-000002"));
		mrVO2.setMr_content(new String("AD-000003"));
		mrVO2.setMr_image(null);
		mrVO2.setMr_time(java.sql.Timestamp.valueOf("2002-02-02 11:22:33"));
		mrVO2.setMr_state("已審核");
		mrVO2.setMr_result("未成立");
		dao.update(mrVO2);

		// 刪除
		dao.delete("MR-000004");

		// 查詢
		MemberReportVO mrVO3 = dao.findPrimaryKey("MR-000003");
		System.out.print(mrVO3.getMr_id() + ",");
		System.out.print(mrVO3.getMem_id() + ",");
		System.out.print(mrVO3.getOrder_id() + ",");
		System.out.print(mrVO3.getSc_id() + ",");
		System.out.print(mrVO3.getMan_id() + ",");
		System.out.print(mrVO3.getMr_content() + ",");
		System.out.print(mrVO3.getMr_image() + ",");
		System.out.print(mrVO3.getMr_time() + ",");
		System.out.print(mrVO3.getMr_state() + ",");
		System.out.print(mrVO3.getMr_result() + ",");
		System.out.println("---------------------");

		// 查詢
		List<MemberReportVO> list = dao.getAll();
		for (MemberReportVO aMR : list) {
			System.out.print(aMR.getMr_id() + ",");
			System.out.print(aMR.getMem_id() + ",");
			System.out.print(aMR.getOrder_id() + ",");
			System.out.print(aMR.getSc_id() + ",");
			System.out.print(aMR.getMan_id() + ",");
			System.out.print(aMR.getMr_content() + ",");
			System.out.print(aMR.getMr_image() + ",");
			System.out.print(aMR.getMr_time() + ",");
			System.out.print(aMR.getMr_state() + ",");
			System.out.print(aMR.getMr_result() + ",");
			System.out.println();
		}
	}

	@Override
	public List<MemberReportVO> findByMR_state(String mrState) {
		// TODO Auto-generated method stub
		return null;
	}
}