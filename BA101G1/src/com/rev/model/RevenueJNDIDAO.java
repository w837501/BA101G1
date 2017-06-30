package com.rev.model;

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

import com.order.model.Store_OrderVO;


public class RevenueJNDIDAO implements RevenueDAO_interface{
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA101G1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT = "INSERT into REVENUE (store_id,revenue_month,man_id,store_revenue)VALUES(?,?,?,?)";
	private static final String UPDATE_STMT = "UPDATE REVENUE set store_revenue=?, state=? where store_id = ? and revenue_month=?";
	private static final String DELETE = "DELETE FROM REVENUE where store_id = ? and revenue_month=?";
	private static final String Find_by_PK = "select * from REVENUE where store_id = ? and revenue_month=?";
	private static final String Find_ALL = "select * from REVENUE order by store_id ,revenue_month asc";
	private static final String Find_By_Store = "select * from REVENUE  where store_id=?";
	private static final String Find_By_Month = "select * from REVENUE where  revenue_month=?";
	private static final String Find_Store_id="select DISTINCT store_id from REVENUE  order by store_id";
	private static final String Find_Store_Month_Revenue = "select store_id,sum(totalprice)sum_totalprice from store_order where order_time like ? group by store_id order by store_id";
	@Override
	public void insert(RevenueVO revenueVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, revenueVO.getStore_id());
			pstmt.setString(2, revenueVO.getRevenue_month());
			pstmt.setString(3, revenueVO.getMan_id());
			pstmt.setInt(4, revenueVO.getStore_revenue());

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
	public void update(RevenueVO revenueVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);

			
			pstmt.setInt(1, revenueVO.getStore_revenue());
			pstmt.setString(2, revenueVO.getState());
			pstmt.setString(3, revenueVO.getStore_id());
			pstmt.setString(4, revenueVO.getRevenue_month());

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
	public void delete(String store_id, String revenue_month) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, store_id);
			pstmt.setString(2, revenue_month);

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
	public RevenueVO findByPrimaryKey(String store_id, String revenue_month) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RevenueVO revVO = null;

		try {
			con = ds.getConnection();
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
			revVO.setState(rs.getString("state"));
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
			con = ds.getConnection();
			pstmt = con.prepareStatement(Find_ALL);

			rs = pstmt.executeQuery();
			while(rs.next()){
			revVO=new RevenueVO();
			revVO.setStore_id(rs.getString("store_id"));
			revVO.setRevenue_month(rs.getString("revenue_month"));
			revVO.setMan_id(rs.getString("man_id"));
			revVO.setStore_revenue(rs.getInt("store_revenue"));
			revVO.setState(rs.getString("state"));
			revenuelist.add(revVO);
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
		return revenuelist;
	}

	@Override
	public List<RevenueVO> getByStore(String store_id) {
		List<RevenueVO> revenuelist = new ArrayList<RevenueVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RevenueVO revVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Find_By_Store);

			pstmt.setString(1, store_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
			revVO=new RevenueVO();
			revVO.setStore_id(rs.getString("store_id"));
			revVO.setRevenue_month(rs.getString("revenue_month"));
			revVO.setMan_id(rs.getString("man_id"));
			revVO.setStore_revenue(rs.getInt("store_revenue"));
			revVO.setState(rs.getString("state"));
			revenuelist.add(revVO);
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
			con = ds.getConnection();
			pstmt = con.prepareStatement(Find_By_Month);

			pstmt.setString(1, revenue_month);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
			revVO=new RevenueVO();
			revVO.setStore_id(rs.getString("store_id"));
			revVO.setRevenue_month(rs.getString("revenue_month"));
			revVO.setMan_id(rs.getString("man_id"));
			revVO.setStore_revenue(rs.getInt("store_revenue"));
			revVO.setState(rs.getString("state"));
			revenuelist.add(revVO);
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
			con = ds.getConnection();
			pstmt = con.prepareStatement(Find_Store_id);

			rs = pstmt.executeQuery();
			while(rs.next()){
			revVO=new RevenueVO();
			revVO.setStore_id(rs.getString("store_id"));
			revenuelist.add(revVO);
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
		return revenuelist;
	}

	@Override
	public List<Store_OrderVO> getMonthRevenue(String month) {
		List<Store_OrderVO> store_orderVOlist = new ArrayList<Store_OrderVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Store_OrderVO store_orderVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Find_Store_Month_Revenue);

			pstmt.setString(1, "%" + month + "%");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				store_orderVO = new Store_OrderVO();
				store_orderVO.setStore_id(rs.getString("store_id"));
				store_orderVO.setSum_totalprice(rs.getString("sum_totalprice"));
				store_orderVOlist.add(store_orderVO);
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
		return store_orderVOlist;
	
	}

	
}
