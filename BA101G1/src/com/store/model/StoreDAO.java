package com.store.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class StoreDAO implements StoreDAO_interface{
	
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
			"INSERT INTO STORE (STORE_ID,SC_ID,STORE_NAME,STORE_CONTENT,STORE_PHONE,STORE_ADDR,STORE_IMAGE,STORE_PW,STORE_ACC,STORE_OUT,STORE_ZONE)VALUES ('STO'||'-'||LPAD(to_char(store_seq.NEXTVAL),6,'0'),?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = 
			"UPDATE STORE set sc_id=?, store_content=?, store_phone=?, store_addr=?, store_image=?, store_out=?, store_zone=?, store_pw=? where store_id = ?";
	private static final String DELETE = 
			"DELETE FROM STORE where store_id = ?";
	private static final String Find_by_PK = "select * from STORE where store_id=?";
	private static final String Find_ALL = "select * from STORE ";
	private static final String Find_NAME = "select * from STORE where store_name like ?";
	private static final String Find_ZONE = "select * from STORE where store_zone = ?";
	private static final String CLASSLINK = "select s.sc_id, s.store_id, s.store_name, t.sc_name from store s join store_class t on (s.sc_id = t.sc_id) where t.sc_id = ?";
	
	@Override
	public void insert(StoreVO storeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, (int)storeVO.getSc_id());
			pstmt.setString(2, storeVO.getStore_name());
			pstmt.setString(3, storeVO.getStore_content());
			pstmt.setString(4, storeVO.getStore_phone());
			pstmt.setString(5, storeVO.getStore_addr());
			pstmt.setBytes(6, storeVO.getStore_image());
			pstmt.setString(7, storeVO.getStore_pw());
			pstmt.setString(8, storeVO.getStore_acc());
			pstmt.setInt(9, (int)storeVO.getStore_out());
			pstmt.setString(10, storeVO.getStore_zone());

			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	}

	@Override
	public void update(StoreVO storeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setInt(1, (int)storeVO.getSc_id());
			pstmt.setString(2, storeVO.getStore_content());
			pstmt.setString(3, storeVO.getStore_phone());
			pstmt.setString(4, storeVO.getStore_addr());
			pstmt.setBytes(5, storeVO.getStore_image());
			pstmt.setInt(6, (int)storeVO.getStore_out());
			pstmt.setString(7, storeVO.getStore_zone());
			pstmt.setString(8, storeVO.getStore_pw());
			pstmt.setString(9, storeVO.getStore_id());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	}

	@Override
	public void delete(String store_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, store_id);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	}

	@Override
	public List<StoreVO> getAll() {
		List<StoreVO> storelist = new ArrayList<StoreVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StoreVO storeVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Find_ALL);

			rs = pstmt.executeQuery();
			while(rs.next()){
				storeVO= new StoreVO();
				storeVO.setStore_id(rs.getString("store_id"));
				storeVO.setSc_id(rs.getInt("Sc_id"));
				storeVO.setStore_name(rs.getString("store_name"));
				storeVO.setStore_content(rs.getString("store_content"));
				storeVO.setStore_phone(rs.getString("store_phone"));
				storeVO.setStore_addr(rs.getString("store_addr"));
				storeVO.setStore_date(rs.getTimestamp("store_date"));
				storeVO.setStore_star(rs.getInt("store_star"));
				storeVO.setStore_count(rs.getInt("store_count"));
				storeVO.setStore_state(rs.getString("store_state"));
				storeVO.setStore_image(rs.getBytes("store_image"));
				storeVO.setStore_report_count(rs.getInt("store_report_count"));
				storeVO.setStore_start_time(rs.getTimestamp("store_start_time"));
				storeVO.setStore_end_time(rs.getTimestamp("store_end_time"));
				storeVO.setStore_pw(rs.getString("store_pw"));
				storeVO.setStore_acc(rs.getString("store_acc"));
				storeVO.setStore_out(rs.getInt("store_out"));
				storeVO.setStore_zone(rs.getString("store_zone"));
				storelist.add(storeVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return storelist;
	}

	@Override
	public StoreVO findByPrimaryKey(String store_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StoreVO storeVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Find_by_PK);

			pstmt.setString(1, store_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				storeVO = new StoreVO();
				storeVO.setStore_id(rs.getString("store_id"));
				storeVO.setSc_id(rs.getInt("Sc_id"));
				storeVO.setStore_name(rs.getString("store_name"));
				storeVO.setStore_content(rs.getString("store_content"));
				storeVO.setStore_phone(rs.getString("store_phone"));
				storeVO.setStore_addr(rs.getString("store_addr"));
				storeVO.setStore_date(rs.getTimestamp("store_date"));
				storeVO.setStore_star(rs.getInt("store_star"));
				storeVO.setStore_count(rs.getInt("store_count"));
				storeVO.setStore_state(rs.getString("store_state"));
				storeVO.setStore_image(rs.getBytes("store_image"));
				storeVO.setStore_report_count(rs.getInt("store_report_count"));
				storeVO.setStore_start_time(rs.getTimestamp("store_start_time"));
				storeVO.setStore_end_time(rs.getTimestamp("store_end_time"));
				storeVO.setStore_pw(rs.getString("store_pw"));
				storeVO.setStore_acc(rs.getString("store_acc"));
				storeVO.setStore_out(rs.getInt("store_out"));
				storeVO.setStore_zone(rs.getString("store_zone"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return storeVO;
	}

	@Override
	public List<StoreVO> findName(String store_name) {
		List<StoreVO> storelist = new ArrayList<StoreVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StoreVO storeVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Find_NAME);

			pstmt.setString(1, "%"+store_name+"%");
			rs = pstmt.executeQuery();
			while(rs.next()){
				storeVO= new StoreVO();
				storeVO.setStore_id(rs.getString("store_id"));
				storeVO.setSc_id(rs.getInt("Sc_id"));
				storeVO.setStore_name(rs.getString("store_name"));
				storeVO.setStore_content(rs.getString("store_content"));
				storeVO.setStore_phone(rs.getString("store_phone"));
				storeVO.setStore_addr(rs.getString("store_addr"));
				storeVO.setStore_date(rs.getTimestamp("store_date"));
				storeVO.setStore_star(rs.getInt("store_star"));
				storeVO.setStore_count(rs.getInt("store_count"));
				storeVO.setStore_state(rs.getString("store_state"));
				storeVO.setStore_image(rs.getBytes("store_image"));
				storeVO.setStore_report_count(rs.getInt("store_report_count"));
				storeVO.setStore_start_time(rs.getTimestamp("store_start_time"));
				storeVO.setStore_end_time(rs.getTimestamp("store_end_time"));
				storeVO.setStore_pw(rs.getString("store_pw"));
				storeVO.setStore_acc(rs.getString("store_acc"));
				storeVO.setStore_out(rs.getInt("store_out"));
				storeVO.setStore_zone(rs.getString("store_zone"));
				storelist.add(storeVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return storelist;
	}
	
	
	@Override
	public List<StoreVO> findZone(String store_zone) {
		List<StoreVO> storelist = new ArrayList<StoreVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StoreVO storeVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Find_ZONE);

			pstmt.setString(1, store_zone);
			rs = pstmt.executeQuery();
			while(rs.next()){
				storeVO= new StoreVO();
				storeVO.setStore_id(rs.getString("store_id"));
				storeVO.setSc_id(rs.getInt("Sc_id"));
				storeVO.setStore_name(rs.getString("store_name"));
				storeVO.setStore_content(rs.getString("store_content"));
				storeVO.setStore_phone(rs.getString("store_phone"));
				storeVO.setStore_addr(rs.getString("store_addr"));
				storeVO.setStore_date(rs.getTimestamp("store_date"));
				storeVO.setStore_star(rs.getInt("store_star"));
				storeVO.setStore_count(rs.getInt("store_count"));
				storeVO.setStore_state(rs.getString("store_state"));
				storeVO.setStore_image(rs.getBytes("store_image"));
				storeVO.setStore_report_count(rs.getInt("store_report_count"));
				storeVO.setStore_start_time(rs.getTimestamp("store_start_time"));
				storeVO.setStore_end_time(rs.getTimestamp("store_end_time"));
				storeVO.setStore_pw(rs.getString("store_pw"));
				storeVO.setStore_acc(rs.getString("store_acc"));
				storeVO.setStore_out(rs.getInt("store_out"));
				storeVO.setStore_zone(rs.getString("store_zone"));
				storelist.add(storeVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return storelist;
	}

	@Override
	public List<StoreVO> ClassLink(String sc_id) {
		List<StoreVO> storelist = new ArrayList<StoreVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StoreVO storeVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(CLASSLINK);

			pstmt.setString(1, sc_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				storeVO= new StoreVO();
				storeVO.setSc_id(rs.getInt("sc_id"));
				storeVO.setStore_id(rs.getString("store_id"));
				storeVO.setStore_name(rs.getString("store_name"));
				storeVO.setSc_name(rs.getString("sc_name"));
				storelist.add(storeVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return storelist;
	}
	
}
