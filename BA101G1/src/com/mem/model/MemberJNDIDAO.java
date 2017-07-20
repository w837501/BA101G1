package com.mem.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberJNDIDAO implements MemberDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA101G1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT into MEMBER (mem_id,mem_name,mem_phone,mem_pw,mem_mail)VALUES('MEM'||'-'||LPAD(to_char(mem_seq.NEXTVAL),6,'0'),?,?,?,?)";
	private static final String UPDATE_STMT = "UPDATE MEMBER set mem_name=?, mem_phone=?, mem_pw=?, mem_mail=? where mem_id = ?";
	private static final String DELETE = "DELETE FROM MEMBER where mem_id = ?";
	private static final String Find_by_PK = "select * from MEMBER where mem_id=?";
	private static final String Find_ALL = "select * from MEMBER ";
	private static final String Find_ACC = "select * from MEMBER where mem_mail=?";

//	private static final String FIND_ALL_UNCHECKED_MEMBER = "SELECT  FROM MEMBER WHERE ";
	private static final String UPDATE_MEMBER_STATE ="UPDATE MEMBER SET MEM_STATE=? WHERE MEM_ID = ?";
	private static final String GET_ALL_UNCHECKED_COUNT = "select count(*) from member where mem_state = '•ºª{√“' order by nlssort(mem_state,'NLS_SORT=TCHINESE_STROKE_M')";
	
	@Override
	public void insert(MemberVO memberVO) {

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, memberVO.getMem_name());
			pstmt.setString(2, memberVO.getMem_phone());
			pstmt.setString(3, memberVO.getMem_pw());
			pstmt.setString(4, memberVO.getMem_mail());

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
	public void update(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, memberVO.getMem_name());
			pstmt.setString(2, memberVO.getMem_phone());
			pstmt.setString(3, memberVO.getMem_pw());
			pstmt.setString(4, memberVO.getMem_mail());
			pstmt.setString(5, memberVO.getMem_id());

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
	public void delete(String mem_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, mem_id);

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
	public MemberVO findByPrimaryKey(String mem_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO memVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Find_by_PK);

			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				memVO = new MemberVO();
				memVO.setMem_name(rs.getString("mem_name"));
				memVO.setMem_phone(rs.getString("mem_phone"));
				memVO.setMem_pw(rs.getString("mem_pw"));
				memVO.setMem_mail(rs.getString("mem_mail"));
				memVO.setMem_id(rs.getString("mem_id"));
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
			con = ds.getConnection();
			pstmt = con.prepareStatement(Find_ALL);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				memVO = new MemberVO();
				memVO.setMem_name(rs.getString("mem_name"));
				memVO.setMem_phone(rs.getString("mem_phone"));
				memVO.setMem_pw(rs.getString("mem_pw"));
				memVO.setMem_mail(rs.getString("mem_mail"));
				memVO.setMem_id(rs.getString("mem_id"));
				memberlist.add(memVO);
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
		return memberlist;

	}

	@Override
	public MemberVO findAcc(String mem_mail) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO memberVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Find_ACC);

			pstmt.setString(1, mem_mail);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				memberVO = new MemberVO();
				memberVO.setMem_name(rs.getString("mem_name"));
				memberVO.setMem_phone(rs.getString("mem_phone"));
				memberVO.setMem_pw(rs.getString("mem_pw"));
				memberVO.setMem_mail(rs.getString("mem_mail"));
				memberVO.setMem_id(rs.getString("mem_id"));
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
		return memberVO;
	}

	@Override
	public List<MemberVO> getAllUncheckedMember() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMemberState(String mem_state, String mem_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_MEMBER_STATE);
			pstmt.setString(1, mem_state);
			pstmt.setString(2, mem_id);
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
	public Integer getAllUncheckedCount() {
		Integer count  = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_UNCHECKED_COUNT);
			rs = pstmt.executeQuery();
			if(rs.next())
				count =  rs.getInt(1);
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
		return count;
	
	}
}
