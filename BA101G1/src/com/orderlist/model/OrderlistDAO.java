package com.orderlist.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.orderlist.model.OrderlistVO;
import com.sun.org.apache.xpath.internal.operations.Or;

public class OrderlistDAO implements OrderlistDAO_interface{
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA101G1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
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
		
		private static final String GET_DETAIL_ORDER_BY_ORDER_ID = 
			"select p.pro_name, o.price, o.order_amount from orderlist o join product p on o.pro_id = p.pro_id where o.order_id = ? and o.pro_id=?";
		
		/*******************OrderDetailByOrderId的 from OrderListServlet.java********************************/
		private static final String GET_DETAIL_PROID_BY_ORDER_ID = 
			"select pro_id from orderlist where order_id=?";
	@Override
	public void insert(OrderlistVO orderlistVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
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

			con = ds.getConnection();
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

			con = ds.getConnection();
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

			con = ds.getConnection();
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

			con = ds.getConnection();
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
	
	@Override
	public List<OrderlistVO> getDetailOrder(String order_id, String pro_id) {
		// TODO Auto-generated method stub
		List<OrderlistVO> list = new LinkedList<OrderlistVO>();
		OrderlistVO orderlistVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			
			System.out.println(" order_id: " + order_id +" pro_id: " + pro_id);

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_DETAIL_ORDER_BY_ORDER_ID);
			
			
			
			pstmt.setString(1, order_id);
			pstmt.setString(2, pro_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				orderlistVO = new OrderlistVO();
//				orderlistVO.setOrder_id(rs.getString("order_id"));
//				orderlistVO.setPro_id(rs.getString("pro_id"));
				orderlistVO.setOrder_amount(rs.getInt("order_amount"));
				orderlistVO.setPrice(rs.getInt("price"));
				orderlistVO.setPro_name(rs.getString("pro_name"));
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
	/*******************OrderDetailByOrderId的 from OrderListServlet.java********************************/
	@Override
	public String getDetailProIdByOrderId(String order_id) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String proId = "";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_DETAIL_PROID_BY_ORDER_ID);
			pstmt.setString(1, order_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				proId = rs.getString("pro_id");
	
				System.out.println("proID : " + proId);
			}

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
		return proId;

	}

}
