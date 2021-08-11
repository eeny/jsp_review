<%@page import="com.company.FDao"%>
<%@page import="com.company.FBDto"%>
<%@page import="com.company.FDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="ftop.jsp"/>
<%
	FDto dto = (FDto)session.getAttribute("logindata");
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	FBDto bdto = new FDao().getContent(idx);
	
	if(dto != null) {
%>
	<form action="fupdate_proc.jsp">
		<input type="hidden" value="<%=idx%>" name="idx">
		<table border="1">
			<tr>
				<td>글쓴이</td>
				<td><%= bdto.getFmember_name() %></td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><input type="text" name="title" value="<%=bdto.getTitle()%>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content"><%=bdto.getContent() %></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정 완료">
					<input type="button" value="처음으로" onclick="location.href='fmain.jsp'">
				</td>
			</tr>
		</table>
	</form>
<%		
	} else {
%>
		<script>
			alert("잘못된 접근입니다.");
			location.href = "fmain.jsp";
		</script>
<%		
	}
%>
<jsp:include page="fbottom.jsp"/>