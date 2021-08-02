<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EL 표현 언어</title>
</head>
<body>
	<%-- <%= "내용" %> 표현식 --%>
	<%-- ${"내용" } EL --%>
	
	<!-- p255 EL객체  예제 -->
	
	요청 URI: ${pageContext.request.requestURI }<hr>
	<!-- 어디에 속해있는 request인지 앞에 적는다! -->
	
	<%
		request.setAttribute("name", "홍길동");
	%>
	request의 name 속성: ${requestScope.name }<hr>
	
	code 파라미터: ${param.code }<!-- reqeust.getParameter("code"); 랑 같은 말 -->
	<hr>
	
	<!-- 수치 연산자 -->
	${"안녕" } <!-- 안녕 출력 -->
	<hr>
	${"10" + 1 } <!-- 11 출력. 왜? 스크립트 언어라서 JS와 유사하다! -->
	<%-- ${"일" + 1 } --%>
	<!-- 500에러 NumberFormatException 발생! 왜? 문자열을 숫자로 못 바꿔서	-->
	<hr>
	
	<!-- 비교 연산자 -->
	${10 == 11 } / ${10 eq 11 } <!-- false 출력 -->
	${10 == 10 } / ${10 eq 10 } <!-- true 출력 -->
	<hr>
	${10 > 11 } / ${10 gt 11 } <!-- false 출력 -->
	${10 < 11 } / ${10 lt 11 } <!-- true 출력 -->
	<hr>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nbsp 공백
	&lt; &gt; lt, gt 꺽쇠
	<hr>
	
	<!-- 논리 연산자 -->
	${11 != 8 } <!-- true 출력 -->
	<hr>
	
	<%
		String[] str = new String[5]; // 공간만 생성
		int[] str2 = {1,2,3,4,5}; // 공간과 동시에 값 넣기
		List<Integer> a = new ArrayList<Integer>();
		List<Long> value = Arrays.asList(1L, 2L, 3L); // 배열을 List로 변환
		
		// 이렇게 List를 만들 수도 있다!
		ArrayList<Integer> li = new ArrayList<Integer>();
		li.add(1);
		li.add(2);
		li.add(3);
		
		request.setAttribute("vals", li);
	%>
	<%-- ${myfunc: sum(vals) } 이렇게 함수를 쓴다... --%>
	<hr>
	${1+1; 2+2 } <!-- 4만 출력됨 따라서 이렇게 쓰면 안된다! -->
</body>
</html>