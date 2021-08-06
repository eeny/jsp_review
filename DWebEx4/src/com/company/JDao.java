package com.company;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class JDao {
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
	
	// 모든 SELECT 쿼리 & 검색  실행하는 메서드
	public Vector<JDto> getSelectAll(String kind, String search) { // ArrayList, Vector
		Vector<JDto> v = null;
		
		try {
			conn = getConnection(); 
			// 위의 getConnection() 메서드가 실행되면서 conn을 가져온다!
			
			//String sql = "select * from guestbook";
			String sql = "select * from guestbook WHERE " + kind + " LIKE '%" + search + "%'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			v = new Vector<>();
			
			while (rs.next()) {
				// DB에서 가져와서 출력하는 방법 2
				/*v.add(rs.getInt(1) + "/" 
					+ rs.getString(2) + "/" 
					+ rs.getString(3) + "/" 
					+ rs.getString(4) + "/" 
					+ rs.getString(5));*/
				
				// DB에서 가져와서 출력하는 방법 3
				// Dto(bean)란? db에서 한 줄을 담는 객체 - 각 컬럼을 각 변수에 담는다!
				JDto dto = new JDto();
				
				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setPw(rs.getString(3));
				dto.setEmail(rs.getString(4));
				dto.setContent(rs.getString(5));
				
				v.add(dto);
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
		
		return v;
	}// getSelectAll() 끝
	
	// 특정SELECT 쿼리 실행하는 메서드
	public Vector<JDto> getSelectIdx(int idx) { // ArrayList, Vector
		Vector<JDto> v = null;
		
		try {
			conn = getConnection(); 
			// 위의 getConnection() 메서드가 실행되면서 conn을 가져온다!
			
			String sql = "select * from guestbook where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			v = new Vector<>();
			
			if (rs.next()) {
				JDto dto = new JDto();
				
				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setPw(rs.getString(3));
				dto.setEmail(rs.getString(4));
				dto.setContent(rs.getString(5));
				
				v.add(dto);
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
		
		return v;
	}// getSelectIdx() 끝
	
	// 패스워드 체크하는 메서드
	public boolean pwChk(String idx, String pw) {
		boolean re= false;
		
		try {
			conn = getConnection();
			String sql = "SELECT count(idx) FROM guestbook WHERE idx = ? AND pw = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(idx));
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getInt(1) > 0) { // 값이 있다면
					re = true;
				}
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
		
		return re;
	}// pwChk() 끝
	
	// DELETE 쿼리 실행하는 메서드
	public void delete(String idx) {
		try {
			conn = getConnection();
			String sql = "DELETE FROM guestbook WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(idx));
			pstmt.executeUpdate();
			
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			freeConnection(pstmt, conn);
		}
	}// delete() 끝
	
	// INSERT 쿼리 실행하는 메서드
	public void insert(String name, String pw, String email, String content) {
		try {
			conn = getConnection();
			String sql = "INSERT INTO guestbook VALUES (null, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, pw);
			pstmt.setString(3, email);
			pstmt.setString(4, content);
			pstmt.executeUpdate();
			
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			freeConnection(pstmt, conn);
		}
	}// insert() 끝
	
	// UPDATE 쿼리 실행하는 메서드
	public void update(int idx, String name, String pw, String email, String content) {
		try {
			conn = getConnection();
			String sql = "UPDATE guestbook SET NAME = ?, pw = ?, email = ?, content = ? WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, pw);
			pstmt.setString(3, email);
			pstmt.setString(4, content);
			pstmt.setInt(5, idx);
			pstmt.executeUpdate();
			
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			freeConnection(pstmt, conn);
		}
	}// update() 끝
}// JDao 클래스 끝
