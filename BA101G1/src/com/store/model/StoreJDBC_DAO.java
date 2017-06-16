package com.store.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;


public class StoreJDBC_DAO implements StoreDAO_interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "FoodOrderingSystem";
	String passwd = "1234";

	private static final String INSERT = 
			"insert into store(STORE_ID, SC_ID, STORE_NAME, STORE_CONTENT, STORE_PHONE, STORE_ADDR, STORE_DATE,STORE_STAR , STORE_COUNT, STORE_STATE,STORE_IMAGE,STORE_REPORT_COUNT,STORE_START_TIME,STORE_END_TIME,STORE_PW,STORE_ACC,STORE_OUT,STORE_ZONE)values('STO'||'-'||LPAD(to_char(store_seq.NEXTVAL),6,'0'),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	private static final String UPDATE = 
			"UPDATE store set STORE_NAME=?, STORE_PHONE=?, STORE_ADDR=?, STORE_PW=?, STORE_ACC=?";
	
	private static final String DELETE = 
			"DELETE FROM store where STORE_ID = ?";
	
	private static final String GET_ONE = 
			"SELECT SC_ID , STORE_NAME FROM store where STORE_ID = ?";
	
	private static final String GET_ALL = 
			"SELECT STORE_ID, SC_ID, STORE_NAME, STORE_CONTENT, STORE_PHONE, STORE_ADDR, STORE_DATE,STORE_STAR , STORE_COUNT, STORE_STATE,STORE_IMAGE,STORE_REPORT_COUNT,STORE_START_TIME,STORE_END_TIME,STORE_PW,STORE_ACC,STORE_OUT,STORE_ZONE from store order by store_id";


