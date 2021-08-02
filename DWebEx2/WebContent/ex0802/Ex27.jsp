<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- c:out -->
	<% String str = "안녕"; %>
	<c:out value="<%=str %>"/>
	
	<!-- p314 c:catch 예제 -->
	<c:catch var="ex"> <!-- ex : 예외가 발생했을 경우 해당 예외의 정보가 담기는 변수 -->
		name 파라미터의 값 = <%=request.getParameter("name") %><br>
		<%
			String name = request.getParameter("name");
			out.println(name.length());
		%>
	</c:catch>
	<!-- 이렇게 c:catch로 감싸기만 해도 에러페이지가 뜨지 않는다! 무슨 에러인지는 출력해야 알 수 있다. -->
	<br>
	<c:if test="${ex ne null }">
		익셉션이 발생하였습니다: <br>
		${ex }
	</c:if>
</body>
</html>