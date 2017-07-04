package com.product_class.model;

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
import com.store_class.model.StoreClassVO;

public class ProductClassJDBC_DAO implements ProductClassDAO_interface{
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BA101G1";
	String passwd = "ba101g1";
	
	private static final String getAll = "select * from PRODUCT_CLASS";
	private static final String getAllById = "select * from PRODUCT_CLASS where pc_id = ?";
	
	@Override
	public List<ProductClassVO> getAll() {
		
		List<ProductClassVO> productclasslist = new ArrayList<ProductClassVO>();
		ProductClassVO pcVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			
			pstmt = con.prepareStatement(getAll);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				pcVO= new ProductClassVO();
				pcVO.setPc_id(rs.getString("pc_id"));
				pcVO.setPc_name(rs.getString("pc_name"));
				productclasslist.add(pcVO); 
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
		return productclasslist;
	}
	
	
	@Override
	public List<ProductClassVO> getProductClassById(String sc_id) {
		List<ProductClassVO> productclasslist = new ArrayList<ProductClassVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductClassVO productclassVO = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(getAllById);

			pstmt.setString(1, sc_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				productclassVO= new ProductClassVO();
				productclassVO.setPc_id(rs.getString("pc_id"));
				productclassVO.setPc_name(rs.getString("pc_name"));
				productclasslist.add(productclassVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
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
		return productclasslist;
	}
	
	public static void main(String[] args) throws IOException {

		ProductClassJDBC_DAO productclassdao = new ProductClassJDBC_DAO();
		
		//查全部 by id
		List<ProductClassVO> list = productclassdao.getProductClassById("2");
		for(ProductClassVO svo1 : list){
			System.out.println(svo1.getPc_id());
			System.out.println(svo1.getPc_name());
		}
	}

	
}
