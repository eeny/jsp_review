<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 스크립트릿에서는 메서드를 만들 수 없다!
		/* public void sum() {
				
		} */
	%>
	<%!
		// 선언부 - 반환식을 가지는 메서드를 만든다.
		public int sum(int i, int j) {
			// out.println(i + j); 이렇게 출력할 수도 없다!
			return i+j;
		}
	%>
	<!-- 선언부에서 만든 메서드를 표현식(출력식)에서 출력하면 된다! -->
	<%=sum(5,6) %>
	<br>
	1) 매개변수로 String을 주면 전체 몇 글자인가 출력<br>
	<%!
		// 내 답안
		public int length(String str1) {
			int leng1 = str1.length();
			return leng1;
		}
		// 선생님 풀이
		int getLength(String str) {
			return str.length();
		}
	%>
	안녕하세요 입력 : <%=length("안녕하세요") %><br>
	안녕히가세요 입력 : <%=length("안녕히가세요") %><br>
	안녕하세요2 입력 : <%=getLength("안녕하세요2") %><br>
	
	2) 매개변수로 문자 2개를 주면 중간에 $를 붙이고 합쳐서 출력<br>
	<%!
		// 내 답안
		public String combine(String str1, String str2) {
			return str1 + "$" + str2;
		}
		// 선생님 풀이
		String tmp(String str1, String str2) {
			return str1 + "$" + str2;
		}
	%>
	안녕, 하세요 입력 : <%=combine("안녕", "하세요") %><br>
	안녕히, 가세요 입력 : <%=combine("안녕히", "가세요") %><br>
	안녕, 하세요2 입력 : <%=tmp("안녕", "하세요2") %><br>
</body>
</html>