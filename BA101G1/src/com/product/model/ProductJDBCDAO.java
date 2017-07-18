package com.product.model;

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

import com.product.model.ProductVO;

public class ProductJDBCDAO implements ProductDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BA101G1";
	String passwd = "ba101g1";

	private static final String INSERT_STMT ="INSERT INTO PRODUCT (PRO_ID,STORE_ID,PRO_NAME,PRO_PRICE,PRO_STATE,PRO_IMAGE,PC_ID,PRO_CONTENT) VALUES ('PRO'||'-'||LPAD(to_char(store_seq.NEXTVAL),6,'0'), ?, ?, ?, ?, ?, ?, ?)";
	private static final String DELETE = "DELETE FROM PRODUCT where pro_id = ?";
	private static final String UPDATE_STMT = "UPDATE PRODUCT set pro_name=?, pro_price=?, pro_state=?, pro_image=?, pc_id=?, pro_content=? where pro_id = ?";
	private static final String Find_by_PK = "select * from PRODUCT where pro_id=?";
	private static final String Find_ALL = "select * from PRODUCT ";
	private static final String Find_NAME = "select * from PRODUCT where pro_name like ?";
	private static final String CLASSLINK = "select * from PRODUCT where pc_id = ?";
	private static final String Find_All_By_Store_id ="select * from product where store_id = ?";
	

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
			pstmt.setString(4, productVO.getPro_state());
			pstmt.setBytes(5, productVO.getPro_image());
			pstmt.setString(6, productVO.getPc_id());
			pstmt.setString(7, productVO.getPro_content());

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

			pstmt.setString(1, productVO.getStore_id());
			pstmt.setString(2, productVO.getPro_name());
			pstmt.setInt(3, (int)productVO.getPro_price());
			pstmt.setString(4, productVO.getPro_state());
			pstmt.setBytes(5, productVO.getPro_image());
			pstmt.setString(6, productVO.getPc_id());
			pstmt.setString(7, productVO.getPro_content());

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
				proVO.setPro_state(rs.getString("Pro_state"));
				proVO.setPro_image(rs.getBytes("Pro_image"));
				proVO.setPc_id(rs.getString("Pc_id"));
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
				proVO.setPro_state(rs.getString("Pro_state"));
				proVO.setPro_image(rs.getBytes("Pro_image"));
				proVO.setPc_id(rs.getString("Pc_id"));
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
	
	@Override
	public List<ProductVO> findName(String pro_name) {
		List<ProductVO> productlist = new ArrayList<ProductVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductVO proVO = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Find_NAME);

			pstmt.setString(1, "%"+pro_name+"%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				proVO = new ProductVO();
				proVO.setPro_id(rs.getString("Pro_id"));
				proVO.setStore_id(rs.getString("store_id"));
				proVO.setPro_name(rs.getString("Pro_name"));
				proVO.setPro_price(rs.getInt("Pro_price"));
				proVO.setPro_total(rs.getInt("Pro_total"));
				proVO.setPro_state(rs.getString("Pro_state"));
				proVO.setPro_image(rs.getBytes("Pro_image"));
				proVO.setPc_id(rs.getString("Pc_id"));
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
	
	
	@Override
	public List<ProductVO> ClassLink(String pc_id) {
		List<ProductVO> productlist = new ArrayList<ProductVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductVO proVO = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(CLASSLINK);

			pstmt.setString(1, pc_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				proVO = new ProductVO();
				proVO.setPro_id(rs.getString("Pro_id"));
				proVO.setStore_id(rs.getString("store_id"));
				proVO.setPro_name(rs.getString("Pro_name"));
				proVO.setPro_price(rs.getInt("Pro_price"));
				proVO.setPro_total(rs.getInt("Pro_total"));
				proVO.setPro_state(rs.getString("Pro_state"));
				proVO.setPro_image(rs.getBytes("Pro_image"));
				proVO.setPc_id(rs.getString("Pc_id"));
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
	
	@Override
	public List<ProductVO> findProductByStore_id(String store_id) {
		// TODO Auto-generated method stub
		return null;
	}

	public static void main(String args[]) throws IOException{

		ProductJDBCDAO productdao = new ProductJDBCDAO();
		//�s�W
		ProductVO productVO1=new ProductVO();
		productVO1.setStore_id("STO-000004");
		productVO1.setPro_name("�j���J");
		productVO1.setPro_price(80);
	
		productVO1.setStore_id("STO-000002");
		productVO1.setPro_name("������");
		productVO1.setPro_price(150);
		productVO1.setPro_state("�W�[");
		byte[] pic = getPictureByteArray("WebContent/FakeInfo/BeefNoodles.jpg");
		productVO1.setPro_image(pic);
		productVO1.setPc_id("0");
		productVO1.setPro_content("BBBB");
		
		productVO1.setPc_id("1");
		productVO1.setPro_content("�ڬO������");
		
		productdao.insert(productVO1);
		
		//�ק�
//		ProductVO productVO2=new ProductVO();
//		productVO2.setPro_name("������");
//		productVO2.setPro_price(150);
//		productVO2.setPro_state("�W�[");
//		byte[] pic = getPictureByteArray("WebContent/FakeInfo/BeefNoodles.jpg");
//		productVO2.setPro_image(pic);
//		productVO2.setPc_id("1");
//		productVO2.setPro_content("�n�Y��������~~~");
//		productVO2.setPro_id("PRO-000010");
//		productdao.update(productVO2);
		
		//�R��
//		productdao.delete("PRO-000009");
		
		//��@��
//		ProductVO revenueVO4 = productdao.findByPrimaryKey("PRO-000001");
//		System.out.println(revenueVO4.getPro_id());
//		System.out.println(revenueVO4.getStore_id());
//		System.out.println(revenueVO4.getPro_name());
//		System.out.println(revenueVO4.getPro_price());
//		System.out.println(revenueVO4.getPro_total());
//		System.out.println(revenueVO4.getPro_state());
//		System.out.println(revenueVO4.getPro_image());
//		System.out.println(revenueVO4.getPro_type());
//		System.out.println(revenueVO4.getPro_content());
//		System.out.println("---------------------");
		
//		//�����
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
		
		//�d���O
//		List<ProductVO> list = productdao.ClassLink("2");
//		for(ProductVO proVO : list){
//			System.out.println(proVO.getPro_id());
//			System.out.println(proVO.getStore_id());
//			System.out.println(proVO.getPro_name());
//			System.out.println(proVO.getPro_price());
//			System.out.println(proVO.getPro_total());
//			System.out.println(proVO.getPro_state());
//			System.out.println(proVO.getPro_image());
//			System.out.println(proVO.getPc_id());
//			System.out.println(proVO.getPro_content());
//			System.out.println("---------------------");
//		}
		
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
	public List<ProductVO> findAllProductByStore_id(String store_id) {
		List<ProductVO> productlist = new ArrayList<ProductVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductVO proVO = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Find_All_By_Store_id);
			pstmt.setString(1, store_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				proVO = new ProductVO();
				proVO.setStore_id(rs.getString("store_id"));
				proVO.setPro_id(rs.getString("Pro_id"));
				proVO.setPro_name(rs.getString("Pro_name"));
				proVO.setPro_price(rs.getInt("Pro_price"));
				proVO.setPro_total(rs.getInt("Pro_total"));
				proVO.setPro_state(rs.getString("Pro_state"));
				proVO.setPro_image(rs.getBytes("Pro_image"));
				proVO.setPc_id(rs.getString("Pc_id"));
				proVO.setPro_content(rs.getString("Pro_content"));
				productlist.add(proVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
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
