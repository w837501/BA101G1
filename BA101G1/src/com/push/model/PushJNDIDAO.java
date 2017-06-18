package com.push.model;

import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.*;

public class PushJNDIDAO implements PushDAO_interface {
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
		"INSERT INTO Push (push_id,man_id,push_content,push_time,news_id,ad_id) VALUES ('PUS'||'-'||lpad(to_char(push_seq.nextval),6,'0'), ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
		"SELECT* FROM Push order by push_id";
	private static final String GET_ONE_STMT = 
		"SELECT push_id,man_id,push_content,push_time,news_id,ad_id FROM Push where push_id = ?";
	private static final String DELETE = 
		"DELETE FROM Push where push_id = ?";
	private static final String UPDATE = 
		"UPDATE Push set man_id=?, push_content=?, push_time=?, news_id=?, ad_id=? where push_id = ?";

	@Override
	public void insert(PushVO pushVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, pushVO.getMan_id());
			pstmt.setString(2, pushVO.getPush_content());
			pstmt.setTimestamp(3, pushVO.getPush_time());
			pstmt.setString(4, pushVO.getNews_id());
			pstmt.setString(5, pushVO.getAd_id());

			pstmt.executeUpdate();

			// Handle any driver errors
		
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
	public void update(PushVO pushVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, pushVO.getMan_id());
			pstmt.setString(2, pushVO.getPush_content());
			pstmt.setTimestamp(3, pushVO.getPush_time());
			pstmt.setString(4, pushVO.getNews_id());
			pstmt.setString(5, pushVO.getAd_id());
			pstmt.setString(6, pushVO.getPush_id());

			pstmt.executeUpdate();

			
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
	public void delete(String pushId) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, pushId);

			pstmt.executeUpdate();
			
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
	public PushVO findPrimaryKey(String push_id) {

		PushVO pushVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, push_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				pushVO = new PushVO();
				pushVO.setPush_id(rs.getString("push_id"));
				pushVO.setMan_id(rs.getString("man_id"));
				pushVO.setPush_content(rs.getString("push_content"));
				pushVO.setPush_time(rs.getTimestamp("push_time"));
				pushVO.setNews_id(rs.getString("news_id"));
				pushVO.setAd_id(rs.getString("ad_id"));
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
		return pushVO;
	}

	@Override
	public List<PushVO> getAll() {
		List<PushVO> list = new ArrayList<PushVO>();
		PushVO pushVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				pushVO = new PushVO();
				pushVO.setPush_id(rs.getString("push_id"));
				pushVO.setMan_id(rs.getString("man_id"));
				pushVO.setPush_content(rs.getString("push_content"));
				pushVO.setPush_time(rs.getTimestamp("push_time"));
				pushVO.setNews_id(rs.getString("news_id"));
				pushVO.setAd_id(rs.getString("ad_id"));
				list.add(pushVO); // Store the row in the list
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

/*	public static void main(String[] args) {

		PushJDBCDAO dao = new PushJDBCDAO();

		// 新增
		PushVO pushVO1 = new PushVO();
		pushVO1.setMan_id("MAN-000006");
		pushVO1.setPush_content("我們系統開機囉7");
		pushVO1.setPush_time(java.sql.Timestamp.valueOf("2005-01-01 11:22:33"));
		pushVO1.setNews_id(new String("NEWS-00003"));
		pushVO1.setAd_id(new String());
		dao.insert(pushVO1);

		// 修改
		PushVO pushVO2 = new PushVO();
		pushVO2.setPush_id("PUS-000001");
		pushVO2.setMan_id("MAN-000001");
		pushVO2.setPush_content("我們系統開機囉8");
		pushVO2.setPush_time(java.sql.Timestamp.valueOf("2002-02-02 11:22:33"));
		pushVO2.setNews_id(new String());
		pushVO2.setAd_id(new String("AD-000003"));
		dao.update(pushVO2);

		// 刪除
		dao.delete("PUS-000002");

		// 查詢
		PushVO pushVO3 = dao.findPrimaryKey("PUS-000003");
		System.out.print(pushVO3.getPush_id() + ",");
		System.out.print(pushVO3.getMan_id() + ",");
		System.out.print(pushVO3.getPush_content() + ",");
		System.out.print(pushVO3.getPush_time() + ",");
		System.out.print(pushVO3.getNews_id() + ",");
		System.out.print(pushVO3.getAd_id() + ",");
		System.out.println("---------------------");

		// 查詢
		List<PushVO> list = dao.getAll();
		for (PushVO aPush : list) {
			System.out.print(aPush.getPush_id() + ",");
			System.out.print(aPush.getMan_id() + ",");
			System.out.print(aPush.getPush_content() + ",");
			System.out.print(aPush.getPush_time() + ",");
			System.out.print(aPush.getNews_id() + ",");
			System.out.print(aPush.getAd_id() + ",");
			System.out.println();
		}
	}*/
}