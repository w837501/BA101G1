package com.mem.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


public class MemberJDBCDAO implements MemberDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BA101G1";
	String passwd = "ba101g1";
	
	
	private static final String INSERT_STMT = "INSERT into MEMBER (mem_id,mem_name,mem_phone,mem_pw,mem_mail,mem_state,mem_report_count,mem_start_time,mem_end_time,mem_money)VALUES('MEM'||'-'||LPAD(to_char(mem_seq.NEXTVAL),6,'0'),?,?,?,?,?,?,?,?,?)";
	private static final String UPDATE_STMT = "UPDATE MEMBER set mem_name=?, mem_phone=?, mem_pw=?, mem_mail=? where mem_id = ?";
	private static final String DELETE = "DELETE FROM MEMBER where mem_id = ?";
	private static final String Find_by_PK = "select * from MEMBER where mem_id=?";
	private static final String Find_ALL = "select * from MEMBER ";
	
	@Override
	public void insert(MemberVO memberVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, memberVO.getMem_name());
			pstmt.setString(2, memberVO.getMem_phone());
			pstmt.setString(3, memberVO.getMem_pw());
			pstmt.setString(4, memberVO.getMem_mail());
			pstmt.setString(5,  memberVO.getMem_state());
			pstmt.setInt(6, (int) memberVO.getMem_report_count());
			pstmt.setTimestamp(7, memberVO.getMem_start_time());
			pstmt.setTimestamp(8, memberVO.getMem_end_time());
			pstmt.setInt(9, (int) memberVO.getMem_money());
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
	public void update(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, memberVO.getMem_name());
			pstmt.setString(2, memberVO.getMem_phone());
			pstmt.setString(3, memberVO.getMem_pw());
			pstmt.setString(4, memberVO.getMem_mail());
			pstmt.setString(5, memberVO.getMem_id());

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
	public void delete(String mem_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, mem_id);

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
	public MemberVO findByPrimaryKey(String mem_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO memVO = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Find_by_PK);

			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
			memVO=new MemberVO();
			memVO.setMem_name(rs.getString("mem_name"));
			memVO.setMem_phone(rs.getString("mem_phone"));
			memVO.setMem_pw(rs.getString("mem_pw"));
			memVO.setMem_mail(rs.getString("mem_mail"));
			memVO.setMem_id(rs.getString("mem_id"));
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
		return memVO;
	}

	@Override
	public List<MemberVO> getAll() {
		List<MemberVO> memberlist = new ArrayList<MemberVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO memVO = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Find_ALL);

			rs = pstmt.executeQuery();
			while(rs.next()){
			memVO=new MemberVO();
			memVO.setMem_name(rs.getString("mem_name"));
			memVO.setMem_phone(rs.getString("mem_phone"));
			memVO.setMem_pw(rs.getString("mem_pw"));
			memVO.setMem_mail(rs.getString("mem_mail"));
			memVO.setMem_id(rs.getString("mem_id"));
			memberlist.add(memVO);
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
		return memberlist;
	
	}
	
	
	public static void main(String args[]){
		
		MemberJDBCDAO memberdao = new MemberJDBCDAO();
		//新增
		MemberVO memVO1 = new MemberVO();
		memVO1.setMem_name("吳永志3");
		memVO1.setMem_phone("123");
		memVO1.setMem_pw("132");
		memVO1.setMem_mail("peter1@abc.com");
		memVO1.setMem_state("已認證");
		memVO1.setMem_report_count(6);
		memVO1.setMem_start_time(new Timestamp(System.currentTimeMillis()));
		memVO1.setMem_end_time(new Timestamp(System.currentTimeMillis()+100000000L));
		memVO1.setMem_money(300);
		memberdao.insert(memVO1);
		
		//修改
//		MemberVO memVO2=new MemberVO();
//		memVO2.setMem_name("吳永志2");
//		memVO2.setMem_phone("0909090909");
//		memVO2.setMem_pw("11111");
//		memVO2.setMem_mail("peter2@abc.com");
//		memVO2.setMem_id("MEM-000008");
//		memberdao.update(memVO2);
		
		//刪除
//		memberdao.delete("MEM-000008");
		//找一筆
//		MemberVO memVO3 = memberdao.findByPrimaryKey("MEM-000007");
//		System.out.println(memVO3.getMem_id());
//		System.out.println(memVO3.getMem_name() );
//		System.out.println(memVO3.getMem_phone());
//		System.out.println(memVO3.getMem_pw());
//		System.out.println(memVO3.getMem_mail());
//		System.out.println("---------------------");
//		
//		//找全部
//		List<MemberVO> list = memberdao.getAll();
//		for (MemberVO aMem : list) {
//			System.out.println(aMem.getMem_id());
//			System.out.println(aMem.getMem_name());
//			System.out.println(aMem.getMem_phone());
//			System.out.println(aMem.getMem_pw());
//			System.out.println(aMem.getMem_mail());
//			System.out.println("---------------------");
//		}
	}
}
