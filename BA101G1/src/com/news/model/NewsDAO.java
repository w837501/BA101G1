package com.news.model;

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

import com.news.model.NewsVO;

public class NewsDAO implements NewsDAO_interface{

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA101G1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT = "INSERT into NEWS(news_id , man_id , news_name , news_content , news_image  ) VALUES('NEWS'||'-'||LPAD(to_char(NEWS_SEQ.NEXTVAL),5,'0'),?,?,?,?)";
	private static final String UPDATE_STMT = "UPDATE NEWS set man_id=? , news_name=?, news_content=?, news_image=? where news_id=?";
	private static final String DELETE = "DELETE FROM NEWS where news_id = ?";
	private static final String Find_by_PK = "select * from NEWS where news_id=?";
	private static final String Find_ALL = "select * from NEWS order by news_time desc";
	
	@Override
	public void insert(NewsVO newsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, newsVO.getMan_id());
			pstmt.setString(2, newsVO.getNews_name());
			pstmt.setString(3, newsVO.getNews_content());
			pstmt.setBytes(4, newsVO.getNews_image());

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
	public void update(NewsVO newsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1, newsVO.getMan_id());
			pstmt.setString(2, newsVO.getNews_name());
			pstmt.setString(3, newsVO.getNews_content());
			pstmt.setBytes(4, newsVO.getNews_image());
			pstmt.setString(5, newsVO.getNews_id());

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
	public void delete(String news_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, news_id);

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
	public NewsVO findByPrimaryKey(String news_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NewsVO newsVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Find_by_PK);

			pstmt.setString(1, news_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				newsVO=new NewsVO();
						
				newsVO.setNews_id(rs.getString("news_id"));
				newsVO.setMan_id(rs.getString("man_id"));
				newsVO.setNews_name(rs.getString("news_name"));
				newsVO.setNews_content(rs.getString("news_content"));
				newsVO.setNews_image(rs.getBytes("news_image"));
				newsVO.setNews_time(rs.getTimestamp("news_time"));
				newsVO.setNews_push_content(rs.getString("news_push_content"));
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
			con = ds.getConnection();
			pstmt = con.prepareStatement(Find_ALL);

			rs = pstmt.executeQuery();
			while(rs.next()){
				newsVO=new NewsVO();
				newsVO.setNews_id(rs.getString("news_id"));
				newsVO.setMan_id(rs.getString("man_id"));
				newsVO.setNews_name(rs.getString("news_name"));
				newsVO.setNews_content(rs.getString("news_content"));
				newsVO.setNews_image(rs.getBytes("news_image"));
				newsVO.setNews_time(rs.getTimestamp("news_time"));
				newsVO.setNews_push_content(rs.getString("news_push_content"));
				newslist.add(newsVO);
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
		return newslist;
	
	}
}
