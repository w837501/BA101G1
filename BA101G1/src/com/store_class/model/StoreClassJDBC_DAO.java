package com.store_class.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.store.model.StoreJDBC_DAO;
import com.store.model.StoreVO;

public class StoreClassJDBC_DAO implements StoreClassDAO_interface{
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BA101G1";
	String passwd = "ba101g1";
	
	
	private static final String GET_ALL = "SELECT * from store_class";
	
	@Override
	public List<StoreClassVO> getAll() {
		List<StoreClassVO> storeclasslist = new ArrayList<StoreClassVO>();
		StoreClassVO scVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				scVO= new StoreClassVO();
				scVO.setSc_id(rs.getInt("sc_id"));
				scVO.setSc_name(rs.getString("sc_name"));
				storeclasslist.add(scVO); 
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
		return storeclasslist;
	}

	
	
	public static void main(String[] args) throws IOException {

		StoreClassJDBC_DAO storeclassdao = new StoreClassJDBC_DAO();
		
		List<StoreClassVO> list = storeclassdao.getAll();
		for(StoreClassVO svo1 : list){
			System.out.println(svo1.getSc_id());
			System.out.println(svo1.getSc_name());
		}
	}
}
