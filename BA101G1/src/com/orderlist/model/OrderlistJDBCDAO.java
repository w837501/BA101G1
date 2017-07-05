package com.orderlist.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import com.permission.model.PermissionJDBCDAO;
import com.permission.model.PermissionVO;

public class OrderlistJDBCDAO implements OrderlistDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BA101G1";
	String passwd = "ba101g1";
	
	private static final String INSERT_STMT = 
			"INSERT INTO orderlist (order_id, pro_id,order_amount, price) VALUES (?, ?, ?, ?)";
		private static final String GET_ALL_STMT = 
			"SELECT order_id, pro_id,order_amount, price FROM orderlist order by orderlist";
		private static final String GET_ONE_STMT = 
			"SELECT order_id, pro_id,order_amount, price FROM orderlist where order_id = ? ";
		private static final String DELETE = 
			"DELETE FROM orderlist where order_id = ? and pro_id=?";
		private static final String UPDATE = 
			"UPDATE orderlist set order_amount, price where order_id=? and pro_id=?";
	
	@Override
	public void insert(OrderlistVO orderlistVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, orderlistVO.getOrder_id());
			pstmt.setString(2, orderlistVO.getPro_id());
			pstmt.setInt(3, orderlistVO.getOrder_amount());
			pstmt.setInt(4,orderlistVO.getPrice());
			

			pstmt.executeUpdate();

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
	public void update(OrderlistVO orderlistVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, orderlistVO.getOrder_id());
			pstmt.setString(2, orderlistVO.getPro_id());

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public void delete(String order_id, String pro_id) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, order_id);
			pstmt.setString(2, pro_id);

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public List<OrderlistVO> findByPrimaryKey(String order_id) {
		// TODO Auto-generated method stub
		OrderlistVO orderlistVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<OrderlistVO> list=new LinkedList<OrderlistVO>();
		try {
			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, order_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				orderlistVO = new OrderlistVO();
				orderlistVO.setOrder_id(rs.getString("order_id"));
				orderlistVO.setPro_id(rs.getString("pro_id"));
				orderlistVO.setOrder_amount(rs.getInt("order_amount"));
				orderlistVO.setPrice(rs.getInt("price"));
				list.add(orderlistVO);
			}

			// Handle any driver errors
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
	public List<OrderlistVO> getAll() {
		// TODO Auto-generated method stub
		List<OrderlistVO> list = new ArrayList<OrderlistVO>();
		OrderlistVO orderlistVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				orderlistVO = new OrderlistVO();
				orderlistVO.setOrder_id(rs.getString("order_id"));
				orderlistVO.setPro_id(rs.getString("pro_id"));
				orderlistVO.setOrder_amount(rs.getInt("order_amount"));
				orderlistVO.setPrice(rs.getInt("price"));
				list.add(orderlistVO); // Store the row in the list
			}

			// Handle any driver errors
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
		OrderlistJDBCDAO dao = new OrderlistJDBCDAO();
		
		//新增
//		OrderlistVO orderlistVO = new OrderlistVO();
//		orderlistVO.setOrder_id("20170623-000010");
//		orderlistVO.setPro_id("PRO-000002");
//		orderlistVO.setPrice(70);
//		orderlistVO.setOrder_amount(2);
//
//		dao.insert(orderlistVO);
		
		//修改
		OrderlistVO orderlistVO2 = new OrderlistVO();
		orderlistVO2.setOrder_id("20170623-000009");
		orderlistVO2.setPro_id("PRO-000004");
		orderlistVO2.setPrice(140);
		orderlistVO2.setOrder_amount(30);
		dao.update(orderlistVO2);
		
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
public List<OrderlistVO> getDetailOrder(String order_id, String pro_id) {
	// TODO Auto-generated method stub
	return null;
}
/*******************OrderDetailByOrderId的 from OrderListServlet.java********************************/
@Override
public String getDetailProIdByOrderId(String order_id) {
	// TODO Auto-generated method stub
	
	
	/*請參考JDBC*/
	return null;
}
}
