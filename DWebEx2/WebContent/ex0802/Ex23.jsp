<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	for 문 => forEach 문 리스트 12.3 작성 304페이지
	<br>
	<hr>

	그냥 숫자 증가
	<c:forEach var="i" begin="1" end="100" step="2">
		<c:out value="${i}" />
	</c:forEach>

	<%
		int arr[] = { 11, 22, 33, 44, 55, 66, 77, 88, 99, 100 };
	%>

	배열에서 값 다가져오기
	<c:set var="arr" value="<%=arr%>" />

	<c:forEach var="i" items="${arr}" begin="0" end="9" varStatus="status">
      ${status.index} / ${status.count} / ${i}<br>
	</c:forEach>

	<br>
	status.index = 배열의 번호 - 0부터 시작
	<br>
	status.count = 배열을 카운트 하는 숫자 - 1부터 시작
	<br>
	i = items가 있는 for문에서의 i는 배열에서 실제 값을 하나씩 가져온다.
	<%
		// 자바에서의 forEach
		for (int x : arr) {// arr은 값덩어리 / int x는 하나씩 가져올때 그 객체의 값
			
		}
	%>

	<%
		HashMap map = new HashMap();
		map.put("aaa", "최홍석");
		map.put("bbb", "박성식");
		map.put("ccc", "이상훈");
	%>

	map에서 전체 값 가져오기
	<c:set var="maps" value="<%=map%>" />
	<c:forEach var="i" items="${maps}">
      ${i.key} = ${i.value}<br>
	</c:forEach>
</body>
</html>




