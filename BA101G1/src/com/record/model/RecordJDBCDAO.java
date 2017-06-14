package com.record.model;

import java.util.*;



import java.sql.*;

public class RecordJDBCDAO implements RecordDAO_interface {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "JDBC";
	String passwd = "JDBC";
	
	private static final String INSERT_STMT = 
			"INSERT INTO record (rec_id, mem_id, rec_date, rec_mon) VALUES ('REC'||'-'||LPAD(to_char(rec_seq.NEXTVAL),6,'0'),?,?,?)";
	private static final String UPDATE = 
			"UPDATE record set rec_id = ?, mem_id = ?, rec_date = ?, rec_mon = ?";
	private static final String DELETE = 
			"DELETE FROM record where rec_id = ?";
	private static final String GET_ONE_STMT = 
			"SELECT rec_id, mem_id, rec_date, rec_mon from record where rec_id = ?";
	private static final String GET_ALL_STMT = 
			"SELECT  rec_id, mem_id, rec_date, rec_mon from record order by _rec_id";
	
	@Override
	public void insert(RecordVO recordVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, recordVO.getMem_id());
			pstmt.setTimestamp(2, recordVO.getRec_date());
			pstmt.setInt(3, recordVO.getRec_mon());

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
	public void update(RecordVO recordVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, recordVO.getRec_id());
			pstmt.setString(2, recordVO.getMem_id());
			pstmt.setTimestamp(3, recordVO.getRec_date());
			pstmt.setInt(4, recordVO.getRec_mon());

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
	public void delete(String rec_id) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, rec_id);

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
	public RecordVO findByPrimaryKey(String rec_id) {
		// TODO Auto-generated method stub
		RecordVO recordVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, rec_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				recordVO = new RecordVO();
				recordVO.setRec_id(rs.getString("rec_id"));
				recordVO.setMem_id(rs.getString("mem_id"));
				recordVO.setRec_date(rs.getTimestamp("rec_date"));
				recordVO.setRec_mon(rs.getInt("rec_mon"));
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
		
		return recordVO;
	}

	@Override
	public List<RecordVO> getAll() {
		// TODO Auto-generated method stub
		List<RecordVO> list = new ArrayList<RecordVO>();
		RecordVO recordVO = null;

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
				recordVO = new RecordVO();
				recordVO.setRec_id(rs.getString("rec_id"));
				recordVO.setMem_id(rs.getString("mem_id"));
				recordVO.setRec_date(rs.getTimestamp("rec_date"));
				recordVO.setRec_mon(rs.getInt("rec_mon"));
				list.add(recordVO); // Store the row in the list
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
	
	public static void main(String[] args){
		
		RecordJDBCDAO dao = new RecordJDBCDAO();
		
		//新增
		RecordVO recordVO1 = new RecordVO();
		recordVO1.setMem_id("MEM-000001");
		recordVO1.setRec_date(new Timestamp(System.currentTimeMillis()));
		recordVO1.setRec_mon(1000);
		dao.insert(recordVO1);
		
		//修改
//		RecordVO recordVO2 = new RecordVO();
//		recordVO2.setRec_id("");
//		recordVO2.setMem_id("");
//		recordVO2.setRec_date(java.sql.Timestamp.valueOf(""));
//		recordVO2.setRec_mon(1000);
//		dao.update(recordVO2);
		
		//查詢
//		RecordVO recordVO3 = dao.findByPrimaryKey("");
//		System.out.print(recordVO3.getRec_id() + ",");
//		System.out.print(recordVO3.getMem_id() + ",");
//		System.out.print(recordVO3.getRec_date() + ",");
//		System.out.print(recordVO3.getRec_mon() + ",");
//		System.out.println("---------------------");
		
		//查詢
//		List<RecordVO> list = dao.getAll();
//		for(RecordVO aRecord : list){
//			System.out.print(aRecord.getRec_id() + ",");
//			System.out.print(aRecord.getMem_id() + ",");
//			System.out.print(aRecord.getRec_date() + ",");
//			System.out.print(aRecord.getRec_mon() + ",");
//			System.out.println("---------------------");	
//		}
	}
}
