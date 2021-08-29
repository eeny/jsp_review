package com.ds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DsDao {
	DataSource ds = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int result = 0;
	
	public DsDao() {
			// 생성할 때 한번만 불러오면 되므로 전역으로 안 뺐다!			
			//InitialContext initialContext = null; // 이렇게  따로 해도 되고 바로 적어도 된다~
		try {
			InitialContext initialContext = new InitialContext();
			// Context 영역 접근 변수			
			ds = (DataSource) initialContext.lookup("java:comp/env/dsdbcp"); 
			// ds가 pool이라고 생각하면 된다!			
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private void freeConnection(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			
		}
	}
	
	private void freeConnection(PreparedStatement pstmt, Connection conn) {
		try {
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			
		}
	}
	
	public Vector<DsDto> selectData() {
		Vector<DsDto> v = new Vector<>();
		
		try {
			String sql = "SELECT * FROM servletajax";
			
			conn = ds.getConnection(); // ds를 pool이라고 생각하자!
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				DsDto dto = new DsDto();
				dto.setIdx(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setPw(rs.getString(3));
				v.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
		
		return v;
	}
}// dao 끝
