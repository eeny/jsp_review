<%@page import="com.ajax.AjaxDto"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="insertajax.jsp" />

select ������
<br>
<br>

<table border="1">
	<tr>
		<td>��ȣ</td>
		<td>���̵�</td>
		<td>��й�ȣ</td>
		<td>����</td>
	</tr>
	<c:forEach var="dto" items="${ requestScope.data }">
		<tr>
			<td>${ dto.idx }</td>
			<td>${ dto.id }</td>
			<td>${ dto.pw }</td>
			<td>
				<a href="DeleteAjax?idx=${ dto.idx }">����</a>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>






