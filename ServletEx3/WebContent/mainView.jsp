<%@page import="com.test.Dao"%>
<%@page import="com.test.FBoardDto"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	메인 페이지 - 글 목록
	<table border="1" cellspacing="0">
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성일</td>
		</tr>
		<%
			Vector<FBoardDto> v = (Vector)request.getAttribute("data");
			if(v == null || v.size() == 0) {
		%>
				<tr>
					<td colspan="4">등록된 글이 없습니다.</td>
				</tr>
		<%		
			} else {
				for(int i=0; i<v.size(); i++) {
		%>
				<tr>
					<td><%=v.get(i).getIdx() %></td>
					<td><a href="Content?idx=<%=v.get(i).getIdx()%>"><%=v.get(i).getTitle() %></a></td>
					<td><%=v.get(i).getRegdate() %></td>
				</tr>
		<%			
				}
			}
		%>
	</table>
	<a href="Insert">새글쓰기</a>
	<!-- /ServletEx1_work/ + Insert -->
	
	<hr>
	upload폴더 실제 위치 : <%= getServletContext().getRealPath("/upload") %>
</body>
</html>