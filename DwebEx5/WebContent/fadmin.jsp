<%@page import="com.company.FDao"%>
<%@page import="com.company.FDto"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="ftop.jsp"/>
<%
	FDto logindata = (FDto)session.getAttribute("logindata");
	// 로그인을 했다면 값이 있을거고 없으면 null
	if(logindata == null || logindata.getLv() != 10) {
%>
		<script>
			alert("잘못된 접근입니다.");
			location.href = "fmain.jsp";
		</script>
<%		
	} else {
	
	FDao dao = new FDao();
	Vector<FDto> v = dao.getAllFmember();
%>
	관리자 페이지
	<table border="1">
		<tr>
			<td>번호</td>
			<td>아이디</td>
			<td>이름</td>
			<td>이메일</td>
			<td>권한</td>
		</tr>
		<c:forEach var="i" items="<%=v %>">
			<tr>
				<td>${i.idx }</td>
				<td>${i.id }</td>
				<td>${i.name }</td>
				<td>${i.email }</td>
				<td>${i.lv }</td>
			</tr>
		</c:forEach>
	</table>
<% } %>
<jsp:include page="fbottom.jsp"/>