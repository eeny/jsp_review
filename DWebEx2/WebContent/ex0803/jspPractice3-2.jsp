<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSTL 문제 - 출력</title>
</head>
<body>
	<c:set var="q1" value="${param.q1 }"/>
	<c:set var="q2" value="${param.q2 }"/>
	<c:set var="q3" value="${param.q3 }"/>
	<c:set var="q4" value="${param.q4 }"/>
	<c:set var="q5" value="${param.q5 }"/>
	<c:set var="q6" value="${param.q6 }"/>
	<c:set var="q7" value="${param.q7 }"/>
	
	1)
	${fn:length(q1) }
	<hr>
	2)
	${fn:replace(q2, "버터", "butter") }
	<hr>
	3)<!-- 배열로 만들어보자... -->
	${fn:substring(q3, 14, 19) } ${fn:substring(q3, 7, 12) } ${fn:substring(q3, 0, 5) }
	<hr>
	4)
	010-${q4 }
	<hr>
	5)
	${fn:trim(q5) }
	<hr>
	6)
	<c:choose>
		<c:when test="${fn:contains(q6, '#') }">
			"특수문자로 시작할 수 없습니다."
		</c:when>
		<c:otherwise>${q6 }</c:otherwise>
	</c:choose>
	<hr>
	7)
	${fn:substring(q7, 0, 5) }
</body>
</html>