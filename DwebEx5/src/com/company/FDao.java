package com.company;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

/*
	-- 회원가입
	CREATE TABLE fmember (
		idx INT PRIMARY KEY AUTO_INCREMENT,
		id VARCHAR(20) NOT NULL,
		pw VARCHAR(20) NOT NULL,
		NAME VARCHAR(20) NOT NULL,
		email VARCHAR(50),
		lv INT NOT NULL DEFAULT 1 
	);
	
	-- 게시판
	CREATE TABLE fboard (
		idx INT PRIMARY KEY AUTO_INCREMENT,
		fmember_id VARCHAR(20) NOT NULL,
		fmember_name VARCHAR(20) NOT NULL,
		title VARCHAR(100) NOT NULL,
		content TEXT NOT NULL,
		regdate DATETIME NOT NULL
	);
*/

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
	
	public int fregist(FDto bean) {
		try {
			conn = getConnection();
			String sql = "insert into fmember values (null, ?, ?, ?, ?, default)";
			pstmt = conn.prepareStatement(sql);
			//값 넣기
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPw());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getEmail());
			result = pstmt.executeUpdate();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			freeConnection(pstmt, conn);
		}
		
		return result;
	}
	
	public FDto flogin(FDto inDto) {
		FDto dto = new FDto();
		
		try {
			conn = getConnection();
			String sql = "select * from fmember where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inDto.getId());
			pstmt.setString(2, inDto.getPw());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setIdx(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setName(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setLv(rs.getInt(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	public Vector<FDto> getAllFmember() {
		Vector<FDto> v = new Vector<FDto>();
		// FDto는 DB 결과의 한 줄이다.
		// 현재 메서드는 결과가 여러줄이므로 각 줄을 FDto에 담고 각 줄을 Vector에 담는다.
		// 그러면 Vector에는 모든 줄(여러개의 FDto)이 다 담겨있다!
		try {
			conn = getConnection();
			String sql = "select * from fmember";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			// rs에는 결과가 담긴다. 한 줄 씩 (FDto) 빼와서 Vector에 하나씩 담는다!
			
			while (rs.next()) {
				FDto dto = new FDto();
				dto.setIdx(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setPw(rs.getString(3));
				dto.setName(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setLv(rs.getInt(6));
				v.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
		
		return v;
	}
	
	public Vector<FBDto> getFboardAll(String order, int cnt) { // order에는 regdate 
		Vector<FBDto> v = new Vector<>();
		
		try {
			// 1) heidiSQL을 열고 연결한다고 생각하자.
			conn = getConnection();
			// 2) heidiSQL에서 쿼리를 작성한다고 생각하자.
			String sql = "select * from fboard order by " + order + " limit " + cnt;
			// 3) 실행할 구문을 드래그한다고 생각하자.
			pstmt = conn.prepareStatement(sql);
			// 혹시 ?에 값을 넣을 게 있다면 이 위치에서 하나씩 넣자.
			
			// 4) 드래그한 구문을 ctrl + f9로 실행한다고 생각하자.
			rs = pstmt.executeQuery();
			// 결과를 jsp로 옮기기 위해 변수에 담는 작업을 하는 부분이다!
			while(rs.next()) {
				FBDto dto = new FBDto();
				dto.setIdx(rs.getInt(1));
				dto.setFmember_id(rs.getString(2));
				dto.setFmember_name(rs.getString(3));
				dto.setTitle(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setRegdate(rs.getString(6)); // 날짜도 문자로 처리하면 편하다!
				v.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
		return v;
	}
	
	public int insertFBoard(FDto dto, FBDto bdto) {
		try {
			conn = getConnection();
			String sql = "INSERT INTO fboard VALUES (NULL, ?, ?, ?, ?, NOW())";
			pstmt = conn.prepareStatement(sql);
			// ?에 값 넣기
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, bdto.getTitle());
			pstmt.setString(4, bdto.getContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			freeConnection(pstmt, conn);
		}
		return result;
	}
	
} // FDao 클래스 끝


























