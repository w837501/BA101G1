package com.member_report.controller;

import java.io.*;
import java.sql.*;

import javax.naming.Context;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import javax.sql.DataSource;


public class MR_DBGifReader extends HttpServlet {

	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setHeader("Cache-Control","no-store"); //HTTP 1.1
		  res.setHeader("Pragma","no-cache");        //HTTP 1.0
		  res.setDateHeader ("Expires", 0);
		req.setCharacterEncoding("UTF-8");
		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

		try {
			Statement stmt = con.createStatement();
			String whichImg = req.getParameter("whichImg");
			String id = req.getParameter("id");
			String pk = new String(id.getBytes("ISO-8859-1"),"UTF-8");
			System.out.println("whichImg "+whichImg+" id "+id);
			String sql;
			switch(whichImg.toLowerCase()){
				case "memr":
					sql = "SELECT mr_image FROM member_report WHERE mr_id ='"+ pk + "'";
					break;
				case "str":
					sql = "SELECT sr_image FROM store_report WHERE sr_id = '" + pk + "'";
					break;
				case "latn":
					sql = "SELECT news_image FROM news WHERE news_id = '" + pk + "'";
					break;

				default:
					sql = "";
					break;
			}
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream(1));
				byte[] buf = new byte[4 * 1024]; // 4K buffer
				int len;
				while ((len = in.read(buf)) != -1) {
					out.write(buf, 0, len);
				}
				in.close();
			} 
			else {
				System.out.println("所以這裡要幹嘛?????????????????");
				InputStream in=getServletContext().getResourceAsStream("/frontend/advertisement/images/logo.png");
				byte[] buf=new byte[in.available()];
				in.read(buf);
				out.write(buf);
				in.close();
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			System.out.println("沒圖片唷");
			InputStream in=getServletContext().getResourceAsStream("/frontend/advertisement/images/logo.png");
			byte[] buf=new byte[in.available()];
			in.read(buf);
			out.write(buf);
			in.close();
		}
	}

	public void init() throws ServletException {
		try {
			Context ctx = new javax.naming.InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA101G1");
			con = ds.getConnection();
		} catch (Exception e) {
			throw new UnavailableException("Couldn't load JdbcOdbcDriver");
		}
	}

	public void destroy() {
		try {
			if (con != null) con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}
