package com.order.model;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URI;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



public class Store_OrderJDBCDAO implements Store_OrderDAO_interface{
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "JDBC";
	String passwd = "JDBC";
	
	private static final String INSERT_STMT = 
			"INSERT INTO STORE_order (order_id, order_time, mem_id, store_id, order_state, totalprice, order_way, receive_address, qrcode, order_note, order_taketime) "
			         + "VALUES (to_char(sysdate,'YYYYmmdd')||'-'||LPAD(to_char(order_seq.NEXTVAL),6,'0'),?,?,?,?,?,?,?,?,?,?)";
	private static final String UPDATE = 
			"UPDATE order set STORE_order_id=?, order_time=?, mem_id=?, store_id=?, order_state=?, totalprice=?, order_way=?, receive_address=?, qrcode=?, order_note=?, order_taketime=?";
	private static final String DELETE = 
			"DELETE FROM STORE_order where order_id = ?";
	private static final String GET_ONE_STMT = 
			"SELECT order_id, order_time, mem_id, store_id, order_state, totalprice, order_way, receive_address, qrcode, order_note, order_taketime from STORE_order where order_id = ?";
	private static final String GET_ALL_STMT = 
			"SELECT order_id, order_time, mem_id, store_id, order_state, totalprice, order_way, receive_address, qrcode, order_note, order_taketime from STORE_order order by order_id";
	
	@Override
	public void insert(Store_OrderVO orderVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setTimestamp(1, orderVO.getOrder_time());
			pstmt.setString(2, orderVO.getMem_id());
			pstmt.setString(3, orderVO.getStore_id());
			pstmt.setInt(4, orderVO.getOrder_state());
			pstmt.setInt(5, orderVO.getTotalprice());
			pstmt.setInt(6, orderVO.getOrder_way());
			pstmt.setString(7, orderVO.getReceive_address());
			pstmt.setBytes(8, orderVO.getQrcode());
			pstmt.setString(9, orderVO.getOrder_note());
			pstmt.setTimestamp(10, orderVO.getOrder_taketime());
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
	public void update(Store_OrderVO orderVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, orderVO.getOrder_id());
			pstmt.setTimestamp(2, orderVO.getOrder_time());
			pstmt.setString(3, orderVO.getMem_id());
			pstmt.setString(4, orderVO.getStore_id());
			pstmt.setInt(5, orderVO.getOrder_state());
			pstmt.setInt(6, orderVO.getTotalprice());
			pstmt.setInt(7, orderVO.getOrder_way());
			pstmt.setString(8, orderVO.getReceive_address());
			pstmt.setBytes(9, orderVO.getQrcode());
			pstmt.setString(10, orderVO.getOrder_note());
			pstmt.setTimestamp(11, orderVO.getOrder_taketime());

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
	public void delete(String order_id) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, order_id);

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
	public Store_OrderVO findByPrimaryKey(String order_id) {
		// TODO Auto-generated method stub
		Store_OrderVO orderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, order_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				orderVO = new Store_OrderVO();
				orderVO.setOrder_id(rs.getString("order_id"));
				orderVO.setOrder_time(rs.getTimestamp("rec_mon"));
				orderVO.setMem_id(rs.getString("mem_id"));
				orderVO.setStore_id(rs.getString("store_id"));
				orderVO.setOrder_state(rs.getInt("order_state"));
				orderVO.setTotalprice(rs.getInt("totalprice"));
				orderVO.setOrder_way(rs.getInt("order_way"));
				orderVO.setReceive_address(rs.getString("receive_address"));
				orderVO.setQrcode(rs.getBytes("qrcode"));
				orderVO.setOrder_note(rs.getString("order_note"));
				orderVO.setOrder_taketime(rs.getTimestamp("order_taketime"));
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
		
		return orderVO;
	}

