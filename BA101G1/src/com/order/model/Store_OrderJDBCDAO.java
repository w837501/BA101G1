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
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import com.orderlist.model.OrderlistService;
import com.product.model.ProductVO;

public class Store_OrderJDBCDAO implements Store_OrderDAO_interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BA101G1";
	String passwd = "ba101g1";

	private static final String INSERT_STMT = "INSERT INTO STORE_order (order_id, order_time, mem_id, store_id, order_state, totalprice, order_way, receive_address, order_note, order_taketime) "
			+ "VALUES (to_char(sysdate,'YYYYmmdd')||'-'||LPAD(to_char(order_seq.NEXTVAL),6,'0'),?,?,?,?,?,?,?,?,?)";
	private static final String UPDATE = "UPDATE order set STORE_order_id=?, order_time=?, mem_id=?, store_id=?, order_state=?, totalprice=?, order_way=?, receive_address=?, qrcode=?, order_note=?, order_taketime=?";
	private static final String DELETE = "DELETE FROM STORE_order where order_id = ?";
	private static final String GET_ONE_STMT = "SELECT order_id, order_time, mem_id, store_id, order_state, totalprice, order_way, receive_address, qrcode, order_note, order_taketime from STORE_order where order_id = ?";
	private static final String GET_ALL_STMT = "SELECT * from store_order";

	private static final String GET_ORDER_BY_MEM = "select order_id, store_id, totalprice, order_time, order_way, order_state, mem_id from store_order where mem_id = ? order by order_time desc";
	private static final String GET_ORDER_BY_STATE = "select mem_id, order_id, store_id, totalprice, order_time, order_way, receive_address,order_note, order_taketime ,order_state from  store_order where order_state=?";
	private static final String CONFIRM_ORDER = "Update store_order set order_state=? where order_id=?";

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
			pstmt.setString(4, orderVO.getOrder_state());
			pstmt.setInt(5, orderVO.getTotalprice());
			pstmt.setString(6, orderVO.getOrder_way());
			pstmt.setString(7, orderVO.getReceive_address());
			pstmt.setString(8, orderVO.getOrder_note());
			pstmt.setTimestamp(9, orderVO.getOrder_taketime());
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
			pstmt.setString(5, orderVO.getOrder_state());
			pstmt.setInt(6, orderVO.getTotalprice());
			pstmt.setString(7, orderVO.getOrder_way());
			pstmt.setString(8, orderVO.getReceive_address());
			pstmt.setString(9, orderVO.getOrder_note());
			pstmt.setTimestamp(10, orderVO.getOrder_taketime());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
				orderVO.setOrder_state(rs.getString("order_state"));
				orderVO.setTotalprice(rs.getInt("totalprice"));
				orderVO.setOrder_way(rs.getString("order_way"));
				orderVO.setReceive_address(rs.getString("receive_address"));
				orderVO.setOrder_note(rs.getString("order_note"));
				orderVO.setOrder_taketime(rs.getTimestamp("order_taketime"));
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
				orderVO.setMem_id(rs.getString("mem_id"));
				orderVO.setStore_id(rs.getString("store_id"));
				orderVO.setOrder_state(rs.getString("order_state"));
				// orderVO.setTotalprice(rs.getInt("totalprice"));
				// orderVO.setOrder_way(rs.getString("order_way"));
				// orderVO.setReceive_address(rs.getString("receive_address"));
				// orderVO.setQrcode(rs.getBytes("qrcode"));
				// orderVO.setOrder_note(rs.getString("order_note"));
				// orderVO.setOrder_taketime(rs.getTimestamp("order_taketime"));
				// orderVO.setOrder_state(rs.getString("order_state"));
				list.add(orderVO); // Store the row in the list
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

		return list;
	}

	@Override
	public List<Store_OrderVO> findOrderByMem(String mem_id) {
		// TODO Auto-generated method stub
		List<Store_OrderVO> list = new ArrayList<Store_OrderVO>();
		Store_OrderVO orderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ORDER_BY_MEM);

			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				orderVO = new Store_OrderVO();
				orderVO.setOrder_id(rs.getString("order_id"));
				orderVO.setOrder_time(rs.getTimestamp("order_time"));
				orderVO.setMem_id(rs.getString("mem_id"));
				System.out.println(mem_id);
				orderVO.setStore_id(rs.getString("store_id"));
				orderVO.setOrder_state(rs.getString("order_state"));
				orderVO.setTotalprice(rs.getInt("totalprice"));
				orderVO.setOrder_way(rs.getString("order_way"));
				list.add(orderVO);
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

	@Override
	public List<Store_OrderVO> findOrderByState(String state) {
		List<Store_OrderVO> list = new LinkedList<Store_OrderVO>();
		Store_OrderVO orderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("111");
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ORDER_BY_STATE);
			System.out.println(state);

			pstmt.setString(1, state);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
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
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(CONFIRM_ORDER);
			pstmt.setString(1, order_state);
			pstmt.setString(2, order_id);

			pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	public void insertOrderandOrderList(Store_OrderVO orderVO, Vector<ProductVO> buylist) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			String[] cols = { "order_id" };
			pstmt = con.prepareStatement(INSERT_STMT,cols);

			pstmt.setString(1, orderVO.getMem_id());
			pstmt.setString(2, orderVO.getStore_id());
			pstmt.setInt(3, orderVO.getTotalprice());
			pstmt.setString(4, orderVO.getOrder_way());
			pstmt.setString(5, orderVO.getReceive_address());
			pstmt.setString(6, orderVO.getOrder_note());
			pstmt.setTimestamp(7, orderVO.getOrder_taketime());
			
			pstmt.executeUpdate();
			String next_ord_id = null;
			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				next_ord_id = rs.getString(1);
				System.out.println("自增主鍵值= " + next_ord_id +"(剛新增成功的訂單編號)");
			} else {
				System.out.println("未取得自增主鍵值");
			}
			rs.close();
			
			OrderlistService orderlistSvc=new OrderlistService();
			for(ProductVO aaa:buylist){
				orderlistSvc.addOrderlist(next_ord_id,aaa);
			}
			
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	
	
	public static void main(String[] args) throws IOException{
		
		Store_OrderJDBCDAO dao = new Store_OrderJDBCDAO();

		

		
		//新增
//		Store_OrderVO orderVO1 = new Store_OrderVO();
//		orderVO1.setOrder_time(new Timestamp(System.currentTimeMillis()));
//		orderVO1.setMem_id("MEM-000001");
//		orderVO1.setStore_id("STO-000002");
//		orderVO1.setOrder_state("已確認");
//		orderVO1.setTotalprice(140);
//		orderVO1.setOrder_way("自取");
//		orderVO1.setReceive_address("");
//		
//		orderVO1.setOrder_note("");
//		orderVO1.setOrder_taketime(new Timestamp(System.currentTimeMillis()));
//		dao.insert(orderVO1);
		
		//修改
//		OrderVO orderVO2 = new OrderVO();
//		orderVO1.setOrder_id("");
//		orderVO1.setOrder_time(java.sql.Timestamp.valueOf(""));
//		orderVO1.setMem_id("");
//		orderVO1.setStore_id("");
//		orderVO1.setOrder_state("待取餐");
//		orderVO1.setTotalprice(1000);
//		orderVO1.setOrder_way("內用");
//		orderVO1.setReceive_address("");
//		orderVO1.setQrcode(null);
//		orderVO1.setOrder_note("");
//		orderVO1.setOrder_taketime(java.sql.Timestamp.valueOf(""));
//		dao.update(orderVO2);
		
		//查詢
//		Store_OrderVO orderVO3 = dao.findByPrimaryKey("");
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
		
		
//		List<Store_OrderVO> list = dao.getAll();
//		for(Store_OrderVO aOrder : list){
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
	
//		List<Store_OrderVO> list = dao.findOrderByMem("MEM-000001");
//		for(Store_OrderVO aOrder : list){
//		System.out.print(aOrder.getOrder_id() + ",");
//		System.out.print(aOrder.getOrder_time() + ",");
//		System.out.print(aOrder.getStore_id() + ",");
//		System.out.print(aOrder.getOrder_state() + ",");
//		System.out.print(aOrder.getTotalprice() + ",");
//		System.out.print(aOrder.getOrder_way() + ",");
//		
//		System.out.println("---------------------");
//		}
		
		List<Store_OrderVO> list=dao.findOrderByState("未確認");
		for(Store_OrderVO aState:list){
			System.out.print(aState.getMem_id() + ",");
			System.out.print(aState.getOrder_id() + ",");
			System.out.print(aState.getStore_id() + ",");
			System.out.print(aState.getTotalprice() + ",");
			System.out.print(aState.getOrder_time() + ",");
			System.out.print(aState.getOrder_way() + ",");
			System.out.print(aState.getReceive_address() + ",");
			System.out.print(aState.getOrder_note() + ",");
			System.out.print(aState.getOrder_taketime() + ",");
			System.out.print(aState.getOrder_state() + ",");
			
			System.out.println("---------------------");
		}
		System.out.println("123");
	}
}