//	@Override
//	public void insert(StoreVO store) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		try {
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(INSERT);
//
//			pstmt.setInt(1, store.getSc_id());
//			pstmt.setString(2, store.getStore_name());
//			pstmt.setString(3, store.getStore_content());
//			pstmt.setInt(4, store.getStore_phone());
//			pstmt.setString(5, store.getStore_addr());
//			pstmt.setDate(6, store.getStore_date());
//			pstmt.setInt(7, store.getStore_star());
//			pstmt.setInt(8, store.getStore_count());
//			pstmt.setInt(9, store.getStore_state());
//			pstmt.setBytes(10, store.getStore_image());
//			pstmt.setInt(11, store.getStore_report_count());
//			pstmt.setTimestamp(12, store.getStore_start_time());
//			pstmt.setTimestamp(13, store.getStore_end_time());
//			pstmt.setString(14, store.getStore_pw());
//			pstmt.setString(15, store.getStore_acc());
//			pstmt.setInt(16, store.getStore_out());
//			pstmt.setString(17, store.getStore_zone());
//			pstmt.executeUpdate();
//			
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("找不到driver" + e.getMessage());
//		} catch (SQLException se) {
//			throw new RuntimeException("發生錯誤" + se.getMessage());
//		} finally {
//			if (pstmt != null)
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace();
//				}
//		}
//		if (con != null) {
//			try {
//				con.close();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//	}

	
//	@Override
//	public void update(StoreVO store) {
//		
//		Connection con = null;
//		PreparedStatement pstmt= null;
//		try{
//		Class.forName(driver);
//		con = DriverManager.getConnection(url, userid, passwd);
//		pstmt = con.prepareStatement(UPDATE);
//		
//		pstmt.setString(1, store.getStore_name());
//		pstmt.setInt(2, store.getStore_phone());
//		pstmt.setString(3, store.getStore_addr());
//		pstmt.setString(4, store.getStore_pw());
//		pstmt.setString(5, store.getStore_acc());
//		
//		pstmt.executeUpdate();
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("找不到driver" + e.getMessage());
//		} catch (SQLException se) {
//			throw new RuntimeException("發生錯誤" + se.getMessage());
//		} finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace();
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		}
//	}
//	
//
//	@Override
//	public void delete(String store_id) {
//		
//		Connection con = null;
//		PreparedStatement pstmt =null;
//		try{
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(DELETE);
//			pstmt.setString(1, store_id);
//			pstmt.executeUpdate();
//		}catch (ClassNotFoundException e) {
//			throw new RuntimeException("找不到driver" + e.getMessage());
//		} catch (SQLException se) {
//			throw new RuntimeException("發生錯誤" + se.getMessage());
//		} finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//	}
//
//	
//	@Override
//	public StoreVO findByPrimaryKey(String store_id) {
//		
//		StoreVO storeVO = null;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try{
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(GET_ONE);
//			pstmt.setString(1, store_id);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				storeVO = new StoreVO();
//				storeVO.setSc_id(rs.getInt("Sc_id"));
//				storeVO.setStore_name(rs.getString("store_name"));
//			}
//		} catch (ClassNotFoundException e) {
//		throw new RuntimeException("找不到driver" + e.getMessage());
//	} catch (SQLException se) {
//		throw new RuntimeException("發生錯誤" + se.getMessage());
//	} finally {
//		if (rs != null) {
//			try {
//				rs.close();
//			} catch (SQLException se) {
//				se.printStackTrace(System.err);
//			}
//		}
//		if (pstmt != null) {
//			try {
//				pstmt.close();
//			} catch (SQLException se) {
//				se.printStackTrace(System.err);
//			}
//		}
//		if (con != null) {
//			try {
//				con.close();
//			} catch (Exception e) {
//				e.printStackTrace(System.err);
//			}
//		}
//	}
//	return storeVO;
//}

	
	@Override
	public List<StoreVO> getAll() {
		List<StoreVO> list = new ArrayList<StoreVO>();
		StoreVO storeVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			
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

	public static void main(String[] args) throws IOException {

		StoreJDBC_DAO dao = new StoreJDBC_DAO();
//新增
//		StoreVO svo = new StoreVO();
//		svo.setSc_id(7);
//		svo.setStore_name("BBQ");
//		svo.setStore_content("roast");
//		svo.setStore_phone(12345);
//		svo.setStore_addr("taoyuan");
//		svo.setStore_date(java.sql.Date.valueOf("2016-06-10"));
//		svo.setStore_star(120);
//		svo.setStore_count(30);
//		svo.setStore_state(1);
//		byte[] pic = getPictureByteArray("FakeInfo/code.png");
//		svo.setStore_image(pic);
//		svo.setStore_report_count(5);
//		svo.setStore_start_time(java.sql.Timestamp.valueOf("2016-06-12 24:60:60"));
//		svo.setStore_end_time(java.sql.Timestamp.valueOf("2016-06-12 24:60:60"));
//		svo.setStore_pw("1234");
//		svo.setStore_acc("a123456");
//		svo.setStore_out(1);
//		svo.setStore_zone("3");
//		dao.insert(svo);
		
//修改		
//		StoreVO svo2 = new StoreVO();
//		svo2.setStore_name("Lollipop");
//		svo2.setStore_phone(12345);
//		svo2.setStore_addr("taichang");
//		svo2.setStore_pw("0000000");
//		svo2.setStore_acc("cccccc");
//		dao.update(svo2);
		
//刪除		
//		dao.delete("STO-000025");
//查單筆		
//		StoreVO svo3 = dao.findByPrimaryKey("STO-000001");
//		System.out.print(svo3.getSc_id() + ",");
//		System.out.print(svo3.getStore_name() + ",");
//		System.out.println("---------------------");
//查全部		
		List<StoreVO> list = dao.getAll();
		for(StoreVO svo1 : list){
			System.out.println(svo1.getStore_id() + ",");
			System.out.println(svo1.getSc_id() + ",");
			System.out.println(svo1.getStore_name() + ",");
			System.out.println(svo1.getStore_content() + ",");
			System.out.println(svo1.getStore_phone() + ",");
			System.out.println(svo1.getStore_addr() + ",");
			System.out.println(svo1.getStore_date() + ",");
			System.out.println(svo1.getStore_star() + ",");
			System.out.println(svo1.getStore_count() + ",");
			System.out.println(svo1.getStore_state() + ",");
			System.out.println(svo1.getStore_image() + ",");
			System.out.println(svo1.getStore_report_count() + ",");
			System.out.println(svo1.getStore_start_time() + ",");
			System.out.println(svo1.getStore_end_time() + ",");
			System.out.println(svo1.getStore_pw() + ",");
			System.out.println(svo1.getStore_acc() + ",");
			System.out.println(svo1.getStore_out() + ",");
			System.out.println(svo1.getStore_zone() + ",");
			System.out.println("---------------------");
		}
	}
	
	
	private static byte[] getPictureByteArray(String string)throws IOException {
		File file = new File(string);
		FileInputStream fis = new FileInputStream(file);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] image = new byte[8192];
		int i ;
		while((i = fis.read(image)) != -1){
			baos.write(image,0,i);
		}
		baos.close();
		fis.close();	
		return baos.toByteArray();
	}
}
