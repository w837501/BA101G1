package com.ad.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.ad.model.AdVO;

public class AdJDBCDAO implements AdDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BA101G1";
	String passwd = "ba101g1";

	private static final String INSERT_STMT = "INSERT into AD (ad_id,store_id,ad_name,ad_content,ad_image,ad_time,ad_push_content) VALUES('AD'||'-'||LPAD(to_char(ad_seq.NEXTVAL),6,'0'),?,?,?,?,?,?)";
	private static final String UPDATE_STMT = "UPDATE AD set ad_name=?, ad_content=?, ad_image=?, ad_time=?, ad_state=?, ad_push_content=? where ad_id=?";
	private static final String DELETE = "DELETE FROM AD where ad_id = ?";
	private static final String Find_by_PK = "select * from AD where ad_id=?";
	private static final String Find_ALL = "select * from AD";
	
	private static final String AD_Available ="select * from Ad where ad_state = '1' order by ad_time desc";

	@Override
	public void insert(AdVO adVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			
			pstmt.setString(1, adVO.getStore_id());
			pstmt.setString(2, adVO.getAd_name());
			pstmt.setString(3, adVO.getAd_content());
			pstmt.setBytes(4, adVO.getAd_image());
			pstmt.setTimestamp(5, adVO.getAd_time());
			pstmt.setString(6, adVO.getAd_push_content());

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
	public void update(AdVO adVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, adVO.getAd_name());
			pstmt.setString(2, adVO.getAd_content());
			pstmt.setBytes(3, adVO.getAd_image());
			pstmt.setTimestamp(4, adVO.getAd_time());
			pstmt.setInt(5, (int) adVO.getAd_state());
			pstmt.setString(6, adVO.getAd_push_content());
			pstmt.setString(7, adVO.getAd_id());

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
	public void delete(String ad_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, ad_id);

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
	public AdVO findByPrimaryKey(String ad_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdVO adVO = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Find_by_PK);

			pstmt.setString(1, ad_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				adVO = new AdVO();

				adVO.setAd_id(rs.getString("ad_id"));
				adVO.setStore_id(rs.getString("store_id"));
				adVO.setAd_name(rs.getString("ad_name"));
				adVO.setAd_content(rs.getString("ad_content"));
				adVO.setAd_image(rs.getBytes("ad_image"));
				adVO.setAd_time(rs.getTimestamp("ad_time"));
				adVO.setAd_state(rs.getInt("ad_state"));
				adVO.setAd_push_content(rs.getString("ad_push_content"));
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
		return adVO;
	}

	@Override
	public List<AdVO> getAll() {
		List<AdVO> adlist = new ArrayList<AdVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdVO adVO = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Find_ALL);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				adVO = new AdVO();
				adVO.setAd_id(rs.getString("ad_id"));
				adVO.setAd_name(rs.getString("ad_name"));
				adVO.setAd_content(rs.getString("ad_content"));
				adVO.setAd_image(rs.getBytes("ad_image"));
				adVO.setAd_time(rs.getTimestamp("ad_time"));
				adVO.setAd_state(rs.getInt("ad_state"));
				adVO.setAd_push_content(rs.getString("ad_push_content"));
				adlist.add(adVO);
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
		return adlist;
	}
	
	@Override
	public List<AdVO> getAvailableAD() {
		List<AdVO> adlist = new ArrayList<AdVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdVO adVO = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(AD_Available);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				adVO = new AdVO();
				adVO.setAd_id(rs.getString("ad_id"));
				adVO.setAd_name(rs.getString("ad_name"));
				adVO.setAd_content(rs.getString("ad_content"));
				adVO.setAd_image(rs.getBytes("ad_image"));
				adVO.setAd_time(rs.getTimestamp("ad_time"));
				adVO.setAd_state(rs.getInt("ad_state"));
				adVO.setAd_push_content(rs.getString("ad_push_content"));
				adlist.add(adVO);
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
		return adlist;
	}
	
	public static void main(String[] args) {
		AdJDBCDAO addao = new AdJDBCDAO();

		// 新增
		 AdVO adVO1 = new AdVO();
		 adVO1.setStore_id("STO-000002");
		 adVO1.setAd_name("YOYOYOYO12312311111111111111111111111111");
		 adVO1.setAd_content("沒有內文唷");
		 byte[] pic=null;
		try {
			pic = getPictureByteArray("C:/Users/15-ay118TX/git/BA101G1_M/BA101G1/WebContent/frontend/advertisement/images/coffee1.jpg");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 adVO1.setAd_image(pic);
		 adVO1.setAd_time(new Timestamp(System.currentTimeMillis()));
		 adVO1.setAd_state(1);
		 adVO1.setAd_push_content("推播");
		
		 addao.insert(adVO1);

		// 修改
//		 AdVO adVO2 = new AdVO();
//		 adVO2.setAd_name("YOYOYOYO123123");
//		 adVO2.setAd_content("沒有");
//		 adVO2.setAd_time(new Timestamp(System.currentTimeMillis()));
//		 adVO2.setAd_state(1);
//		 adVO2.setAd_push_content("推播");
//		 adVO2.setAd_id("AD-000001");
//		 byte[] pic;
//		  try {
//		  pic = getPictureByteArray("C:/Users/Java/git/BA101G1/BA101G1/WebContent/frontend/advertisement/images/coffee1.jpg");
//		  adVO2.setAd_image(pic);
//		  } catch (IOException e) {
//		  // TODO Auto-generated catch block
//		  e.printStackTrace();
//		  }
//		
//		 addao.update(adVO2);

		// 刪除
		// addao.delete("AD-000007");

		// 找一筆
//		AdVO adVO3 = addao.findByPrimaryKey("AD-000001");
//		System.out.println(adVO3.getAd_id());
//		System.out.println(adVO3.getAd_name());
//		System.out.println(adVO3.getAd_content());
//		System.out.println(adVO3.getAd_image());
//		System.out.println(adVO3.getAd_time());
//		System.out.println(adVO3.getAd_state());
//		System.out.println(adVO3.getAd_push_content());
//		System.out.println("---------------------");
//
		// 找全部
//		List<AdVO> list = addao.getAll();
//		for (AdVO aAd : list) {
//			System.out.println(aAd.getAd_id());
//			System.out.println(aAd.getAd_name());
//			System.out.println(aAd.getAd_content());
//			System.out.println(aAd.getAd_image());
//			System.out.println(aAd.getAd_time());
//			System.out.println(aAd.getAd_state());
//			System.out.println(aAd.getAd_push_content());
//			System.out.println("---------------------");
//		}
	}
	
	public static byte[] getPictureByteArray(String path) throws IOException {
		 File file = new File(path);
		 FileInputStream fis = new FileInputStream(file);
		 ByteArrayOutputStream baos = new ByteArrayOutputStream();
		 byte[] buffer = new byte[8192];
		 int i;
		 while ((i = fis.read(buffer)) != -1) {
		  baos.write(buffer, 0, i);
		 }
		 baos.close();
		 fis.close();

		 return baos.toByteArray();
		}
}
