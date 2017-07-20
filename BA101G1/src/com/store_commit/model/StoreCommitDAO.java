package com.store_commit.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import com.store.model.StoreVO;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public class StoreCommitDAO implements StoreCommitDAO_interface {
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA101G1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT = "insert into store_commit(sc_id ,store_id ,mem_id , sc_content ,sc_score)values('SC'||'-'||LPAD(to_char(sc_seq.NEXTVAL),6,'0'),?,?,?,?)";
	
	private static final String UPDATE = "UPDATE store_commit set store_id = ? ,mem_id=? , sc_content=? , sc_time=? , sc_state=? where sc_id = ?";
	
    private static final String DELETE = "delete from store_commit where sc_id=? ";
	
	private static final String GET_ONE = "SELECT * FROM store_commit where SC_ID = ?";
	
	private static final String GET_ALL = "SELECT * from store_commit order by sc_id";
	
	private static final String GET_ALL_BY_STORE_ID="select * from store_commit where store_id=?";
    private static final String DELETE_STORE_COMMIT = "delete from store_commit where sc_id=? ";


	@Override
	public void insert(StoreCommitVO storecommit) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);
			 pstmt.setString(1,storecommit.getStore_id());
			 pstmt.setString(2,storecommit.getMem_id());
			 pstmt.setString(3,storecommit.getSc_content());
			 pstmt.setInt(4,storecommit.getSc_score());
			 pstmt.executeUpdate();
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
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			 pstmt.setString(1,storecommit.getStore_id());
			 pstmt.setString(2,storecommit.getMem_id());
			 pstmt.setString(3,storecommit.getSc_content());
			 pstmt.setTimestamp(4,storecommit.getSc_time());
			 pstmt.setString(5,storecommit.getSc_state());
				pstmt.setString(6,storecommit.getSc_id());

			pstmt.executeUpdate();
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
		 
		 try{
			 con = ds.getConnection();
			 pstmt = con.prepareStatement(DELETE);
             pstmt.setString(1, sc_id);
             pstmt.executeUpdate();
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
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE);
			pstmt.setString(1, sc_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				scVO = new StoreCommitVO();
				scVO.setSc_id(rs.getString("sc_id"));
				scVO.setStore_id(rs.getString("store_id"));
				scVO.setMem_id(rs.getString("mem_id"));
				scVO.setSc_content(rs.getString("sc_content"));
				scVO.setSc_time(rs.getTimestamp("sc_time"));
				scVO.setSc_state(rs.getString("sc_state"));
				scVO.setSc_score(rs.getInt("sc_score"));
			}
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
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()){
				scvo = new StoreCommitVO();
				scvo.setSc_id(rs.getString("sc_id"));
				scvo.setStore_id(rs.getString("store_id"));
				scvo.setMem_id(rs.getString("mem_id"));
				scvo.setSc_content(rs.getString("sc_content"));
				scvo.setSc_time(rs.getTimestamp("sc_time"));
				scvo.setSc_state(rs.getString("sc_state"));
				scvo.setSc_score(rs.getInt("sc_score"));
				list.add(scvo);
				}
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

	@Override
	public List<StoreCommitVO> getAllByStore_id(String store_id) {
		List<StoreCommitVO> list = new ArrayList<StoreCommitVO>();
		StoreCommitVO scvo = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_STORE_ID );
			pstmt.setString(1, store_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				scvo = new StoreCommitVO();
				scvo.setSc_id(rs.getString("sc_id"));
				scvo.setStore_id(rs.getString("store_id"));
				scvo.setMem_id(rs.getString("mem_id"));
				scvo.setSc_content(rs.getString("sc_content"));
				scvo.setSc_time(rs.getTimestamp("sc_time"));
				scvo.setSc_state(rs.getString("sc_state"));
				scvo.setSc_score(rs.getInt("sc_score"));
				list.add(scvo);
				}
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
