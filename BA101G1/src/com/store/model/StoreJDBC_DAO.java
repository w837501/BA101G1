package com.store.model;

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
import java.sql.Timestamp;
import java.util.*;

import com.store.model.StoreVO;

public class StoreJDBC_DAO implements StoreDAO_interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BA101G1";
	String passwd = "ba101g1";

	private static final String INSERT_STMT = "INSERT INTO STORE (STORE_ID,SC_ID,STORE_NAME,STORE_CONTENT,STORE_PHONE,STORE_ADDR,STORE_IMAGE,STORE_PW,STORE_ACC,STORE_OUT,STORE_ZONE)VALUES ('STO'||'-'||LPAD(to_char(store_seq.NEXTVAL),6,'0'),?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE STORE set sc_id=?, store_content=?, store_phone=?, store_addr=?, store_image=?, store_out=?, store_zone=?, store_pw=? where store_id = ?";
	private static final String DELETE = "DELETE FROM STORE where store_id = ?";
	private static final String Find_by_PK = "select * from STORE where store_id=?";
	private static final String Find_ALL = "select * from STORE ";
	private static final String Find_NAME = "select * from STORE where store_name like ?";
	private static final String Find_ZONE = "select * from STORE where store_zone = '?'";
	private static final String CLASSLINK = "select s.sc_id, s.store_id, s.store_name, t.sc_name from store s join store_class t on (s.sc_id = t.sc_id) where t.sc_id = ?";
	private static final String UPDATE_STMT2 = "UPDATE STORE set store_phone=?, store_addr=?, store_name=?, store_state=? where store_id = ?";

	@Override
	public void insert(StoreVO storeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, (int) storeVO.getSc_id());
			pstmt.setString(2, storeVO.getStore_name());
			pstmt.setString(3, storeVO.getStore_content());
			pstmt.setString(4, storeVO.getStore_phone());
			pstmt.setString(5, storeVO.getStore_addr());
			pstmt.setBytes(6, storeVO.getStore_image());
			pstmt.setString(7, storeVO.getStore_pw());
			pstmt.setString(8, storeVO.getStore_acc());
			pstmt.setInt(9, (int) storeVO.getStore_out());
			pstmt.setString(10, storeVO.getStore_zone());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
		}
		if (con != null) {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void update(StoreVO storeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setInt(1, (int) storeVO.getSc_id());
			pstmt.setString(2, storeVO.getStore_content());
			pstmt.setString(3, storeVO.getStore_phone());
			pstmt.setString(4, storeVO.getStore_addr());
			pstmt.setBytes(5, storeVO.getStore_image());
			pstmt.setInt(6, (int) storeVO.getStore_out());
			pstmt.setString(7, storeVO.getStore_zone());
			pstmt.setString(8, storeVO.getStore_pw());
			pstmt.setString(9, storeVO.getStore_id());

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
	public void delete(String store_id) {

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, store_id);

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("找不到driver" + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("發生錯誤" + se.getMessage());
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
	}

	@Override
	public StoreVO findByPrimaryKey(String store_id) {

		StoreVO storeVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Find_by_PK);
			pstmt.setString(1, store_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				storeVO = new StoreVO();
				storeVO.setStore_id(rs.getString("store_id"));
				storeVO.setSc_id(rs.getInt("Sc_id"));
				storeVO.setStore_name(rs.getString("store_name"));
				storeVO.setStore_content(rs.getString("store_content"));
				storeVO.setStore_phone(rs.getString("store_phone"));
				storeVO.setStore_addr(rs.getString("store_addr"));
				storeVO.setStore_date(rs.getTimestamp("store_date"));
				storeVO.setStore_star(rs.getInt("store_star"));
				storeVO.setStore_count(rs.getInt("store_count"));
				storeVO.setStore_state(rs.getString("store_state"));
				storeVO.setStore_image(rs.getBytes("store_image"));
				storeVO.setStore_report_count(rs.getInt("store_report_count"));
				storeVO.setStore_start_time(rs.getTimestamp("store_start_time"));
				storeVO.setStore_end_time(rs.getTimestamp("store_end_time"));
				storeVO.setStore_pw(rs.getString("store_pw"));
				storeVO.setStore_acc(rs.getString("store_acc"));
				storeVO.setStore_out(rs.getInt("store_out"));
				storeVO.setStore_zone(rs.getString("store_zone"));
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
		return storeVO;
	}

	@Override
	public List<StoreVO> getAll() {
		List<StoreVO> storelist = new ArrayList<StoreVO>();
		StoreVO storeVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			pstmt = con.prepareStatement(Find_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				storeVO = new StoreVO();
				storeVO.setStore_id(rs.getString("store_id"));
				storeVO.setSc_id(rs.getInt("Sc_id"));
				storeVO.setStore_name(rs.getString("store_name"));
				storeVO.setStore_content(rs.getString("store_content"));
				storeVO.setStore_phone(rs.getString("store_phone"));
				storeVO.setStore_addr(rs.getString("store_addr"));
				storeVO.setStore_date(rs.getTimestamp("store_date"));
				storeVO.setStore_star(rs.getInt("store_star"));
				storeVO.setStore_count(rs.getInt("store_count"));
				storeVO.setStore_state(rs.getString("store_state"));
				storeVO.setStore_image(rs.getBytes("store_image"));
				storeVO.setStore_report_count(rs.getInt("store_report_count"));
				storeVO.setStore_start_time(rs.getTimestamp("store_start_time"));
				storeVO.setStore_end_time(rs.getTimestamp("store_end_time"));
				storeVO.setStore_pw(rs.getString("store_pw"));
				storeVO.setStore_acc(rs.getString("store_acc"));
				storeVO.setStore_out(rs.getInt("store_out"));
				storeVO.setStore_zone(rs.getString("store_zone"));
				storelist.add(storeVO);
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
		return storelist;
	}

	@Override
	public List<StoreVO> findName(String store_name) {
		List<StoreVO> storetlist = new ArrayList<StoreVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StoreVO storeVO = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Find_NAME);

			pstmt.setString(1, "%" + store_name + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				storeVO = new StoreVO();
				storeVO.setStore_id(rs.getString("store_id"));
				storeVO.setSc_id(rs.getInt("Sc_id"));
				storeVO.setStore_name(rs.getString("store_name"));
				storeVO.setStore_content(rs.getString("store_content"));
				storeVO.setStore_phone(rs.getString("store_phone"));
				storeVO.setStore_addr(rs.getString("store_addr"));
				storeVO.setStore_date(rs.getTimestamp("store_date"));
				storeVO.setStore_star(rs.getInt("store_star"));
				storeVO.setStore_count(rs.getInt("store_count"));
				storeVO.setStore_state(rs.getString("store_state"));
				storeVO.setStore_image(rs.getBytes("store_image"));
				storeVO.setStore_report_count(rs.getInt("store_report_count"));
				storeVO.setStore_start_time(rs.getTimestamp("store_start_time"));
				storeVO.setStore_end_time(rs.getTimestamp("store_end_time"));
				storeVO.setStore_pw(rs.getString("store_pw"));
				storeVO.setStore_acc(rs.getString("store_acc"));
				storeVO.setStore_out(rs.getInt("store_out"));
				storeVO.setStore_zone(rs.getString("store_zone"));
				storetlist.add(storeVO);
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
		return storetlist;
	}

	@Override
	public List<StoreVO> findZone(String store_zone) {
		List<StoreVO> storetlist = new ArrayList<StoreVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StoreVO storeVO = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Find_ZONE);

			pstmt.setString(1, store_zone);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				storeVO = new StoreVO();
				storeVO.setStore_id(rs.getString("store_id"));
				storeVO.setSc_id(rs.getInt("Sc_id"));
				storeVO.setStore_name(rs.getString("store_name"));
				storeVO.setStore_content(rs.getString("store_content"));
				storeVO.setStore_phone(rs.getString("store_phone"));
				storeVO.setStore_addr(rs.getString("store_addr"));
				storeVO.setStore_date(rs.getTimestamp("store_date"));
				storeVO.setStore_star(rs.getInt("store_star"));
				storeVO.setStore_count(rs.getInt("store_count"));
				storeVO.setStore_state(rs.getString("store_state"));
				storeVO.setStore_image(rs.getBytes("store_image"));
				storeVO.setStore_report_count(rs.getInt("store_report_count"));
				storeVO.setStore_start_time(rs.getTimestamp("store_start_time"));
				storeVO.setStore_end_time(rs.getTimestamp("store_end_time"));
				storeVO.setStore_pw(rs.getString("store_pw"));
				storeVO.setStore_acc(rs.getString("store_acc"));
				storeVO.setStore_out(rs.getInt("store_out"));
				storeVO.setStore_zone(rs.getString("store_zone"));
				storetlist.add(storeVO);
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
		return storetlist;
	}

	@Override
	public List<StoreVO> ClassLink(String sc_id) {
		List<StoreVO> storelist = new ArrayList<StoreVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StoreVO storeVO = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(CLASSLINK);

			pstmt.setString(1, sc_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				storeVO = new StoreVO();
				storeVO.setSc_id(rs.getInt("sc_id"));
				storeVO.setStore_id(rs.getString("store_id"));
				storeVO.setStore_name(rs.getString("store_name"));
				storeVO.setSc_name(rs.getString("sc_name"));
				storelist.add(storeVO);
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
		return storelist;
	}

	public static void main(String[] args) throws IOException {

		StoreJDBC_DAO storedao = new StoreJDBC_DAO();
		// 新增
		// StoreVO svo = new StoreVO();
		// svo.setSc_id(3);
		// svo.setStore_name("漢堡王");
		// svo.setStore_content("漢堡王，是總部位於美國的知名國際性速食連鎖店");
		// svo.setStore_phone("123123123");
		// svo.setStore_addr("美國佛羅里達州邁阿密");
		// byte[] pic = getPictureByteArray("FakeInfo/king.png");
		// svo.setStore_image(pic);
		// svo.setStore_pw("1234");
		// svo.setStore_acc("a123456");
		// svo.setStore_out(1);
		// svo.setStore_zone("新竹市");
		// storedao.insert(svo);

		// 修改
		// StoreVO storesVO2 = new StoreVO();
		// storesVO2.setSc_id(3);
		// storesVO2.setStore_content("I love it");
		// storesVO2.setStore_phone("10000006");
		// storesVO2.setStore_addr("資策會");
		// byte[] pic = getPictureByteArray("FakeInfo/mm.png");
		// storesVO2.setStore_image(pic);
		// storesVO2.setStore_out(0);
		// storesVO2.setStore_zone("桃園市");
		// storesVO2.setStore_pw("cccccc");
		// storesVO2.setStore_id("STO-000004");
		// storedao.update(storesVO2);

		// 刪除
		// storedao.delete("STO-000007");
		// 查單筆
		// StoreVO svo3 = storedao.findByPrimaryKey("STO-000001");
		// System.out.println(svo3.getSc_id());
		// System.out.println(svo3.getStore_name());
		// System.out.println(svo3.getStore_content());
		// System.out.println(svo3.getStore_phone());
		// System.out.println("---------------------");
		// 查全部
		// List<StoreVO> list = storedao.getAll();
		// for(StoreVO svo1 : list){
		// System.out.println(svo1.getStore_id());
		// System.out.println(svo1.getSc_id());
		// System.out.println(svo1.getStore_name());
		// System.out.println(svo1.getStore_content());
		// System.out.println(svo1.getStore_phone());
		// System.out.println(svo1.getStore_addr());
		// System.out.println("商家進駐日期: "+svo1.getStore_date());
		// System.out.println(svo1.getStore_star());
		// System.out.println(svo1.getStore_count());
		// System.out.println(svo1.getStore_state());
		// System.out.println(svo1.getStore_image());
		// System.out.println(svo1.getStore_report_count());
		// System.out.println(svo1.getStore_start_time());
		// System.out.println(svo1.getStore_end_time());
		// System.out.println(svo1.getStore_pw());
		// System.out.println(svo1.getStore_acc());
		// System.out.println(svo1.getStore_out());
		// System.out.println(svo1.getStore_zone());
		// System.out.println("---------------------");
		// }
		// 查名稱
		// List<StoreVO> list = storedao.findName("BB");
		// for(StoreVO svo1 : list){
		// System.out.println(svo1.getStore_id());
		// System.out.println(svo1.getSc_id());
		// System.out.println(svo1.getStore_name());
		// System.out.println(svo1.getStore_content());
		// System.out.println(svo1.getStore_phone());
		// System.out.println(svo1.getStore_addr());
		// System.out.println("商家進駐日期: "+svo1.getStore_date());
		// System.out.println(svo1.getStore_star());
		// System.out.println(svo1.getStore_count());
		// System.out.println(svo1.getStore_state());
		// System.out.println(svo1.getStore_image());
		// System.out.println(svo1.getStore_report_count());
		// System.out.println(svo1.getStore_start_time());
		// System.out.println(svo1.getStore_end_time());
		// System.out.println(svo1.getStore_pw());
		// System.out.println(svo1.getStore_acc());
		// System.out.println(svo1.getStore_out());
		// System.out.println(svo1.getStore_zone());
		// System.out.println("---------------------");
		// }
		// 查地區
		// List<StoreVO> list = storedao.findZone("3");
		// for(StoreVO svo1 : list){
		// System.out.println(svo1.getStore_id());
		// System.out.println(svo1.getSc_id());
		// System.out.println(svo1.getStore_name());
		// System.out.println(svo1.getStore_content());
		// System.out.println(svo1.getStore_phone());
		// System.out.println(svo1.getStore_addr());
		// System.out.println("商家進駐日期: "+svo1.getStore_date());
		// System.out.println(svo1.getStore_star());
		// System.out.println(svo1.getStore_count());
		// System.out.println(svo1.getStore_state());
		// System.out.println(svo1.getStore_image());
		// System.out.println(svo1.getStore_report_count());
		// System.out.println(svo1.getStore_start_time());
		// System.out.println(svo1.getStore_end_time());
		// System.out.println(svo1.getStore_pw());
		// System.out.println(svo1.getStore_acc());
		// System.out.println(svo1.getStore_out());
		// System.out.println("地區: "+svo1.getStore_zone());
		// System.out.println("---------------------");
		// }
		// 查看商店類型的有哪些商家
		// List<StoreVO> list = storedao.ClassLink("3");
		// for(StoreVO svo1 : list){
		// System.out.println(svo1.getStore_id());
		// System.out.println(svo1.getSc_id());
		// System.out.println(svo1.getStore_name());
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
	public void update2(StoreVO storeVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT2);

			pstmt.setString(1, storeVO.getStore_phone());
			pstmt.setString(2, storeVO.getStore_addr());
			pstmt.setString(3, storeVO.getStore_name());
			pstmt.setString(4, storeVO.getStore_state());
			pstmt.setString(5, storeVO.getStore_id());

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
}
