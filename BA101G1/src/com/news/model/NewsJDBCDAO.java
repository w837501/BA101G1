package com.news.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.news.model.NewsVO;

public class NewsJDBCDAO implements NewsDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BA101G1";
	String passwd = "ba101g1";
	
	private static final String INSERT_STMT = "INSERT into NEWS VALUES(?,?,?,?,?,?,?)";
	private static final String UPDATE_STMT = "UPDATE NEWS set news_name=?, news_content=?, news_image=?, news_time=?, news_push_content=? where news_id=?";
	private static final String DELETE = "DELETE FROM NEWS where news_id = ?";
	private static final String Find_by_PK = "select * from NEWS where news_id=?";
	private static final String Find_ALL = "select * from NEWS";
	
	@Override
	public void insert(NewsVO newsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, newsVO.getNews_id());
			pstmt.setString(2, newsVO.getMan_id());
			pstmt.setString(3, newsVO.getNews_name());
			pstmt.setString(4, newsVO.getNews_content());
			pstmt.setBytes(5, newsVO.getNews_image());
			pstmt.setTimestamp(6, newsVO.getNews_time());
			pstmt.setString(7, newsVO.getNews_push_content());

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
	public void update(NewsVO newsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);
			Clob clob = con.createClob();
			clob.setString(0, newsVO.getNews_content());
			pstmt.setString(1, newsVO.getNews_name());
			pstmt.setClob(2, clob);
			pstmt.setBytes(3, newsVO.getNews_image());
			pstmt.setTimestamp(4, newsVO.getNews_time());
			pstmt.setString(5, newsVO.getNews_push_content());
			pstmt.setString(6, newsVO.getNews_id());

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
	public void delete(String news_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, news_id);

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
	public NewsVO findByPrimaryKey(String news_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NewsVO newsVO = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Find_by_PK);

			pstmt.setString(1, news_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				newsVO=new NewsVO();
				
				newsVO.setMan_id(rs.getString("news_id"));
				newsVO.setNews_name(rs.getString("news_name"));
				newsVO.setNews_content(rs.getString("news_content"));
				newsVO.setNews_image(rs.getBytes("news_image"));
				newsVO.setNews_time(rs.getTimestamp("news_time"));
				newsVO.setNews_push_content(rs.getString("news_push_content"));
				
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
		return newsVO;
	}
	@Override
	public List<NewsVO> getAll() {
		List<NewsVO> newslist = new ArrayList<NewsVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NewsVO newsVO = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Find_ALL);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				newsVO=new NewsVO();
				newsVO.setNews_id(rs.getString("man_id"));
				newsVO.setMan_id(rs.getString("news_id"));
				newsVO.setNews_name(rs.getString("news_name"));
				newsVO.setNews_content(rs.getString("news_content"));
				newsVO.setNews_image(rs.getBytes("news_image"));
				newsVO.setNews_time(rs.getTimestamp("news_time"));
				newsVO.setNews_push_content(rs.getString("news_push_content"));
				newslist.add(newsVO);
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
		return newslist;
	}
	
	public static void main(String[] args){
		NewsJDBCDAO newsdao = new NewsJDBCDAO();
		
		//�s�W
		NewsVO newsVO1 = new NewsVO();
		newsVO1.setNews_id("NEWS-00005");
		newsVO1.setMan_id("MAN-000001");
		newsVO1.setNews_name("YOYOYOYO123123");
		newsVO1.setNews_content("�S�������");
		 byte[] pic=null;
			try {
				pic = getPictureByteArray("C:/Users/glayk/git/BA101G1/BA101G1/WebContent/FakeInfo/king.png");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		newsVO1.setNews_image(pic);
		newsVO1.setNews_time(new Timestamp(System.currentTimeMillis()));
		newsVO1.setNews_push_content("����");

		newsdao.insert(newsVO1);
		
//		�ק�
//		NewsVO newsVO2 = new NewsVO();
//		newsVO2.setNews_name("HAHAHAHAHA");
//		newsVO2.setNews_content("�@~�@~�@~�@~�@~�@~����");
//		newsVO2.setNews_image(null);
//		newsVO2.setNews_time(new Timestamp(System.currentTimeMillis()));
//		newsVO2.setNews_push_content("����123");
//		newsVO2.setNews_id("NEWS-00001");
//
//		newsdao.update(newsVO2);
//		
		//�R��
//		newsdao.delete("NEWS-00005");
		
		//��@��
//		NewsVO newsVO3 = newsdao.findByPrimaryKey("NEWS-00004");
//		System.out.println(newsVO3.getNews_id());
//		System.out.println(newsVO3.getNews_name());
//		System.out.println(newsVO3.getNews_content());
//		System.out.println(newsVO3.getNews_image());
//		System.out.println(newsVO3.getNews_time());
//		System.out.println(newsVO3.getNews_push_content());
//		System.out.println("---------------------");
		
		//�����
//		List<NewsVO> list = newsdao.getAll();
//		for (NewsVO aNews : list) {
//			System.out.println(aNews.getNews_id());
//			System.out.println(aNews.getNews_name());
//			System.out.println(aNews.getNews_content());
//			System.out.println(aNews.getNews_image());
//			System.out.println(aNews.getNews_time());
//			System.out.println(aNews.getNews_push_content());
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
