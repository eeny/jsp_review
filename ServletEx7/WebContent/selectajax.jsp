<%@page import="com.ajax.AjaxDto"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="insertajax.jsp" />

select 페이지
<br>
<br>

<table border="1">
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>삭제</td>
	</tr>
	<c:forEach var="dto" items="${ requestScope.data }">
		<tr>
			<td>${ dto.idx }</td>
			<td>${ dto.id }</td>
			<td>${ dto.pw }</td>
			<td>
				<a href="DeleteAjax?idx=${ dto.idx }">삭제</a>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>






