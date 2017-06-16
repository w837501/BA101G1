package com.ad.model;

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

import com.ad.model.AdVO;

public class AdDAO implements AdDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA101G1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT into AD VALUES(?,?,?,?,?,?,?,?)";
	private static final String UPDATE_STMT = "UPDATE AD set store_id=?, ad_name=?, ad_content=?, ad_image=?, ad_time=?, ad_state=?, ad_push_content=? where ad_id=?";
	private static final String DELETE = "DELETE FROM AD where ad_id = ?";
	private static final String Find_by_PK = "select * from AD where ad_id=? and store_id=?";
	private static final String Find_ALL = "select * from AD";
	
	@Override
	public void insert(AdVO adVO) {

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, adVO.getAd_id());
			pstmt.setString(2, adVO.getStore_id());
			pstmt.setString(3, adVO.getAd_name());
			pstmt.setString(4, adVO.getAd_content());
			pstmt.setBytes(5, adVO.getAd_image());
			pstmt.setTimestamp(6, adVO.getAd_time());
			pstmt.setInt(7, (int) adVO.getAd_state());
			pstmt.setString(8, adVO.getAd_push_content());

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
	public void update(AdVO adVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1, adVO.getStore_id());
			pstmt.setString(2, adVO.getAd_name());
			pstmt.setString(3, adVO.getAd_content());
			pstmt.setBytes(4, adVO.getAd_image());
			pstmt.setTimestamp(5, adVO.getAd_time());
			pstmt.setInt(6, (int) adVO.getAd_state());
			pstmt.setString(7, adVO.getAd_push_content());
			pstmt.setString(8, adVO.getAd_id());

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
	public void delete(String ad_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, ad_id);

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
	public AdVO findByPrimaryKey(String ad_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdVO adVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Find_by_PK);

			pstmt.setString(1, ad_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				adVO=new AdVO();
						
				adVO.setAd_id(rs.getString("ad_id"));
				adVO.setStore_id(rs.getString("store_id"));
				adVO.setAd_name(rs.getString("ad_name"));
				adVO.setAd_content(rs.getString("ad_content"));
				adVO.setAd_image(rs.getBytes("ad_image"));
				adVO.setAd_time(rs.getTimestamp("ad_time"));
				adVO.setAd_state(rs.getInt("ad_state"));
				adVO.setAd_push_content(rs.getString("ad_push_content"));
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
		return adVO;
	}
	@Override
	public List<AdVO> getAll() {
		List<AdVO> adlist = new ArrayList<AdVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdVO adVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Find_ALL);

			rs = pstmt.executeQuery();
			while(rs.next()){
				adVO=new AdVO();
				adVO.setAd_id(rs.getString("ad_id"));
				adVO.setStore_id(rs.getString("store_id"));
				adVO.setAd_name(rs.getString("ad_name"));
				adVO.setAd_content(rs.getString("ad_content"));
				adVO.setAd_image(rs.getBytes("ad_image"));
				adVO.setAd_time(rs.getTimestamp("ad_time"));
				adVO.setAd_state(rs.getInt("ad_state"));
				adVO.setAd_push_content(rs.getString("ad_push_content"));
				adlist.add(adVO);
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
		return adlist;
	}
	
	
}
