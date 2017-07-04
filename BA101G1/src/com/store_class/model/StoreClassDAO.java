package com.store_class.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.store.model.StoreVO;

public class StoreClassDAO implements StoreClassDAO_interface {
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA101G1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String GET_ALL = "SELECT * from store_class";
	
	
	
	@Override
	public void update(StoreClassVO storeclassVO) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public List<StoreClassVO> getAll() {
		
		List<StoreClassVO> storeclasslist = new ArrayList<StoreClassVO>();
		StoreClassVO scVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				scVO= new StoreClassVO();
				scVO.setSc_id(rs.getInt("sc_id"));
				scVO.setSc_name(rs.getString("sc_name"));
				storeclasslist.add(scVO); 
			}
		} catch (SQLException se) {
			throw new RuntimeException("µo¥Í¿ù»~" + se.getMessage());
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
		return storeclasslist;
	}
	
		
	

}
