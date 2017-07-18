package com.store_commit.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StoreCommitJDBC_DAO implements StoreCommitDAO_interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BA101G1";
	String passwd = "ba101g1";

	private static final String INSERT = "insert into store_commit(sc_id , store_id , mem_id , sc_content , sc_score)values('SC'||'-'||LPAD(to_char(sc_seq.NEXTVAL),6,'0'),?,?,?,?)";

	private static final String UPDATE = "UPDATE store_commit set sc_score=? , mem_id=?";

	private static final String DELETE = "delete from store_commit where sc_id = ?";

	private static final String GET_ONE = "SELECT store_id FROM store_commit where SC_ID = ?";

	private static final String GET_ALL = "SELECT sc_id , store_id , mem_id , sc_content , sc_time , sc_state from store_commit order by sc_id";
	private static final String GET_ALL_BY_STORE_ID="select * from store_commit where store_id=?";

	@Override
	public void insert(StoreCommitVO storecommit) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT);

			pstmt.setString(1, storecommit.getStore_id());
			pstmt.setString(2, storecommit.getMem_id());
			pstmt.setString(3, storecommit.getSc_content());
			pstmt.setInt(4, storecommit.getSc_score());
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("找不到driver" + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("發生錯誤" + se.getMessage());
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
		}
		if (con != null) {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void update(StoreCommitVO storecommit) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, storecommit.getSc_score());
			pstmt.setString(2, storecommit.getMem_id());
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("找不到driver" + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("發生錯誤" + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void delete(String sc_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, sc_id);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("找不到driver" + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("發生錯誤" + se.getMessage());
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
	public StoreCommitVO findByPrimaryKey(String sc_id) {

		StoreCommitVO scVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE);
			pstmt.setString(1, sc_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				scVO = new StoreCommitVO();

				scVO.setStore_id(rs.getString("store_id"));

			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("找不到driver" + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("發生錯誤" + se.getMessage());
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
		return scVO;
	}

	@Override
	public List<StoreCommitVO> getAll() {
		List<StoreCommitVO> list = new ArrayList<StoreCommitVO>();
		StoreCommitVO scvo = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				scvo = new StoreCommitVO();
				scvo.setSc_id(rs.getString("sc_id"));
				scvo.setStore_id(rs.getString("store_id"));
				scvo.setMem_id(rs.getString("mem_id"));
				scvo.setSc_content(rs.getString("sc_content"));
				scvo.setSc_time(rs.getTimestamp("sc_time"));
				scvo.setSc_state(rs.getString("sc_state"));
				list.add(scvo);
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("找不到driver" + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("發生錯誤" + se.getMessage());
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
		
		StoreCommitJDBC_DAO dao = new StoreCommitJDBC_DAO();
// 新增
 		StoreCommitVO svo = new StoreCommitVO();
 		
 		svo.setStore_id("STO-000002");
 		svo.setMem_id("MEM-000001");
 		svo.setSc_content("SOSO");
 		svo.setSc_score(5);
 		dao.insert(svo);
// 修改
// 		StoreCommitVO svo1 = new StoreCommitVO();
// 		svo1.setSc_state(0);
// 		svo1.setMem_id("MEM-000003");
// 		dao.update(svo1);

// 刪除		
//		dao.delete("SC-000003");
		
 //查單筆		
// 		StoreCommitVO svo2 = dao.findByPrimaryKey("SC-000004");
// 		System.out.print(svo2.getStore_id());
//		
//		
 //查全部		
//		List<StoreCommitVO> list = dao.getAll();
//		for(StoreCommitVO scvo3 : list){
//			System.out.println(scvo3.getSc_id() + ",");
//			System.out.println(scvo3.getStore_id() + ",");
//			System.out.println(scvo3.getMem_id() + ",");
//			System.out.println(scvo3.getSc_content() + ",");
//			System.out.println(scvo3.getSc_time() + ",");
//			System.out.println(scvo3.getSc_state());
//		}
		
	}

	@Override
	public List<StoreCommitVO> getAllByStore_id(String store_id) {
		List<StoreCommitVO> list = new ArrayList<StoreCommitVO>();
		StoreCommitVO scvo = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_BY_STORE_ID );
			pstmt.setString(1, store_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				scvo = new StoreCommitVO();
				scvo.setSc_id(rs.getString("sc_id"));
				scvo.setStore_id(rs.getString("store_id"));
				scvo.setMem_id(rs.getString("mem_id"));
				scvo.setSc_content(rs.getString("sc_content"));
				scvo.setSc_time(rs.getTimestamp("sc_time"));
				scvo.setSc_state(rs.getString("sc_state"));
				list.add(scvo);
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("找不到driver" + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("發生錯誤" + se.getMessage());
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
