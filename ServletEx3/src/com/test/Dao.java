package com.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class Dao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int result = 0;
	// 커넥션풀로 커넥션 연결하기
	String poolUrl = "jdbc:apache:commons:dbcp:pool";
	
	/*private Connection getConnection() {
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
	}*/
	
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
	
	public Vector<FBoardDto> getSelect() {
		Vector<FBoardDto> v = new Vector<>();
		try {
			conn = DriverManager.getConnection(poolUrl);
			String sql = "SELECT * FROM servletboard2";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				FBoardDto dto = new FBoardDto();
				dto.setIdx(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setDescr(rs.getString(3));
				dto.setOfilename(rs.getString(4));
				dto.setSfilename(rs.getString(5));
				dto.setRegdate(rs.getString(6));
				v.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
			
		}
		
		return v;
	}

	public void insertData(FBoardDto dto) {
		try {
			conn = DriverManager.getConnection(poolUrl);
			String sql = "INSERT INTO servletboard2 VALUES (NULL, ?, ?, ?, ?, NOW())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getDescr());
			pstmt.setString(3, dto.getOfilename());
			pstmt.setString(4, dto.getSfilename());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
	}

	public FBoardDto getSelectIdx(int idx) {
		FBoardDto dto = new FBoardDto();
		
		try {
			conn = DriverManager.getConnection(poolUrl);
			String sql = "SELECT * FROM servletboard2 WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setIdx(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setDescr(rs.getString(3));
				dto.setOfilename(rs.getString(4));
				dto.setSfilename(rs.getString(5));
				dto.setRegdate(rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
		
		return dto;
	}

	public void updateData(FBoardDto dto) {
		try {
			conn = DriverManager.getConnection(poolUrl);
			String sql = "UPDATE servletboard2 SET title = ?, descr = ?, ofilename = ?, sfilename = ?, regdate = NOW() WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getDescr());
			pstmt.setString(3, dto.getOfilename());
			pstmt.setString(4, dto.getSfilename());
			pstmt.setInt(5, dto.getIdx());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
	}

	public void deleteData(int idx) {
		try {
			conn = DriverManager.getConnection(poolUrl);
			String sql = "DELETE FROM servletboard2 WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
	}
	
	
}// Dao클래스 끝
