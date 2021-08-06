package com.company;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class MyDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
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
	// 커넥션 끊기 (SELECT)
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
	// 커넥션 끊기  (INSERT, UPDATE, DELETE)
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
	
	public Vector<MyDto> getSelectAll() {
		Vector<MyDto> v = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM myboard";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			v = new Vector<>();
			
			while(rs.next()) {
				MyDto dto = new MyDto();
				dto.setIdx(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setPw(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setWdate(rs.getString(6));
				
				v.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
		
		return v;
	}
}// MyDao 클래스 끝
