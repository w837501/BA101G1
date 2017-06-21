package com.rev.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mem.model.MemberVO;

public class RevenueJDBCDAO implements RevenueDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BA101G1";
	String passwd = "ba101g1";
	
	private static final String INSERT_STMT = "INSERT into REVENUE VALUES(?,?,?,?,?)";
	private static final String UPDATE_STMT = "UPDATE REVENUE set store_revenue=?, state=? where store_id = ? and revenue_month=?";
	private static final String DELETE = "DELETE FROM REVENUE where store_id = ? and revenue_month=?";
	private static final String Find_by_PK = "select * from REVENUE where store_id = ? and revenue_month=?";
	private static final String Find_ALL = "select * from REVENUE ";
	private static final String Find_By_Store = "select * from REVENUE  where store_id=?";
	private static final String Find_By_Month = "select * from REVENUE where  revenue_month=?";
	private static final String Find_Store_id="select DISTINCT store_id from REVENUE";
	@Override
	public void insert(RevenueVO revenueVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, revenueVO.getStore_id());
			pstmt.setString(2, revenueVO.getRevenue_month());
			pstmt.setString(3, revenueVO.getMan_id());
			pstmt.setInt(4,  revenueVO.getStore_revenue());
			pstmt.setInt(5, revenueVO.getState());

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
	public void update(RevenueVO revenueVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);

			
			pstmt.setInt(1, revenueVO.getStore_revenue());
			pstmt.setInt(2,  revenueVO.getState());
			pstmt.setString(3, revenueVO.getStore_id());
			pstmt.setString(4, revenueVO.getRevenue_month());

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
	public void delete(String store_id, String revenue_month) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, store_id);
			pstmt.setString(2, revenue_month);

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
	public RevenueVO findByPrimaryKey(String store_id, String revenue_month) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RevenueVO revVO = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Find_by_PK);

			pstmt.setString(1, store_id);
			pstmt.setString(2, revenue_month);
			rs = pstmt.executeQuery();
			while(rs.next()){
			revVO=new RevenueVO();
			revVO.setStore_id(rs.getString("store_id"));
			revVO.setRevenue_month(rs.getString("revenue_month"));
			revVO.setMan_id(rs.getString("man_id"));
			revVO.setStore_revenue(rs.getInt("store_revenue"));
			revVO.setState(rs.getInt("state"));
			}
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
		return revVO;
	}

	@Override
	public List<RevenueVO> getAll() {
		List<RevenueVO> revenuelist = new ArrayList<RevenueVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RevenueVO revVO = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Find_ALL);

			rs = pstmt.executeQuery();
			while(rs.next()){
			revVO=new RevenueVO();
			revVO.setStore_id(rs.getString("store_id"));
			revVO.setRevenue_month(rs.getString("revenue_month"));
			revVO.setMan_id(rs.getString("man_id"));
			revVO.setStore_revenue(rs.getInt("store_revenue"));
			revVO.setState(rs.getInt("state"));
			revenuelist.add(revVO);
			}
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
		return revenuelist;
	}
	public List<RevenueVO> getByStore(String store_id) {
		List<RevenueVO> revenuelist = new ArrayList<RevenueVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RevenueVO revVO = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Find_By_Store);

			pstmt.setString(1, store_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
			revVO=new RevenueVO();
			revVO.setStore_id(rs.getString("store_id"));
			revVO.setRevenue_month(rs.getString("revenue_month"));
			revVO.setMan_id(rs.getString("man_id"));
			revVO.setStore_revenue(rs.getInt("store_revenue"));
			revVO.setState(rs.getInt("state"));
			revenuelist.add(revVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
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
		return revenuelist;
	
	}

	@Override
	public List<RevenueVO> getByMonth(String revenue_month) {
		List<RevenueVO> revenuelist = new ArrayList<RevenueVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RevenueVO revVO = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Find_By_Month);

			pstmt.setString(1, revenue_month);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
			revVO=new RevenueVO();
			revVO.setStore_id(rs.getString("store_id"));
			revVO.setRevenue_month(rs.getString("revenue_month"));
			revVO.setMan_id(rs.getString("man_id"));
			revVO.setStore_revenue(rs.getInt("store_revenue"));
			revVO.setState(rs.getInt("state"));
			revenuelist.add(revVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
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
		return revenuelist;
	
	}

	@Override
	public List<RevenueVO> getSingleStore_id() {
		List<RevenueVO> revenuelist = new ArrayList<RevenueVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RevenueVO revVO = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Find_Store_id);

			rs = pstmt.executeQuery();
			while(rs.next()){
			revVO=new RevenueVO();
			revVO.setStore_id(rs.getString("store_id"));
			revenuelist.add(revVO);
			}
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
		return revenuelist;
	
	}

	public static void main(String args[]){

		RevenueJDBCDAO revenuedao=new RevenueJDBCDAO();
		//新增
//		RevenueVO revenueVO1=new RevenueVO();
//		revenueVO1.setStore_id("STO-000001");
//		revenueVO1.setRevenue_month("7");
//		revenueVO1.setMan_id("MAN-000001");
//		revenueVO1.setStore_revenue(300000);
//		revenueVO1.setState(0);
//		revenuedao.insert(revenueVO1);
		//修改
//		RevenueVO revenueVO2=new RevenueVO();
//		revenueVO2.setStore_id("STO-000001");
//		revenueVO2.setRevenue_month("7");
//		revenueVO2.setStore_revenue(200000);
//		revenueVO2.setState(1);
//		revenuedao.update(revenueVO2);
		//刪除
//		revenuedao.delete("STO-000001", "7");
		//找一筆
//		RevenueVO revenueVO3=revenuedao.findByPrimaryKey("STO-000001", "6");
//		System.out.println(revenueVO3.getStore_id());
//		System.out.println(revenueVO3.getRevenue_month());
//		System.out.println(revenueVO3.getMan_id());
//		System.out.println(revenueVO3.getStore_revenue());
//		System.out.println(revenueVO3.getState());
//		System.out.println("---------------------");
		//找全部
//		List<RevenueVO> list = revenuedao.getAll();
//		for (RevenueVO aRev : list) {
//			System.out.println(aRev.getStore_id());
//			System.out.println(aRev.getRevenue_month());
//			System.out.println(aRev.getMan_id());
//			System.out.println(aRev.getStore_revenue());
//			System.out.println(aRev.getState());
//			System.out.println("---------------------");
//		}
		
//		List<RevenueVO> list1 = ( revenuedao).getByStore("STO-000001");
//		for (RevenueVO aRev : list1) {
//			System.out.println(aRev.getStore_id());
//			System.out.println(aRev.getRevenue_month());
//			System.out.println(aRev.getMan_id());
//			System.out.println(aRev.getStore_revenue());
//			System.out.println(aRev.getState());
//			System.out.println("---------------------");
//	}
//		List<RevenueVO> list1 = ( revenuedao).getByMonth("5");
//		for (RevenueVO aRev : list1) {
//			System.out.println(aRev.getStore_id());
//			System.out.println(aRev.getRevenue_month());
//			System.out.println(aRev.getMan_id());
//			System.out.println(aRev.getStore_revenue());
//			System.out.println(aRev.getState());
//			System.out.println("---------------------");
//	}
		List<RevenueVO> list1 = ( revenuedao).getSingleStore_id();
		for (RevenueVO aRev : list1) {
			System.out.println(aRev.getStore_id());
			
			System.out.println("---------------------");
	}
	}

	
}
