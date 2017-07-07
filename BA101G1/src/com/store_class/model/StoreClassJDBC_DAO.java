package com.store_class.model;

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

import com.product_class.model.ProductClassVO;
import com.store.model.StoreJDBC_DAO;
import com.store.model.StoreVO;

public class StoreClassJDBC_DAO implements StoreClassDAO_interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BA101G1";
	String passwd = "ba101g1";

	private static final String UPDATE_STMT = "UPDATE STORE_CLASS set sc_pic=? where sc_id = ?";
	private static final String GET_ALL = "SELECT * from store_class";
	private static final String GET_ONE_NAME = "select sc_name from store_class where sc_id=?";

	@Override
	public void update(StoreClassVO storeclassVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setBytes(1, storeclassVO.getSc_pic());
			pstmt.setInt(2, (int) storeclassVO.getSc_id());

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
				scVO = new StoreClassVO();
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

		// 修改
		StoreClassVO scVO = new StoreClassVO();
		byte[] pic = getPictureByteArray("WebContent/FakeInfo/Salad.jpg");
		scVO.setSc_pic(pic);
		scVO.setSc_id(0);
		storeclassdao.update(scVO);

		// List<StoreClassVO> list = storeclassdao.getAll();
		// for(StoreClassVO svo1 : list){
		// System.out.println(svo1.getSc_id());
		// System.out.println(svo1.getSc_name());
		// }
	}

	public static InputStream getPictureStream(String path) throws IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		return fis;
	}

	private static byte[] getPictureByteArray(String string) throws IOException {
		File file = new File(string);
		FileInputStream fis = new FileInputStream(file);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] image = new byte[8192];
		int i;
		while ((i = fis.read(image)) != -1) {
			baos.write(image, 0, i);
		}
		baos.close();
		fis.close();
		return baos.toByteArray();
	}

	@Override
	public StoreClassVO getSCname(Number sc_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sc_name=null;
		StoreClassVO storeclassVO=null;
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_NAME);

			pstmt.setInt(1, (int) sc_id);
			rs = pstmt.executeQuery();
			rs.next();
			storeclassVO.setSc_name(rs.getString(sc_name));
			storeclassVO.setSc_id(sc_id);
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
		return storeclassVO;
	}

}
