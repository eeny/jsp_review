<%@page import="com.company.CookieUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String key = request.getParameter("key");
	
		// idid - Ű�� ������ ���� �������� �޼���
		out.print(CookieUtil.getCookieValue(key, request));		
		// jsp������ �⺻���� request�� ��� �ִ�!
		// ������ java���� request�� ����.
		// �׷��� java���� request�� ����Ϸ��� �ݵ�� �Ű������� �����ؾ� �Ѵ�!
	%>
</body>
</html>