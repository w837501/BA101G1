package com.permission_ability.model;

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
import org.hibernate.*;

import com.member_report.model.MemberReportVO;
import com.permission.model.PermissionVO;
import com.tools.HibernateUtil;


public class PermissionAbilityDAO implements Permission_AbilityDAO_interface{
	
//	private static final String GET_ALL_STMT = "from PermissionVO order by man_id desc";
	private static final String GET_ALL_STMT = "SELECT * FROM permission_ability";
	private static final String GET_ONE_STMT = "SELECT * where pa_id = ?";
	private static final String INSERT_STMT = "INSERT into permission_ability(pa_id , pa_name ) VALUES(?,?)";
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA101G1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void insert(Permission_AbilityVO paVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, paVO.getPa_id());
			pstmt.setString(2, paVO.getPa_name());

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
	public void update(Permission_AbilityVO paVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String pano) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public Permission_AbilityVO findByPrimaryKey(String pano) {

		Permission_AbilityVO paVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, pano);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				paVO = new Permission_AbilityVO();
				paVO.setPa_id(rs.getString("mr_id"));
				paVO.setPa_name(rs.getString("mem_id"));
			}

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
		return paVO;
	}




	@Override
	public List<Permission_AbilityVO> getAll() {
		List<Permission_AbilityVO> list = new ArrayList<Permission_AbilityVO>();
		Permission_AbilityVO paVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				paVO = new Permission_AbilityVO();
				paVO.setPa_id(rs.getString("pa_id"));
				paVO.setPa_name(rs.getString("pa_name"));
				list.add(paVO); // Store the row in the list
			}

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
		return list;
	}
}
