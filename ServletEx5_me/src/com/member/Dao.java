package com.member;

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
	String poolUrl = "jdbc:apache:commons:dbcp:pool";
	
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
	
	public Vector<MemberDto> getSelect() {
		Vector<MemberDto> v = new Vector<>();
		try {
			conn = DriverManager.getConnection(poolUrl);
			String sql = "SELECT * FROM servletmember1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setIdx(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setPw(rs.getString(3));
				dto.setName(rs.getString(4));
				dto.setEmail(rs.getString(5));
				v.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
		
		return v;
	}

	public void insertData(MemberDto dto) {
		try {
			conn = DriverManager.getConnection(poolUrl);
			String sql = "INSERT INTO servletmember1 VALUES (NULL, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			freeConnection(pstmt, conn);
		}
	}

	public int deleteData(int idx) {
		try {
			conn = DriverManager.getConnection(poolUrl);
			String sql = "DELETE FROM servletmember1 WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			freeConnection(pstmt, conn);
		}
		return result;
	}

	public MemberDto loginMember(String id, String pw) {
		MemberDto dto = new MemberDto();
		try {
			conn = DriverManager.getConnection(poolUrl);
			String sql = "SELECT * FROM servletmember1 WHERE id = ? AND pw = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setIdx(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setPw(rs.getString(3));
				dto.setName(rs.getString(4));
				dto.setEmail(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
		return dto;
	}
}
