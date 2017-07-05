package com.order.model;

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

import com.record.model.RecordVO;

public class Store_OrderDAO implements Store_OrderDAO_interface{
	
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
			"INSERT INTO store_order (order_id,mem_id, store_id, totalprice, order_way, receive_address, order_note, order_taketime) "
	  + "VALUES (to_char(sysdate,'YYYYmmdd')||'-'||LPAD(to_char(order_seq.NEXTVAL),6,'0'),?,?,?,?,?,?,?)";


	private static final String UPDATE = 
			"UPDATE store_order set order_id=?, order_time=?, mem_id=?, store_id=?, order_state=?, totalprice=?, order_way=?, receive_address=?,  order_note=?, order_taketime=?";
	private static final String DELETE = 
			"DELETE FROM store_order where order_id = ?";
	private static final String GET_ONE_STMT = 
			"SELECT order_id, order_time, mem_id, store_id, order_state, totalprice, order_way, receive_address, order_note, order_taketime from order where order_id = ?";
	private static final String GET_ALL_STMT = 
			"SELECT order_id, order_time, mem_id, store_id, order_state, totalprice, order_way, receive_address,  order_note, order_taketime from store_order order by order_id";
	
	private static final String GET_ORDER_BY_MEM = 
			"select mem_id, order_id, store_id, totalprice, order_time, order_way, order_state from store_order where mem_id = ? order by order_time desc";
	
	private static final String GET_ORDER_BY_MEM2 = 
			"select o.mem_id, o.order_id, o.store_id, o.totalprice, o.order_time, o.order_way, o.order_state ,s.store_name from store_order o join store s on o.store_id = s.store_id where mem_id = ? order by order_time desc";
	private static final String GET_ORDER_BY_STATE=
			"select mem_id, order_id, store_id, totalprice, order_time, order_way, receive_address,order_note, order_taketime ,order_state from  store_order where order_state=?";	
	private static final String CONFIRM_ORDER=
			"Update store_order set order_state=? where order_id=?";
	@Override
	public void insert(Store_OrderVO orderVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, orderVO.getMem_id());
			pstmt.setString(2, orderVO.getStore_id());
			pstmt.setInt(3, orderVO.getTotalprice());
			pstmt.setString(4, orderVO.getOrder_way());
			pstmt.setString(5, orderVO.getReceive_address());
			pstmt.setString(6, orderVO.getOrder_note());
			pstmt.setTimestamp(7, orderVO.getOrder_taketime());
			
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
	public void update(Store_OrderVO orderVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, orderVO.getOrder_id());
			pstmt.setTimestamp(2, orderVO.getOrder_time());
			pstmt.setString(3, orderVO.getMem_id());
			pstmt.setString(4, orderVO.getStore_id());
			pstmt.setString(5, orderVO.getOrder_state());
			pstmt.setInt(6, orderVO.getTotalprice());
			pstmt.setString(7, orderVO.getOrder_way());
			pstmt.setString(8, orderVO.getReceive_address());
			pstmt.setString(9, orderVO.getOrder_note());
			pstmt.setTimestamp(10, orderVO.getOrder_taketime());
			

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
	public void delete(String order_id) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, order_id);

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
	public Store_OrderVO findByPrimaryKey(String order_id) {
		// TODO Auto-generated method stub
		Store_OrderVO orderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, order_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo �]붙О Domain objects
				orderVO = new Store_OrderVO();
				orderVO.setOrder_id(rs.getString("order_id"));
				orderVO.setOrder_time(rs.getTimestamp("rec_mon"));
				orderVO.setMem_id(rs.getString("mem_id"));
				orderVO.setStore_id(rs.getString("store_id"));
				orderVO.setOrder_state(rs.getString("order_state"));
				orderVO.setTotalprice(rs.getInt("totalprice"));
				orderVO.setOrder_way(rs.getString("order_way"));
				orderVO.setReceive_address(rs.getString("receive_address"));
				orderVO.setOrder_note(rs.getString("order_note"));
				orderVO.setOrder_taketime(rs.getTimestamp("order_taketime"));
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
		
		return orderVO;
	}

	@Override
	public List<Store_OrderVO> getAll() {
		// TODO Auto-generated method stub\
		List<Store_OrderVO> list = new ArrayList<Store_OrderVO>();
		Store_OrderVO orderVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO �]붙О Domain objects
				orderVO = new Store_OrderVO();
				orderVO.setOrder_id(rs.getString("order_id"));
				orderVO.setOrder_time(rs.getTimestamp("order_time"));
				orderVO.setMem_id(rs.getString("mem_id"));
				orderVO.setStore_id(rs.getString("store_id"));
				orderVO.setOrder_state(rs.getString("order_state"));
				orderVO.setTotalprice(rs.getInt("totalprice"));
				orderVO.setOrder_way(rs.getString("order_way"));
				orderVO.setReceive_address(rs.getString("receive_address"));
				orderVO.setOrder_note(rs.getString("order_note"));
				orderVO.setOrder_taketime(rs.getTimestamp("order_taketime"));
				list.add(orderVO); // Store the row in the list
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
	public List<Store_OrderVO> findOrderByMem(String mem_id) {
		// TODO Auto-generated method stub
		List<Store_OrderVO> list = new LinkedList<Store_OrderVO>();
		Store_OrderVO orderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ORDER_BY_MEM2);

			pstmt.setString(1, mem_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo �]붙О Domain objects
				orderVO = new Store_OrderVO();
				orderVO.setOrder_id(rs.getString("order_id"));
				orderVO.setOrder_time(rs.getTimestamp("order_time"));
				orderVO.setMem_id(rs.getString("mem_id"));
				orderVO.setStore_id(rs.getString("store_id"));
				orderVO.setOrder_state(rs.getString("order_state"));
				orderVO.setTotalprice(rs.getInt("totalprice"));
				orderVO.setOrder_way(rs.getString("order_way"));
				orderVO.setStore_name(rs.getString("store_name"));
				list.add(orderVO);
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
	public List<Store_OrderVO> findOrderByState(String state) {
		List<Store_OrderVO> list = new LinkedList<Store_OrderVO>();
		Store_OrderVO orderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ORDER_BY_STATE);

			pstmt.setString(1, state);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo �]붙О Domain objects
				orderVO = new Store_OrderVO();
				orderVO.setMem_id(rs.getString("mem_id")); 
				orderVO.setOrder_id(rs.getString("order_id"));
				orderVO.setStore_id(rs.getString("store_id"));
				orderVO.setTotalprice(rs.getInt("totalprice"));
				orderVO.setOrder_time(rs.getTimestamp("order_time"));
				orderVO.setOrder_way(rs.getString("order_way"));
				orderVO.setReceive_address(rs.getString("receive_address"));
				orderVO.setOrder_note(rs.getString("order_note"));
				orderVO.setOrder_taketime(rs.getTimestamp("order_taketime"));
				orderVO.setOrder_state(rs.getString("order_state"));
				list.add(orderVO);
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
	public void confirm_order(String order_id, String order_state) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(CONFIRM_ORDER);
			pstmt.setString(1, order_state);
			pstmt.setString(2, order_id);
			
			pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally{
			
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
}
