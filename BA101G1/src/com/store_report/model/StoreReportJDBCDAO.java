package com.store_report.model;

import java.util.*;

import java.sql.*;

public class StoreReportJDBCDAO implements StoreReportDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BA101G1";
	String passwd = "ba101g1";

	private static final String INSERT_STMT = 
		"INSERT INTO STORE_REPORT (sr_id,store_id,sc_id,order_id,sr_content,sr_image) VALUES ('SR'||'-'||LPAD(to_char(sr_seq.NEXTVAL),6,'0'), ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
		"SELECT * FROM STORE_REPORT order by sr_id";
	private static final String GET_ONE_STMT = 
		"SELECT * FROM STORE_REPORT where sr_id = ?";
	private static final String DELETE = 
		"DELETE FROM STORE_REPORT where sr_id = ?";
	private static final String UPDATE = 
		"UPDATE STORE_REPORT set store_id=?, sc_id=?, order_id=?, man_id=?, sr_content=?, sr_image=?, sr_time=?, sr_state=?, sr_result=?  where sr_id = ?";
	private static final String GET_BY_STORE_ID = "select *  FROM STORE_REPORT where store_id=?";

	@Override
	public void insert(StoreReportVO srVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, srVO.getStore_id());
			pstmt.setString(2, srVO.getSc_id());
			pstmt.setString(3, srVO.getOrder_id());
			pstmt.setString(4, srVO.getSr_content());
			pstmt.setBytes(5, srVO.getSr_image());

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
	public void update(StoreReportVO srVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, srVO.getStore_id());
			pstmt.setString(2, srVO.getSc_id());
			pstmt.setString(3, srVO.getOrder_id());
			pstmt.setString(4, srVO.getMan_id());
			pstmt.setString(5, srVO.getSr_content());
			pstmt.setBytes(6, srVO.getSr_image());
			pstmt.setTimestamp(7, srVO.getSr_time());
			pstmt.setString(8, srVO.getSr_state());
			pstmt.setString(9, srVO.getSr_result());
			pstmt.setString(10, srVO.getSr_id());

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
	public void delete(String srId) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, srId);

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
	public StoreReportVO findPrimaryKey(String sr_id) {

		StoreReportVO srVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, sr_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				srVO = new StoreReportVO();
				srVO.setSr_id(rs.getString("sr_id"));
				srVO.setStore_id(rs.getString("store_id"));
				srVO.setSc_id(rs.getString("sc_id"));
				srVO.setOrder_id(rs.getString("order_id"));
				srVO.setMan_id(rs.getString("man_id"));
				srVO.setSr_content(rs.getString("sr_content"));
				srVO.setSr_image(null);
				srVO.setSr_time(rs.getTimestamp("sr_time"));
				srVO.setSr_state(rs.getString("sr_state"));
				srVO.setSr_result(rs.getString("sr_result"));
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
		return srVO;
	}

	@Override
	public List<StoreReportVO> getAll() {
		List<StoreReportVO> list = new ArrayList<StoreReportVO>();
		StoreReportVO srVO = null;

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
				srVO = new StoreReportVO();
				srVO.setSr_id(rs.getString("sr_id"));
				srVO.setStore_id(rs.getString("store_id"));
				srVO.setSc_id(rs.getString("sc_id"));
				srVO.setOrder_id(rs.getString("order_id"));
				srVO.setMan_id(rs.getString("man_id"));
				srVO.setSr_content(rs.getString("sr_content"));
				srVO.setSr_image(rs.getBytes("sr_image"));
				srVO.setSr_time(rs.getTimestamp("sr_time"));
				srVO.setSr_state(rs.getString("sr_state"));
				srVO.setSr_result(rs.getString("sr_result"));
				list.add(srVO); // Store the row in the list
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

		StoreReportJDBCDAO dao = new StoreReportJDBCDAO();

		// 新增
//		StoreReportVO srVO1 = new StoreReportVO();
//		srVO1.setStore_id("STO-000002");
//		srVO1.setSc_id("SC-000003");
//		srVO1.setOrder_id(null);
//		srVO1.setMan_id(new String("MAN-000003"));
//		srVO1.setSr_content(new String("新垣結衣我老婆"));
//		srVO1.setSr_image(new byte[0]);
//		srVO1.setSr_time(java.sql.Timestamp.valueOf("2003-03-31 03:33:33"));
//		srVO1.setSr_state("已審核");
//		srVO1.setSr_result("成立");
//		dao.insert(srVO1);
//
//		// 修改
//		StoreReportVO srVO2 = new StoreReportVO();
//		srVO2.setSr_id("SR-000001");
//		srVO2.setStore_id("STO-000003");
//		srVO2.setSc_id(null);
//		srVO2.setOrder_id("20170614-000002");
//		srVO2.setMan_id(new String("MAN-000002"));
//		srVO2.setSr_content(new String("吳永志吳永志"));
//		srVO2.setSr_image(null);
//		srVO2.setSr_time(java.sql.Timestamp.valueOf("2001-01-01 11:11:11"));
//		srVO2.setSr_state("已審核");
//		srVO2.setSr_result("不成立");
//		dao.update(srVO2);
//
//		// 刪除
//		dao.delete("SR-000004");
//
//		// 查詢
//		StoreReportVO srVO3 = dao.findPrimaryKey("SR-000002");
//		System.out.print(srVO3.getSr_id() + ",");
//		System.out.print(srVO3.getStore_id() + ",");
//		System.out.print(srVO3.getSc_id() + ",");
//		System.out.print(srVO3.getOrder_id() + ",");
//		System.out.print(srVO3.getMan_id() + ",");
//		System.out.print(srVO3.getSr_content() + ",");
//		System.out.print(srVO3.getSr_image() + ",");
//		System.out.print(srVO3.getSr_time() + ",");
//		System.out.print(srVO3.getSr_state() + ",");
//		System.out.print(srVO3.getSr_result() + ",");
//		System.out.println("---------------------");

		// 查詢
		List<StoreReportVO> list = dao.getReportByStore_id("STO-000001");
		for (StoreReportVO aSR : list) {
			System.out.print(aSR.getSr_id() + ",");
			System.out.print(aSR.getStore_id() + ",");
			System.out.print(aSR.getSc_id() + ",");
			System.out.print(aSR.getOrder_id() + ",");
			System.out.print(aSR.getMan_id() + ",");
			System.out.print(aSR.getSr_content() + ",");
			System.out.print(aSR.getSr_image() + ",");
			System.out.print(aSR.getSr_time() + ",");
			System.out.print(aSR.getSr_state() + ",");
			System.out.print(aSR.getSr_result() + ",");
			System.out.println();
		}
	}

	@Override
	public List<StoreReportVO> getReportByStore_id(String store_id) {
		List<StoreReportVO> list = new ArrayList<StoreReportVO>();
		StoreReportVO srVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_BY_STORE_ID);
			pstmt.setString(1, store_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				srVO = new StoreReportVO();
				srVO.setSr_id(rs.getString("sr_id"));
				srVO.setStore_id(rs.getString("store_id"));
				srVO.setSc_id(rs.getString("sc_id"));
				srVO.setOrder_id(rs.getString("order_id"));
				srVO.setMan_id(rs.getString("man_id"));
				srVO.setSr_content(rs.getString("sr_content"));
				srVO.setSr_image(rs.getBytes("sr_image"));
				srVO.setSr_time(rs.getTimestamp("sr_time"));
				srVO.setSr_state(rs.getString("sr_state"));
				srVO.setSr_result(rs.getString("sr_result"));
				list.add(srVO); // Store the row in the list
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
}