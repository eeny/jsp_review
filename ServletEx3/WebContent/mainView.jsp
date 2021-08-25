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
	<h3>메인 페이지 - 글 목록</h3>
	<table border="1" cellspacing="0">
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성일</td>
		</tr>
		<%	
			// 페이징
			int pnum = (int)request.getAttribute("pnum");
			int totalPage = (int)request.getAttribute("totalPage");
			int startPage = (int)request.getAttribute("startPage");
			int endPage = (int)request.getAttribute("endPage");
		
			// 게시글 목록 가져오기
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
	
	<%
		// 페이징
		if(pnum > 1) {
	%>
			<a href="Select?pnum=1">[처음]</a>
			<a href="Select?pnum=<%=pnum - 1%>">[이전]</a>
	<%				
		}
	
		for(int i=startPage; i<=endPage; i++) {
			if(pnum == i) {
	%>
			<span style="color: red;font-weight: bold;">[<%=i %>]</span>
	<%			
			} else {
	%>
			<a href="Select?pnum=<%=i%>">[<%=i %>]</a>
	<%	
			}
		}
		
		if(pnum < totalPage) {
	%>
			<a href="Select?pnum=<%=pnum + 1%>">[다음]</a>
			<a href="Select?pnum=<%=totalPage%>">[끝]</a>
	<%
		}
	%>
	
	<br>
	<a href="Insert">새글쓰기</a>
	<!-- /ServletEx1_work/ + Insert -->
	
	<hr>
	upload폴더 실제 위치 : <%= getServletContext().getRealPath("/upload") %>
</body>
</html>