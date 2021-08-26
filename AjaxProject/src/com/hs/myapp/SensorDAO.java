package com.hs.myapp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.hs.myapp.*;

public class SensorDAO {
	DataSource ds = null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs;

	public SensorDAO() {
		InitialContext initialContext;
		try {
			initialContext = new InitialContext();
			ds = (DataSource) initialContext.lookup("java:comp/env/jdbc/dbcp");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Vector<SensorDTO> getAllData() {
		Vector<SensorDTO> v = new Vector<SensorDTO>();
		String sql = "select * from sensor limit 10";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				SensorDTO dto = new SensorDTO();
				dto.setIdx(rs.getInt(1));
				dto.setTemperature(rs.getInt(2));
				dto.setHumidity(rs.getInt(3));
				dto.setPrecipitation(rs.getInt(4));
				v.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			freeCon(con, pstmt, rs);// 만듬
		}
		return v;
	}

	public void freeCon(Connection con, PreparedStatement pstmt) {
		try {
			if (con != null) {
				con.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void freeCon(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (con != null) {
				con.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
