package com.product.model;

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

import com.product.model.ProductVO;

public class ProductDAO implements ProductDAO_interface{
	
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
			"INSERT INTO PRODUCT VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		private static final String DELETE = 
			"DELETE FROM PRODUCT where pro_id = ?";
		private static final String UPDATE_STMT = 
			"UPDATE PRODUCT set store_id=?, pro_name=?, pro_price=?, pro_total=?, pro_state=?, pro_image, pro_type, pro_content where pro_id = ?";
		private static final String Find_by_PK = "select * from PRODUCT where pro_id=?";
		private static final String Find_ALL = "select * from PRODUCT ";
	
	@Override
	public void insert(ProductVO productVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, productVO.getPro_id());
			pstmt.setString(2, productVO.getStore_id());
			pstmt.setString(3, productVO.getPro_name());
			pstmt.setInt(4, (int)productVO.getPro_price());
			pstmt.setInt(5, (int)productVO.getPro_total());
			pstmt.setInt(6, (int)productVO.getPro_state());
			pstmt.setBytes(7, productVO.getPro_image());
			pstmt.setInt(8, (int)productVO.getPro_type());
			pstmt.setString(9, productVO.getPro_content());

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
	public void update(ProductVO productVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);

			
			pstmt.setString(1, productVO.getStore_id());
			pstmt.setString(2, productVO.getPro_name());
			pstmt.setInt(3, (int)productVO.getPro_price());
			pstmt.setInt(4, (int)productVO.getPro_total());
			pstmt.setInt(5, (int)productVO.getPro_state());
			pstmt.setBytes(6, productVO.getPro_image());
			pstmt.setInt(7, (int)productVO.getPro_type());
			pstmt.setString(8, productVO.getPro_content());
			pstmt.setString(9, productVO.getPro_id());

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
	public void delete(String Pro_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, Pro_id);

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
	public ProductVO findByPrimaryKey(String pro_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductVO proVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Find_by_PK);

			pstmt.setString(1, pro_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
			proVO=new ProductVO();
			proVO.setStore_id(rs.getString("store_id"));
			proVO.setPro_id(rs.getString("Pro_id"));
			proVO.setPro_name(rs.getString("Pro_name"));
			proVO.setPro_price(rs.getInt("Pro_price"));
			proVO.setPro_total(rs.getInt("Pro_total"));
			proVO.setPro_state(rs.getInt("Pro_state"));
			proVO.setPro_image(rs.getBytes("Pro_image"));
			proVO.setPro_type(rs.getInt("Pro_type"));
			proVO.setPro_content(rs.getString("Pro_content"));
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
		return proVO;
	}

	@Override
	public List<ProductVO> getAll() {
		List<ProductVO> productlist = new ArrayList<ProductVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductVO proVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Find_ALL);

			rs = pstmt.executeQuery();
			while(rs.next()){
			proVO=new ProductVO();
			proVO.setStore_id(rs.getString("store_id"));
			proVO.setPro_id(rs.getString("Pro_id"));
			proVO.setPro_name(rs.getString("Pro_name"));
			proVO.setPro_price(rs.getInt("Pro_price"));
			proVO.setPro_total(rs.getInt("Pro_total"));
			proVO.setPro_state(rs.getInt("Pro_state"));
			proVO.setPro_image(rs.getBytes("Pro_image"));
			proVO.setPro_type(rs.getInt("Pro_type"));
			proVO.setPro_content(rs.getString("Pro_content"));
			productlist.add(proVO);
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
		return productlist;
	}

}
