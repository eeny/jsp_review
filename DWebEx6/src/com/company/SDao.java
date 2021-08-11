package com.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class SDao {
	public Vector<Integer> getIdxAll() {
		Vector<Integer> v = new Vector<>();
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = mgr.getConnection();
			String sql = "select idx from fboard";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				v.add(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			mgr.freeConnection(conn, pstmt, rs);
		}
		
		return v;
	}
}
