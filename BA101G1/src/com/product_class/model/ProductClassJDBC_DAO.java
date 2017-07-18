package com.product_class.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.store.model.StoreVO;
import com.store_class.model.StoreClassVO;

public class ProductClassJDBC_DAO implements ProductClassDAO_interface{
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BA101G1";
	String passwd = "ba101g1";
	
	private static final String UPDATE_STMT = "UPDATE PRODUCT_CLASS set pc_pic=? where pc_id = ?";
	private static final String getAll = "select * from PRODUCT_CLASS";
	private static final String getAllById = "select * from PRODUCT_CLASS where pc_id = ?";
	
	@Override
	public void update(ProductClassVO productclassVO) {
		Connection con = null;
		PreparedStatement pstmt= null;
		try{
		Class.forName(driver);
		con = DriverManager.getConnection(url, userid, passwd);
		pstmt = con.prepareStatement(UPDATE_STMT);
		
		pstmt.setBytes(1, productclassVO.getPc_pic());
		pstmt.setString(2, productclassVO.getPc_id());
		
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
			throw new RuntimeException("�䤣��driver" + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("�o�Ϳ��~" + se.getMessage());
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
		
		//�d���� by id
		ProductClassVO pcVO = new ProductClassVO();
		byte[] pic = getPictureByteArray("WebContent/FakeInfo/Salad.jpg");
		pcVO.setPc_pic(pic);
		pcVO.setPc_id("5");
		productclassdao.update(pcVO);
	}
		
	public static InputStream getPictureStream(String path) throws IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		return fis;
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

	@Override
	public ProductClassVO getPCname(String pc_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductClassVO productclassVO = null;
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(getAllById);

			pstmt.setString(1, pc_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				productclassVO = new ProductClassVO();
				productclassVO.setPc_name(rs.getString("pc_name"));
				productclassVO.setPc_id(rs.getString("pc_id"));
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		return productclassVO;
	}

	
}
