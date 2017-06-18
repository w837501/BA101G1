package com.product.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.product.model.ProductVO;

public class ProductJDBCDAO implements ProductDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BA101G1";
	String passwd = "ba101g1";

	private static final String INSERT_STMT = "INSERT INTO PRODUCT VALUES ('PRO'||'-'||LPAD(to_char(pro_seq.NEXTVAL),6,'0'),?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String DELETE = "DELETE FROM PRODUCT where pro_id = ?";
	private static final String UPDATE_STMT = "UPDATE PRODUCT set pro_name=?, pro_price=?, pro_state=?, pro_image=?, pro_type=?, pro_content=? where pro_id = ?";
	private static final String Find_by_PK = "select * from PRODUCT where pro_id=?";
	private static final String Find_ALL = "select * from PRODUCT ";

	@Override
	public void insert(ProductVO productVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, productVO.getStore_id());
			pstmt.setString(2, productVO.getPro_name());
			pstmt.setInt(3, (int)productVO.getPro_price());
			pstmt.setInt(4, (int)productVO.getPro_total());
			pstmt.setInt(5, (int)productVO.getPro_state());
			pstmt.setBytes(6, productVO.getPro_image());
			pstmt.setInt(7, (int)productVO.getPro_type());
			pstmt.setString(8, productVO.getPro_content());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, productVO.getPro_name());
			pstmt.setInt(2, (int)productVO.getPro_price());
			pstmt.setInt(3, (int)productVO.getPro_state());
			pstmt.setBytes(4, productVO.getPro_image());
			pstmt.setInt(5, (int)productVO.getPro_type());
			pstmt.setString(6, productVO.getPro_content());
			pstmt.setString(7, productVO.getPro_id());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, Pro_id);

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Find_by_PK);

			pstmt.setString(1, pro_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				proVO = new ProductVO();
				proVO.setPro_id(rs.getString("Pro_id"));
				proVO.setStore_id(rs.getString("store_id"));
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Find_ALL);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				proVO = new ProductVO();
				proVO.setPro_id(rs.getString("Pro_id"));
				proVO.setStore_id(rs.getString("store_id"));
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
		return productlist;
	}
	
	
	public static void main(String args[]){

		ProductJDBCDAO productdao = new ProductJDBCDAO();
		//新增
//		ProductVO productVO1=new ProductVO();
//		productVO1.setStore_id("STO-000006");
//		productVO1.setPro_name("雞雞雞雞雞排");
//		productVO1.setPro_price(123);
//		productVO1.setPro_total(0);
//		productVO1.setPro_state(1);
//		productVO1.setPro_image(null);
//		productVO1.setPro_type(0);
//		productVO1.setPro_content("安安");
//		
//		productdao.insert(productVO1);
		
		//修改
//		ProductVO productVO2=new ProductVO();
//		productVO2.setPro_name("雞排");
//		productVO2.setPro_price(1123);
//		productVO2.setPro_state(1);
//		productVO2.setPro_image(null);
//		productVO2.setPro_type(0);
//		productVO2.setPro_content("安安");
//		productVO2.setPro_id("PRO-000006");
//		productdao.update(productVO2);
		
		//刪除
//		productdao.delete("PRO-000006");
		
		//找一筆
		ProductVO revenueVO4 = productdao.findByPrimaryKey("PRO-000001");
		System.out.println(revenueVO4.getPro_id());
		System.out.println(revenueVO4.getStore_id());
		System.out.println(revenueVO4.getPro_name());
		System.out.println(revenueVO4.getPro_price());
		System.out.println(revenueVO4.getPro_total());
		System.out.println(revenueVO4.getPro_state());
		System.out.println(revenueVO4.getPro_image());
		System.out.println(revenueVO4.getPro_type());
		System.out.println(revenueVO4.getPro_content());
		System.out.println("---------------------");
		
//		//找全部
//		List<ProductVO> list = productdao.getAll();
//		for (ProductVO aPro : list) {
//			System.out.println(aPro.getPro_id());
//			System.out.println(aPro.getStore_id());
//			System.out.println(aPro.getPro_name());
//			System.out.println(aPro.getPro_price());
//			System.out.println(aPro.getPro_total());
//			System.out.println(aPro.getPro_state());
//			System.out.println(aPro.getPro_image());
//			System.out.println(aPro.getPro_type());
//			System.out.println(aPro.getPro_content());
//			System.out.println("---------------------");
//		}
	}

}
