<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="jg_include_sel.jspf" %>
<table>
<%
	request.setCharacterEncoding("utf-8");

	String searchCategory = request.getParameter("searchCategory");
	String searchWord = request.getParameter("searchWord");
%>
<%
	String sql = "";
	if(searchWord != null) {
		sql = "SELECT * FROM guestbook WHERE " + searchCategory + " LIKE '%"+searchWord+"%'";
	} else {
		sql = "SELECT * FROM guestbook";		
	}

	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			do {
%>
			<tr style="background-color: orange;">
				<td><%=rs.getInt("idx") %></td>
				<td><%=rs.getString("name") %></td>
				<td>
				<%=rs.getString("email") %>
				<%-- <a href="jg_md.jsp?idx=<%=rs.getInt("idx") %>">M/D</a> --%>
				<input type="button" value="M/D" style="width: 50px;" onclick="location.href='jg_md.jsp?idx=<%=rs.getInt("idx") %>'">
				</td>
			</tr>
			<tr>
				<td colspan="3"><%=rs.getString("content").replace("\r\n", "<br>") %></td>
			</tr>
<%				
			} while(rs.next());
		} else {
			out.println("검색 결과 없음");
		}
	} catch(SQLException e2) {
		e2.printStackTrace();
	} finally {
		try {
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
		} catch(SQLException e) {
			e.printStackTrace();
		} 
	}
%>
</table>






