package com.company;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class MemberDao {
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

	public int insertData(MemberDto dto) {
		try {
			conn = DriverManager.getConnection(poolUrl);
			String sql = "INSERT INTO servletmember1 VALUES (NULL,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			result = pstmt.executeUpdate();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			freeConnection(pstmt, conn);
		}
		return result;
	}

	public Vector<MemberDto> selectData() {
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

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
		return v;
	}

	public Vector<MemberDto> selectData(int nowPage, int cnt) {
		Vector<MemberDto> v = new Vector<>();
		try {
			conn = DriverManager.getConnection(poolUrl);
			String sql = "SELECT * FROM servletmember1 limit ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (nowPage - 1) * cnt);
			pstmt.setInt(2, cnt);
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

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
		return v;
	}

	public int deleteData(int idx) {
		try {
			conn = DriverManager.getConnection(poolUrl);
			String sql = "delete from servletmember1 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			result = pstmt.executeUpdate();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			freeConnection(pstmt, conn);
		}
		return result;
	}

	public MemberDto loginMember(String id, String pw) {
		MemberDto dto = new MemberDto();
		try {
			conn = DriverManager.getConnection(poolUrl);
			String sql = "select * from servletmember1 where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setIdx(rs.getInt(1));// 숫자는 결과 컬럼의 순서
				dto.setId(rs.getString(2));
				dto.setPw(rs.getString(3));
				dto.setName(rs.getString(4));
				dto.setEmail(rs.getString(5));
			}

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
		return dto;
	}

	public int selectDataCnt() {
		try {
			conn = DriverManager.getConnection(poolUrl);
			String sql = "select count(idx) from servletmember1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			freeConnection(rs, pstmt, conn);
		}
		return result;
	}
}
