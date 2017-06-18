package com.man.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ManagerJNDIDAO implements ManagerDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA101G1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

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
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, managerVO.getMan_name());
			pstmt.setString(2, managerVO.getMan_phone());
			pstmt.setString(3, managerVO.getMan_pw());
			pstmt.setString(4, managerVO.getMan_mail());

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
	public void update(ManagerVO managerVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, managerVO.getMan_name());
			pstmt.setString(2, managerVO.getMan_phone());
			pstmt.setString(3, managerVO.getMan_pw());
			pstmt.setString(4, managerVO.getMan_mail());
			pstmt.setString(5, managerVO.getMan_id());

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
	public void delete(String man_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, man_id);

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
	public ManagerVO findByPrimaryKey(String man_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ManagerVO managerVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Find_by_PK);

			pstmt.setString(1, man_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				managerVO=new ManagerVO();
				managerVO.setMan_id(rs.getString("man_id"));
				managerVO.setMan_name(rs.getString("man_name"));
				managerVO.setMan_phone(rs.getString("man_phone"));
				managerVO.setMan_pw(rs.getString("man_pw"));
				managerVO.setMan_mail(rs.getString("man_mail"));
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
		return managerVO;
	}

	@Override
	public List<ManagerVO> getAll() {
		List<ManagerVO> managerlist = new ArrayList<ManagerVO>();
		ManagerVO managervo = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO ¤]ºÙ¬° Domain objects
				managervo = new ManagerVO();
				managervo.setMan_id(rs.getString("man_id"));
				managervo.setMan_name(rs.getString("man_name"));
				managervo.setMan_phone(rs.getString("man_phone"));
				managervo.setMan_pw(rs.getString("man_pw"));
				managervo.setMan_mail(rs.getString("man_mail"));
				managerlist.add(managervo); // Store the row in the list
			}

			// Handle any driver errors
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
}