	@Override
	public List<Store_OrderVO> getAll() {
		// TODO Auto-generated method stub
		List<Store_OrderVO> list = new ArrayList<Store_OrderVO>();
		Store_OrderVO orderVO = null;

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
				orderVO = new Store_OrderVO();
				orderVO.setOrder_id(rs.getString("order_id"));
				orderVO.setOrder_time(rs.getTimestamp("order_time"));
				orderVO.setMem_id(rs.getString("mem_ide"));
				orderVO.setStore_id(rs.getString("store_id"));
				orderVO.setOrder_state(rs.getInt("order_state"));
				orderVO.setTotalprice(rs.getInt("totalprice"));
				orderVO.setOrder_way(rs.getInt("order_way"));
				orderVO.setReceive_address(rs.getString("receive_address"));
				orderVO.setQrcode(rs.getBytes("qrcode"));
				orderVO.setOrder_note(rs.getString("order_note"));
				orderVO.setOrder_taketime(rs.getTimestamp("order_taketime"));
				list.add(orderVO); // Store the row in the list
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
	
	public static byte[] getPictureByteArray(String path) throws IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];
		int i;
		while ((i = fis.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		fis.close();

		return baos.toByteArray();
	}

	

	
public static void main(String[] args) throws IOException{
		
		Store_OrderJDBCDAO dao = new Store_OrderJDBCDAO();

		

		
		//新增
		Store_OrderVO orderVO1 = new Store_OrderVO();
		orderVO1.setOrder_time(new Timestamp(System.currentTimeMillis()));
		orderVO1.setMem_id("MEM-000001");
		orderVO1.setStore_id("STO-000002");
		orderVO1.setOrder_state(3);
		orderVO1.setTotalprice(1000);
		orderVO1.setOrder_way(0);
		orderVO1.setReceive_address("");
		
		orderVO1.setOrder_note("");
		orderVO1.setOrder_taketime(new Timestamp(System.currentTimeMillis()));
		dao.insert(orderVO1);
		
		//修改
//		OrderVO orderVO2 = new OrderVO();
//		orderVO1.setOrder_id("");
//		orderVO1.setOrder_time(java.sql.Timestamp.valueOf(""));
//		orderVO1.setMem_id("");
//		orderVO1.setStore_id("");
//		orderVO1.setOrder_state(3);
//		orderVO1.setTotalprice(1000);
//		orderVO1.setOrder_way(0);
//		orderVO1.setReceive_address("");
//		orderVO1.setQrcode(null);
//		orderVO1.setOrder_note("");
//		orderVO1.setOrder_taketime(java.sql.Timestamp.valueOf(""));
//		dao.update(orderVO2);
		
		//查詢
//		OrderVO orderVO3 = dao.findByPrimaryKey("");
//		System.out.print(orderVO3.getOrder_id() + ",");
//		System.out.print(orderVO3.getOrder_time() + ",");
//		System.out.print(orderVO3.getMem_id() + ",");
//		System.out.print(orderVO3.getStore_id() + ",");
//		System.out.print(orderVO3.getOrder_state() + ",");
//		System.out.print(orderVO3.getTotalprice() + ",");
//		System.out.print(orderVO3.getOrder_way() + ",");
//		System.out.print(orderVO3.getReceive_address() + ",");
//		System.out.print(orderVO3.getQrcode() + ",");
//		System.out.print(orderVO3.getOrder_note() + ",");
//		System.out.print(orderVO3.getOrder_taketime() + ",");
//		System.out.println("---------------------");
		
		//新增
//		List<OrderVO> list = dao.getAll();
//		for(OrderVO aOrder : list){
//			System.out.print(aOrder.getOrder_id() + ",");
//			System.out.print(aOrder.getOrder_time() + ",");
//			System.out.print(aOrder.getMem_id() + ",");
//			System.out.print(aOrder.getStore_id() + ",");
//			System.out.print(aOrder.getOrder_state() + ",");
//			System.out.print(aOrder.getTotalprice() + ",");
//			System.out.print(aOrder.getOrder_way() + ",");
//			System.out.print(aOrder.getReceive_address() + ",");
//			System.out.print(aOrder.getQrcode() + ",");
//			System.out.print(aOrder.getOrder_note() + ",");
//			System.out.print(aOrder.getOrder_taketime() + ",");
//			System.out.println("---------------------");	
//		}
	}

}
