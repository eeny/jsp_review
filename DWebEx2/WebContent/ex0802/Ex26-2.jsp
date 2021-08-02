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
	<% request.setCharacterEncoding("utf-8"); %>

	<c:url value="http://search.daum.net/search" var="searchUrl">
		<c:param name="w" value="blog"/>
		<c:param name="q" value="${param.search }"/>
	</c:url>
	
	<a href="${searchUrl }">다음</a>
	
	<script>
		// 스크립트로 바로 페이지 이동도 가능하다!
		//location.href = "${searchUrl}";
	</script>
	
	<!-- response.sendRedirect(주소) 이 코드를 만나는 순간 바로 주소로 이동 -->
	<c:redirect url="http://search.daum.net/search">
		<c:param name="w" value="${param.range }"/>
		<c:param name="q" value="${param.search }"/>
	</c:redirect>
	<!-- 바로 페이지를 이동시킨다! -->
</body>
</html>