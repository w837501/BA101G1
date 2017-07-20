package com.tools;

import java.io.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;

//140
public class NewsPicReader extends HttpServlet {

	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("big5"); // 先
		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

		String name = req.getParameter("news_id"); // 後
		String name2 = new String(name.getBytes("ISO-8859-1"), "big5"); // 再

		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT news_image  FROM news WHERE news_id = '" + name2 + "'"); // 等號後的字串(name2)有分大小寫

			if (rs.next()) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream(1));
				byte[] buf = new byte[4 * 1024]; // 4K buffer
				int len;
				while ((len = in.read(buf)) != -1) {
					out.write(buf, 0, len);
				}
				in.close();
			} else {
				System.out.println("所以這裡要幹嘛?????????????????");
				InputStream in = getServletContext().getResourceAsStream("/frontend/advertisement/images/logo.png");
				byte[] buf = new byte[in.available()];
				in.read(buf);
				out.write(buf);
				in.close();
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			System.out.println("沒圖片唷");
			InputStream in = getServletContext().getResourceAsStream("/frontend/advertisement/images/logo.png");
			byte[] buf = new byte[in.available()];
			in.read(buf);
			out.write(buf);
			in.close();
		}
	}

	public void init() throws ServletException {
		try {
			Context ctx = new javax.naming.InitialContext(); // 說明Datasouce物件的名字
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA101G1");
			con = ds.getConnection(); // DataSource會有 getConnection的方法
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void destroy() {
		try {
			if (con != null)
				con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}
