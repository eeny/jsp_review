package com.company;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import org.json.simple.JSONObject;

public class Dao {
	Connection conn = null;
	PreparedStatement pstmt = null;// 이전에 썼던거는 Statement 였음
	ResultSet rs = null;
	int result = 0;
	
	// 커넥션 연결하기
	private Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1:3306/jspdb?characterEncoding=utf8";
			String id = "root";
			String pw = "1234";
			conn = DriverManager.getConnection(url, id, pw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	// 커넥션 끊기 (SELECT) - 받아온 객체(지금 사용하는 객체)를 닫아준다~
	private void freeConnection(ResultSet r, PreparedStatement p, Connection c) {
		try {
			if (r != null)
				r.close();
			if (p != null)
				p.close();
			if (c != null)
				c.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}
	// 커넥션 끊기  (INSERT, UPDATE, DELETE)- 받아온 객체(지금 사용하는 객체)를 닫아준다~
	private void freeConnection(PreparedStatement p, Connection c) {
		try {
			if (p != null)
				p.close();
			if (c != null)
				c.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}

	public boolean getRegId(String id) {
		boolean b = false;
		try {
			conn = getConnection();
			String sql = "select count(idx) from ajaxmember where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getInt(1) > 0) { // 쿼리 결과 값이 있으면 true 없으면 false
					b = true; // 이미 존재하는 아이디이다!
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
		
		
		return b;
	}
	
	public Dto getRegMember(int idx) {
		Dto dto = new Dto();
		
		try {
			conn = getConnection();
			String sql = "select * from ajaxmember where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setIdx(rs.getInt(1));
				dto.setId(rs.getString(2));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	public JSONObject getRegMemberJson(int idx) {
		JSONObject json = new JSONObject();
		
		try {
			conn = getConnection();
			String sql = "select * from ajaxmember where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				json.put("result3", rs.getInt(1));
				json.put("result4", rs.getString(2));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
		
		return json;
	}
	
	
} // Dao 클래스 끝


























