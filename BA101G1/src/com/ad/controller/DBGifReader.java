package com.ad.controller;

import java.io.*;
import java.sql.*;

import javax.naming.Context;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import javax.sql.DataSource;


public class DBGifReader extends HttpServlet {

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
			String ad_id=req.getParameter("ad_id");
			String ad_id2=new String(ad_id.getBytes("ISO-8859-1"),"UTF-8");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(
				"SELECT ad_image FROM ad WHERE ad_id ='"+ad_id2+"'");

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
				InputStream in = getServletContext().getResourceAsStream("/NoData/loading_spinner.gif");
				byte[] buf=new byte[in.available()];
				in.read(buf);
				out.write(buf);
				in.close();
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			InputStream in = getServletContext().getResourceAsStream("/NoData/loading_spinner.gif");
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
