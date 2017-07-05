package com.product_class.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.store.model.StoreVO;
import com.store_class.model.StoreClassVO;

public class ProductClassDAO implements ProductClassDAO_interface{
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA101G1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String getAll = "select * from PRODUCT_CLASS";
	private static final String getAllById = "select * from PRODUCT_CLASS where pc_id = ?";
	
	
	@Override
	public void update(ProductClassVO productclassVO) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public List<ProductClassVO> getAll() {
		List<ProductClassVO> productclasslist = new ArrayList<ProductClassVO>();
		ProductClassVO pcVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(getAll);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				pcVO= new ProductClassVO();
				pcVO.setPc_id(rs.getString("pc_id"));
				pcVO.setPc_name(rs.getString("pc_name"));
				pcVO.setPc_pic(rs.getBytes("pc_pic"));
				productclasslist.add(pcVO); 
			}
		} catch (SQLException se) {
			throw new RuntimeException("µo¥Í¿ù»~" + se.getMessage());
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
	public List<ProductClassVO> getProductClassById(String pc_id) {

		List<ProductClassVO> productclasslist = new ArrayList<ProductClassVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductClassVO productclassVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(getAllById);

			pstmt.setString(1, pc_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				productclassVO= new ProductClassVO();
				productclassVO.setPc_id(rs.getString("pc_id"));
				productclassVO.setPc_name(rs.getString("pc_name"));
				productclassVO.setPc_pic(rs.getBytes("pc_pic"));
				productclasslist.add(productclassVO);
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
		return productclasslist;
	}

	

}
