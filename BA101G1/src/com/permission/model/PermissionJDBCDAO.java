package com.permission.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class PermissionJDBCDAO implements PermissionDAO_interface{

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "JDBC";
	String passwd = "JDBC";
	
	private static final String INSERT_STMT = 
			"INSERT INTO  permission (man_id, pa_id) VALUES (?,?)";
	private static final String UPDATE = 
			"UPDATE permission set man_id = ?, pa_id = ?";
	private static final String DELETE = 
			"DELETE FROM permission where man_id = ?";
	private static final String GET_ONE_STMT = 
			"SELECT man_id, pa_id from permission where man_id = ?";
	private static final String GET_ALL_STMT = 
			"SELECT  man_id, pa_id from permisson order by man_id";
	
	
	@Override
	public void insert(PermissionVO permissionVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, permissionVO.getMan_id());
			pstmt.setString(2, permissionVO.getPa_id());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
	public void update(PermissionVO permissionVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, permissionVO.getMan_id());
			pstmt.setString(2, permissionVO.getPa_id());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
	public void delete(String man_id , String pa_id) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, man_id);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
	public List<PermissionVO> findByPrimaryKey(String man_id) {
		// TODO Auto-generated method stub
		PermissionVO permissionVO = null;
		List<PermissionVO> list = new ArrayList<PermissionVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, man_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				permissionVO = new PermissionVO();
				permissionVO.setMan_id(rs.getString("man_id"));
				permissionVO.setPa_id(rs.getString("pa_id"));
				list.add(permissionVO);
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	@Override
	public List<PermissionVO> getAll() {
		// TODO Auto-generated method stub
		List<PermissionVO> list = new ArrayList<PermissionVO>();
		PermissionVO permissionVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				permissionVO = new PermissionVO();
				permissionVO.setMan_id(rs.getString("man_id"));
				permissionVO.setPa_id(rs.getString("pa_id"));
				list.add(permissionVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	
public static void main(String[] args){
		
		PermissionJDBCDAO dao = new PermissionJDBCDAO();
		
		//新增
		PermissionVO permissionVO1 = new PermissionVO();
		permissionVO1.setMan_id("MAN-000003");
		permissionVO1.setPa_id("2");
		dao.insert(permissionVO1);
		
		//修改
//		PermissionVO permissionVO2 = new PermissionVO();
//		permissionVO2.setMan_id("");
//		permissionVO2.setPa_id("");
//		dao.update(permissionVO2);
		
		//查詢
//		PermissionVO permissionVO3 = dao.findByPrimaryKey("");
//		System.out.print(permissionVO3.getMan_id() + ",");
//		System.out.print(permissionVO3.getPa_id() + ",");
//		System.out.println("---------------------");
		
		//新增
//		List<PermissionVO> list = dao.getAll();
//		for(PermissionVO aPermission : list){
//			System.out.print(aPermission.getMan_id() + ",");
//			System.out.print(aPermission.getPa_id() + ",");
//			System.out.println("---------------------");	
//		}
	}
@Override
public List<PermissionVO> findByManId(String man_id) {
	// TODO Auto-generated method stub
	return null;
}
}
