<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSTL 표준 태그 라이브러리</title>
</head>
<body>
	표현식 EL / JSTL태그  = 결국 결과는 유사하다!<br>
	접두어란? jsp:include 액션태그 쓸 때 앞에 jsp~ 라고 붙이는 것도 접두어이다!<br>
	
	<!-- p300 JSTL c:if 예제 -->
	
	<!-- if(조건 => 무조건 true/false)처럼 조건은 test로 입력한다! -->
	<c:if test="true">
	무조건 수행<br>
	</c:if>
	
	<!-- param.name 은 request.getParameter("name"); 랑 같다! -->
	<c:if test="${param.name eq 'bk' }">
	name 파라미터의 값이 ${param.name } 입니다.<br>
	</c:if>
	
	<c:if test="${18 < param.age }">
	당신의 나이는 18세 이상입니다.
	</c:if>
</body>
</html>