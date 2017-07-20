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

		req.setCharacterEncoding("big5"); // ��
		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

		String name = req.getParameter("news_id"); // ��
		String name2 = new String(name.getBytes("ISO-8859-1"), "big5"); // �A

		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT news_image  FROM news WHERE news_id = '" + name2 + "'"); // �����᪺�r��(name2)�����j�p�g

			if (rs.next()) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream(1));
				byte[] buf = new byte[4 * 1024]; // 4K buffer
				int len;
				while ((len = in.read(buf)) != -1) {
					out.write(buf, 0, len);
				}
				in.close();
			} else {
				System.out.println("�ҥH�o�̭n�F��?????????????????");
				InputStream in = getServletContext().getResourceAsStream("/frontend/advertisement/images/logo.png");
				byte[] buf = new byte[in.available()];
				in.read(buf);
				out.write(buf);
				in.close();
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			System.out.println("�S�Ϥ���");
			InputStream in = getServletContext().getResourceAsStream("/frontend/advertisement/images/logo.png");
			byte[] buf = new byte[in.available()];
			in.read(buf);
			out.write(buf);
			in.close();
		}
	}

	public void init() throws ServletException {
		try {
			Context ctx = new javax.naming.InitialContext(); // ����Datasouce���󪺦W�r
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA101G1");
			con = ds.getConnection(); // DataSource�|�� getConnection����k
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