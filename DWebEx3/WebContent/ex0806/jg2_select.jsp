<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="jg2_include_sel.jspf"%>
<table>
	<%
		try {
			String kind = request.getParameter("kind");
			String search = request.getParameter("search");

			if (kind == null) {
				kind = "name";
			}

			if (search == null) {
				search = "";
			}

			String sql = "select * from guestbook WHERE " + kind + " LIKE '%" + search + "%'";
			// LIKE 뒤에 아무 내용이 없이 '%%' 이렇게만 되어 있으면 모든 행이 다 출력된다!	
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
	%>
	<tr style="background-color: orange;">
		<td><%=rs.getInt("idx")%></td>
		<td><%=rs.getString("name")%></td>
		<td><%=rs.getString("email")%>
			<input type="button" value="M/D" style="width: 50px;" onclick="location.href='jg2_md.jsp?idx=<%=rs.getInt("idx")%>'">
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<%=rs.getString("content").replace("\r\n", "<br>")%></td>
	</tr>
	<%
		}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		}
	%>

</table>