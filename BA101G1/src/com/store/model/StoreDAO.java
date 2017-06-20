package com.store.model;

//import java.io.ByteArrayOutputStream;
//import java.io.File;
//import java.io.FileInputStream;
//import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.store_commit.model.StoreCommitVO;

public class StoreDAO implements StoreDAO_interface {

	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/servlet/BA101G1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	private static final String INSERT = 
			"insert into store(STORE_ID, SC_ID, STORE_NAME, STORE_CONTENT, STORE_PHONE, STORE_ADDR, STORE_DATE,STORE_STAR , STORE_COUNT, STORE_STATE,STORE_IMAGE,STORE_REPORT_COUNT,STORE_START_TIME,STORE_END_TIME,STORE_PW,STORE_ACC,STORE_OUT,STORE_ZONE)values('STO'||'-'||LPAD(to_char(store_seq.NEXTVAL),6,'0'),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	private static final String UPDATE = 
			"UPDATE store set SC_ID=?, STORE_NAME=?, STORE_CONTENT=?, STORE_PHONE=?, STORE_ADDR=?, STORE_DATE=?,STORE_STAR=? , STORE_COUNT=?, STORE_STATE=?,STORE_IMAGE=?,STORE_REPORT_COUNT=?,STORE_START_TIME=?,STORE_END_TIME=?,STORE_PW=?,STORE_ACC=?,STORE_OUT=?,STORE_ZONE=? where STORE_ID=?";
	
	private static final String DELETE = 
			"DELETE FROM store where STORE_ID = ?";
	
	private static final String GET_ONE = 
			"SELECT STORE_ID, SC_ID, STORE_NAME, STORE_CONTENT, STORE_PHONE, STORE_ADDR,to_char(STORE_DATE,'yyyy-mm-dd') STORE_DATE,STORE_STAR , STORE_COUNT, STORE_STATE,STORE_IMAGE,STORE_REPORT_COUNT,to_char(STORE_START_TIME,'yyyy-mm-dd hh:mm:ss') STORE_START_TIME,to_char(STORE_END_TIME,'yyyy-mm-dd hh:mm:ss') STORE_END_TIME,STORE_PW,STORE_ACC,STORE_OUT,STORE_ZONE  FROM store where STORE_ID = ?";
	
	private static final String GET_ALL = 
			"SELECT STORE_ID, SC_ID, STORE_NAME, STORE_CONTENT, STORE_PHONE, STORE_ADDR,to_char(STORE_DATE,'yyyy-mm-dd') STORE_DATE,STORE_STAR , STORE_COUNT, STORE_STATE,STORE_IMAGE,STORE_REPORT_COUNT,to_char(STORE_START_TIME,'yyyy-mm-dd hh:mm:ss') STORE_START_TIME,to_char(STORE_END_TIME,'yyyy-mm-dd hh:mm:ss') STORE_END_TIME,STORE_PW,STORE_ACC,STORE_OUT,STORE_ZONE from store order by store_id";
	
	private static final String GET_STORE_COMMIT_BYSTORE_ID ="select sc_id , store_id , mem_id , sc_content , sc_time , sc_state from store_commit where store_id = ? order by sc_id";
	
