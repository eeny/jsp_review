<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- EL/JSTL 사용하기 -->
	<!-- if문을 여러개를 choose when으로 처리할 수 있다! -->	
	id: 
	<c:if test="${param.id != 'idid' }">
		<script>
			location.href="jspPractice1-2.jsp";
		</script>
	</c:if>
	<c:if test="${param.id eq 'idid' }">
		${param.id }
	</c:if>
	<br>
	
	pw: ${param.pw }<br>
	
	email: ${param.email }<br>
	
	age: 만 
	<c:if test="${(param.age - 2) < 20 }">
		<script>
			alert("성인만 가입 가능합니다.");
			location.href="jspPractice1-2.jsp";
		</script>
	</c:if>
	<c:if test="${(param.age - 2) >= 20 }">
		${param.age - 2} 세
	</c:if>
	<br>
	
	weight: ${param.weight * 2.205 } 파운드

</body>
</html>