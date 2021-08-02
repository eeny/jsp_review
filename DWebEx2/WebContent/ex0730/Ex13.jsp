
<%@page import="com.company.Ex2Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if (session.getAttribute("memberInfo") == null) {
	%>
	<form action="Ex13-2.jsp">
		id<input type="text" name="id"><br> 
		pw<input type="text" name="pw"><br> 
		email<input type="text" name="email"><br> 
		age<input type="text" name="age"><br> 
		weight<input type="text" name="weight"><br>
		<input type="submit">
	<%
	} else {
		Ex2Dto dto = (Ex2Dto) session.getAttribute("memberInfo");
	%>
		<%=dto.getEmail()%>님 반갑습니다!
		<%=dto.getWeight()%>몸무게를 가졌네요.<br> 
		여기까지의 내용은 세션에 값 덩어리를 넣을 수 있다는것.(오브젝트를 넣을수 있다.)<br>
		Collection(Vector, ArrayList, Map)도 되고/ array(배열)도 되고 다 된다!
	<%
	}
	%>
	</form>
</body>
</html>