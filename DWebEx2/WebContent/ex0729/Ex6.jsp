<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="Ex8.jsp">
		�Է��� ��Ű�� Ű �Է� : <input type="text" name="key"> <br> 
		�Է��� ��Ű�� �� �Է� : <input type="text" name="val">
		<input type="submit">
	</form>
	<br>
	<form action="Ex5.jsp">
		ã�� ��Ű�� Ű �Է� : <input type="text" name="key">
		<input type="submit">
	</form>
	<br>
	<form action="Ex7.jsp">
		������ ��Ű�� Ű �Է� : <input type="text" name="key">
		<input type="submit">
	</form>
	<br>
	��Ű���<br>
	<%
		Cookie[] cookies = request.getCookies();// ��� ��Ű�� �� ����ִ�.
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				out.print(cookies[i].getName() + "=" + cookies[i].getValue() + "<br>");
			}
		}
	%>
</body>
</html>