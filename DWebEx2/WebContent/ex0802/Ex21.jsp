<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>p301 JSTL c:choose 예제</title>
</head>
<body>
	<pre>
	if문만 있다! (DB에서 조건문 쓰는 거랑 비슷하다!)
	if/else가 없다!
	대신 choose-when 이 있다
	choose
		when 조건
		when 조건
		otherwise 기본값
	</pre>

	<ul>
	<c:choose>
		<c:when test="${param.name == 'bk' }">
			<li>당신의 이름은 ${param.name }입니다.</li>
		</c:when>
		<c:when test="${param.age > 20 }">
			<li>당신은 20세 이상입니다.</li>
		</c:when>
		<c:otherwise>
			<li>당신은 'bk'가 아니고 20세 이상이 아닙니다.</li>
		</c:otherwise>
	</c:choose>
	</ul>
</body>
</html>