package com.man.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ManagerJDBCDAO implements ManagerDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BA101G1";
	String passwd = "ba101g1";

	private static final String INSERT_STMT = "INSERT into MANAGER (man_id,man_name,man_phone,man_pw,man_mail)VALUES('MAN'||'-'||LPAD(to_char(MAN_SEQ.nextval),6,'0'),?,?,?,?)";
	private static final String UPDATE_STMT = "UPDATE MANAGER set man_name=?, man_phone=?, man_pw=?, man_mail=? where man_id = ?";
	private static final String DELETE = "DELETE FROM MANAGER where man_id = ?";
	private static final String Find_by_PK = "select * from manager where man_id=?";
	private static final String GET_ALL = "select * from manager";

	@Override
	public void insert(ManagerVO managerVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, managerVO.getMan_name());
			pstmt.setString(2, managerVO.getMan_phone());
			pstmt.setString(3, managerVO.getMan_pw());
			pstmt.setString(4, managerVO.getMan_mail());

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
	public void update(ManagerVO managerVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, managerVO.getMan_name());
			pstmt.setString(2, managerVO.getMan_phone());
			pstmt.setString(3, managerVO.getMan_pw());
			pstmt.setString(4, managerVO.getMan_mail());
			pstmt.setString(5, managerVO.getMan_id());

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
	public void delete(String man_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, man_id);

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
	public ManagerVO findByPrimaryKey(String man_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ManagerVO man = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Find_by_PK);

			pstmt.setString(1, man_id);
			rs = pstmt.executeQuery();
			rs.next();
			String man_name = rs.getString("man_name");
			String man_phone = rs.getString("man_phone");
			String man_pw = rs.getString("man_pw");
			String man_mail = rs.getString("man_mail");
			String man_idd = rs.getString("man_id");
			man = new ManagerVO(man_idd, man_name, man_phone, man_pw, man_mail);

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
		return man;
	}

	@Override
	public List<ManagerVO> getAll() {
		List<ManagerVO> managerlist = new ArrayList<ManagerVO>();
		ManagerVO managervo = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				managervo = new ManagerVO();
				managervo.setMan_id(rs.getString("man_id"));
				managervo.setMan_name(rs.getString("man_name"));
				managervo.setMan_phone(rs.getString("man_phone"));
				managervo.setMan_pw(rs.getString("man_pw"));
				managervo.setMan_mail(rs.getString("man_mail"));
				managerlist.add(managervo); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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
		return managerlist;
	}

	

	public static void main(String[] args) {

		ManagerJDBCDAO managerdao = new ManagerJDBCDAO();

		ManagerVO managervo = new ManagerVO("元元", "0945612345", "123", "87@87.com");
		managerdao.insert(managervo);
		System.out.println("成功");

		ManagerVO managervo1 = new ManagerVO("MAN-000011", "元寶寶", "0947861234", "789789", "123@87.com");
		managerdao.update(managervo1);
		System.out.println("修改成功");

		managerdao.delete("MAN-000011");
		System.out.println("刪除成功");

		ManagerVO man = managerdao.findByPrimaryKey("MAN-000001");
		System.out.println("man_id : " + man.getMan_id());
		System.out.println("man_name : " + man.getMan_name());
		System.out.println("man_phone : " + man.getMan_phone());
		System.out.println("man_pw : " + man.getMan_pw());
		System.out.println("man_mail : " + man.getMan_mail());
		System.out.println("----------------------------------------------");

		List<ManagerVO> managerlist = managerdao.getAll();
		for (ManagerVO mlist : managerlist) {
			System.out.println("man_id : " + mlist.getMan_id());
			System.out.println("man_name : " + mlist.getMan_name());
			System.out.println("man_phone : " + mlist.getMan_phone());
			System.out.println("man_pw : " + mlist.getMan_pw());
			System.out.println("man_mail : " + mlist.getMan_mail());
			System.out.println("----------------------------------------------");
		}

	}

	@Override
	public String findByEmail(String man_mail) {
		// TODO Auto-generated method stub
		return null;
	}
}
