package com.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class ServletDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int result = 0;
	String poolUrl = "jdbc:apache:commons:dbcp:pool";

	private void freeConnection(ResultSet r, PreparedStatement p, Connection c) {
		// select 할때 close();
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
		// insert, update, delete 할때 close();
		try {
			if (p != null)
				p.close();
			if (c != null)
				c.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}

	public int insertData(ServletDto dto) {
		try {
			conn = DriverManager.getConnection(poolUrl);
			String sql = "INSERT INTO servletboard2 VALUES (NULL,?,?,?,?,NOW(),?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getMyfile());
			result = pstmt.executeUpdate();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			freeConnection(pstmt, conn);
		}
		return result;
	}

	public Vector<ServletDto> selectData() {
		Vector<ServletDto> v = new Vector<>();
		try {
			conn = DriverManager.getConnection(poolUrl);
			String sql = "SELECT * FROM servletboard2";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ServletDto dto = new ServletDto();
				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setPw(rs.getString(3));
				dto.setTitle(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setReg_date(rs.getString(6));
				dto.setMyfile(rs.getString(7));
				v.add(dto);
			}

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
		return v;
	}

	public ServletDto selectData(int idx) {
		ServletDto dto = new ServletDto();
		try {
			conn = DriverManager.getConnection(poolUrl);
			String sql = "SELECT * FROM servletboard2 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setPw(rs.getString(3));
				dto.setTitle(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setReg_date(rs.getString(6));
				dto.setMyfile(rs.getString(7));
			}

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
		return dto;
	}

	public void updateData(ServletDto dto) {
		try {
			conn = DriverManager.getConnection(poolUrl);
			String sql = "update servletboard2 set name=?,pw=?,title=?,content=?,reg_date=now(),myfile=? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getMyfile());
			pstmt.setInt(6, dto.getIdx());

			result = pstmt.executeUpdate();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			freeConnection(pstmt, conn);
		}
	}

	public void deleteData(int idx) {
		try {
			conn = DriverManager.getConnection(poolUrl);
			String sql = "delete from servletboard1 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			result = pstmt.executeUpdate();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			freeConnection(pstmt, conn);
		}

	}
}
