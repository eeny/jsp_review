package com.company;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class FDao {
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
	
	public int uploadFile(String title, String writer, String content, String myfile, String copyfile) {
		try {
			conn = getConnection();
			String sql = "INSERT INTO fileupload VALUES (NULL, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, writer);
			pstmt.setString(3, content);
			pstmt.setString(4, myfile);
			pstmt.setString(5, copyfile);
			result = pstmt.executeUpdate();	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			freeConnection(pstmt, conn);
		}
		
		return result;
	}
	
	public Vector<FileDto> getSelectAll() {
		Vector<FileDto> v = new Vector<>();
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM fileupload";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FileDto dto = new FileDto();
				dto.setIdx(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setWriter(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setMyfile(rs.getString(5));
				dto.setCopyfile(rs.getString(6));
				v.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
		
		return v;
	}
	
	public FileDto getSelectData(int idx) {
		FileDto dto = new FileDto();
		try {
			conn = getConnection();
			String sql = "SELECT * FROM fileupload WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setIdx(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setWriter(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setMyfile(rs.getString(5));
				dto.setCopyfile(rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}

		return dto;
	}
	
	
	
	
	
} // FDao 클래스 끝


























