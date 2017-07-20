package com.store_report.model;

import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.*;

public class StoreReportJNDIDAO implements StoreReportDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA101G1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
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
	private static final String GET_SOME_STMT_BY_SR_STATE = 
			"SELECT sr_id,store_id,sc_id,order_id,man_id,sr_content,sr_image,sr_time,sr_state,sr_result FROM STORE_REPORT where sr_state = ?";
	private static final String GET_BY_STORE_ID = "select * from STORE_REPORT where store_id = ? ";
	@Override
	public void insert(StoreReportVO srVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, srVO.getStore_id());
			pstmt.setString(2, srVO.getSc_id());
			pstmt.setString(3, srVO.getOrder_id());
			pstmt.setString(4, srVO.getSr_content());
			pstmt.setBytes(5, srVO.getSr_image());
System.out.println( srVO.getOrder_id());
			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			se.printStackTrace();
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

			con = ds.getConnection();
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
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, srId);

			pstmt.executeUpdate();

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

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, sr_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
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
			}

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
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

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

	@Override

	public List<StoreReportVO> findBySR_state(String sr_state) {
    

 List<StoreReportVO> list = new ArrayList<StoreReportVO>();

		StoreReportVO srVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
    try{
      
      con = ds.getConnection();
			pstmt = con.prepareStatement(GET_SOME_STMT_BY_SR_STATE);
			pstmt.setString(1, sr_state);
      rs = pstmt.executeQuery();
      
      
			while (rs.next()) {

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
      
	public List<StoreReportVO> getReportByStore_id(String store_id) {

		List<StoreReportVO> list = new ArrayList<StoreReportVO>();
		StoreReportVO srVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_BY_STORE_ID);
			pstmt.setString(1, store_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

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