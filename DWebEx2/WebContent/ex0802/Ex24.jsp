<%@page import="java.util.StringTokenizer"%>
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
	<%
		// split()과 유사한 StringTokenizer()
		String str = "1,2,3,4,5,6,7,8,9";
		StringTokenizer st = new StringTokenizer(str, ",");
		out.println(st + "<br>"); // java.util.StringTokenizer@62039252
		// 주소값이 아닌 문자열로 출력하려면~
		while(st.hasMoreTokens()) {
			out.println(st.nextToken() + "<br>");
		}
	%>
	<!-- 위에서 만든 변수를 이용할 수도 있다 -->
	<c:set var="str" value="<%=str %>" />
	<c:forTokens var="tk" items="${str }" delims=",">
		${tk }<br>
	</c:forTokens>
	
	<!-- p307 c:forTokens 예제 -->
	콤마와 점을 구분자로 사용:<br>
	<c:forTokens var="token" items="빨강색,주황색.노란색.초록색,파랑색,남색.보라색" delims=",.">
		${token }
	</c:forTokens>
</body>
</html>