	@Override
	public void insert(StoreVO store) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);

			pstmt.setInt(1, store.getSc_id());
			pstmt.setString(2, store.getStore_name());
			pstmt.setString(3, store.getStore_content());
			pstmt.setInt(4, store.getStore_phone());
			pstmt.setString(5, store.getStore_addr());
			pstmt.setDate(6, store.getStore_date());
			pstmt.setInt(7, store.getStore_star());
			pstmt.setInt(8, store.getStore_count());
			pstmt.setInt(9, store.getStore_state());
			pstmt.setBytes(10, store.getStore_image());
			pstmt.setInt(11, store.getStore_report_count());
			pstmt.setTimestamp(12, store.getStore_start_time());
			pstmt.setTimestamp(13, store.getStore_end_time());
			pstmt.setString(14, store.getStore_pw());
			pstmt.setString(15, store.getStore_acc());
			pstmt.setInt(16, store.getStore_out());
			pstmt.setString(17, store.getStore_zone());
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			throw new RuntimeException("發生錯誤" 
					+ se.getMessage());
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
	public void update(StoreVO store) {
		
		Connection con = null;
		PreparedStatement pstmt= null;
		try{
			con = ds.getConnection();
		pstmt = con.prepareStatement(UPDATE);
		pstmt.setInt(1, store.getSc_id());
		pstmt.setString(2, store.getStore_name());
		pstmt.setString(3, store.getStore_content());
		pstmt.setInt(4, store.getStore_phone());
		pstmt.setString(5, store.getStore_addr());
		pstmt.setDate(6, store.getStore_date());
		pstmt.setInt(7, store.getStore_star());
		pstmt.setInt(8, store.getStore_count());
		pstmt.setInt(9, store.getStore_state());
		pstmt.setBytes(10, store.getStore_image());
		pstmt.setInt(11, store.getStore_report_count());
		pstmt.setTimestamp(12, store.getStore_start_time());
		pstmt.setTimestamp(13, store.getStore_end_time());
		pstmt.setString(14, store.getStore_pw());
		pstmt.setString(15, store.getStore_acc());
		pstmt.setInt(16, store.getStore_out());
		pstmt.setString(17, store.getStore_zone());
		pstmt.setString(18, store.getStore_id());
		
		
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
	public void delete(String store_id) {
		
		Connection con = null;
		PreparedStatement pstmt =null;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setString(1, store_id);
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
	public StoreVO findByPrimaryKey(String store_id) {
		
		StoreVO storeVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE);
			pstmt.setString(1, store_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				storeVO = new StoreVO();
				storeVO.setStore_id(rs.getString("store_id"));
				storeVO.setSc_id(rs.getInt("Sc_id"));
				storeVO.setStore_name(rs.getString("store_name"));
				storeVO.setStore_content(rs.getString("store_content"));
				storeVO.setStore_phone(rs.getInt("store_phone"));
				storeVO.setStore_addr(rs.getString("store_addr"));
				storeVO.setStore_date(rs.getDate("store_date"));
				storeVO.setStore_star(rs.getInt("store_star"));
				storeVO.setStore_count(rs.getInt("store_count"));
				storeVO.setStore_state(rs.getInt("store_state"));
				storeVO.setStore_image(rs.getBytes("store_image"));
				storeVO.setStore_report_count(rs.getInt("store_report_count"));
				storeVO.setStore_start_time(rs.getTimestamp("store_start_time"));
				storeVO.setStore_end_time(rs.getTimestamp("store_end_time"));
				storeVO.setStore_pw(rs.getString("store_pw"));
				storeVO.setStore_acc(rs.getString("store_acc"));
				storeVO.setStore_out(rs.getInt("store_out"));
				storeVO.setStore_zone(rs.getString("store_zone"));
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
	return storeVO;
}

	
	@Override
	public List<StoreVO> getAll() {
		List<StoreVO> list = new ArrayList<StoreVO>();
		StoreVO storeVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				storeVO= new StoreVO();
				storeVO.setStore_id(rs.getString("store_id"));
				storeVO.setSc_id(rs.getInt("Sc_id"));
				storeVO.setStore_name(rs.getString("store_name"));
				storeVO.setStore_content(rs.getString("store_content"));
				storeVO.setStore_phone(rs.getInt("store_phone"));
				storeVO.setStore_addr(rs.getString("store_addr"));
				storeVO.setStore_date(rs.getDate("store_date"));
				storeVO.setStore_star(rs.getInt("store_star"));
				storeVO.setStore_count(rs.getInt("store_count"));
				storeVO.setStore_state(rs.getInt("store_state"));
				storeVO.setStore_image(rs.getBytes("store_image"));
				storeVO.setStore_report_count(rs.getInt("store_report_count"));
				storeVO.setStore_start_time(rs.getTimestamp("store_start_time"));
				storeVO.setStore_end_time(rs.getTimestamp("store_end_time"));
				storeVO.setStore_pw(rs.getString("store_pw"));
				storeVO.setStore_acc(rs.getString("store_acc"));
				storeVO.setStore_out(rs.getInt("store_out"));
				storeVO.setStore_zone(rs.getString("store_zone"));
				list.add(storeVO); 
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

	//0401新增  透過商家編號找出所有評價(註:商家類別編號Integer跟評價編號String都為sc_id)
	@Override
	public Set<StoreCommitVO> getStoreCommitByStore_id(String store_id) {
		Set<StoreCommitVO> set = new LinkedHashSet<StoreCommitVO>();
		StoreCommitVO scVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_STORE_COMMIT_BYSTORE_ID);
			pstmt.setString(1, store_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				scVO = new StoreCommitVO();
				scVO.setSc_id(rs.getString("sc_id"));
				scVO.setStore_id(rs.getString("store_id"));
				scVO.setMem_id(rs.getString("mem_id"));
				scVO.setSc_content(rs.getString("sc_content"));
				scVO.setSc_time(rs.getTimestamp("sc_time"));
				scVO.setSc_state(rs.getInt("sc_state"));
			}
			
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
		return set;
	}
	
	
//	private static byte[] getPictureByteArray(String string)throws IOException {
//		File file = new File(string);
//		FileInputStream fis = new FileInputStream(file);
//		ByteArrayOutputStream baos = new ByteArrayOutputStream();
//		byte[] image = new byte[8192];
//		int i ;
//		while((i = fis.read(image)) != -1){
//			baos.write(image,0,i);
//		}
//		baos.close();
//		fis.close();	
//		return baos.toByteArray();
//	}
}
	
	


