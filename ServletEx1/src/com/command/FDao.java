package com.command;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

/*CREATE TABLE imgtbl(
		idx INT PRIMARY key AUTO_INCREMENT,
		NAME  VARCHAR(20) NOT NULL,
		id VARCHAR(20) NOT NULL,
		src VARCHAR(100) 
	);*/

public class FDao {	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int result = 0;
	
	
	private Connection getConnection(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/jspdb?characterEncoding=utf8";
			String id = "root";
			String pw = "1234";
			conn = DriverManager.getConnection(url,id,pw);
		}catch(ClassNotFoundException cnfe){
			cnfe.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	private void freeConnection(ResultSet r, PreparedStatement p, Connection c){
		//select �Ҷ� close();
		try{
			if(r != null) r.close();
			if(p != null) p.close();
			if(c != null) c.close();
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}
	}
	
	private void freeConnection(PreparedStatement p, Connection c){
		//insert, update, delete �Ҷ� close();
		try{			
			if(p != null) p.close();
			if(c != null) c.close();
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}
	}
	
	public int insertData(FDto dto){
		try{
			conn = getConnection();
			String sql = "insert into imgtbl values (null, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getMyfile());
			pstmt.setString(4, dto.getOfname());
			pstmt.setString(5, dto.getSfname());
			result = pstmt.executeUpdate();
		}catch (SQLException sqle) {
			sqle.printStackTrace();
		}finally {
			freeConnection(pstmt, conn);
		}		
		return result;
	}
	
	public Vector<FDto> selectData(){
		Vector<FDto> v = new Vector<>();
		try{
			conn = getConnection();
			String sql = "select * from imgtbl";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				FDto dto = new FDto();
				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setId(rs.getString(3));
				dto.setMyfile(rs.getString(4));
				dto.setOfname(rs.getString(5));
				dto.setSfname(rs.getString(6));
				v.add(dto);
			}
			
		}catch (SQLException sqle) {
			sqle.printStackTrace();
		}finally {
			freeConnection(rs, pstmt, conn);
		}
		
		
		return v;
	}
	
	
	public FDto getData(String idx){
		FDto dto = new FDto();
		try{
			conn = getConnection();
			String sql = "select * from imgtbl where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);// ������ ���ڰ� �����ϴϱ� ���� �����ִ°� ����
			rs = pstmt.executeQuery();
			if(rs.next()){				
				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setId(rs.getString(3));
				dto.setSfname(rs.getString(4));				
			}
			
		}catch (SQLException sqle) {
			sqle.printStackTrace();
		}finally {
			freeConnection(rs, pstmt, conn);
		}		
		
		return dto;
	}
	
}// Ŭ���� ��







