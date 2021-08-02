<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>p309 c:url 예제</title>
</head>
<body>
	<c:url value="http://search.daum.net/search" var="searchUrl">
		<c:param name="w" value="blog"/>
		<c:param name="q" value="공원"/>
	</c:url>
	<!-- 
		여기까지 URL 만들기 + 파라미터 같이 넘기기 
		http://search.daum.net/search?w=blog&q=공원
	-->
	
	${searchUrl }<br>
	
	<c:url value="/"/> 프로젝트의 위치를 찾아서 출력해준다<br>
	
	<img src="<c:url value='/'/>/img/piyo.png"><br>
	<img src="<c:url value='/img'/>/piyo.png"><br>
	
	<c:url value="/Ex23.jsp"/><br>
	<c:url value="./Ex23.jsp"/><br> 
	
	<hr>
	
	<form action="Ex26-2.jsp">
		검색 범위 	<select name="range">
					<option value="tot">통합검색</option>				
					<option value="news">뉴스</option>				
					<option value="blog">블로그</option>				
				</select>
		검색 <input type="text" name="search">
		<input type="submit" value="제출">
	</form>
</body>
</html>