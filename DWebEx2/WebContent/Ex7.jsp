<%@page import="com.company.CookieUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%-- <%
		String key = request.getParameter("key");
	
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
	
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals(key)) {
			Cookie cookie = new Cookie(cookies[i].getName(), "");// ������ �ʱ�ȭ
			// ������ �������� ����Ű�� ��� �ִ�.
			cookie.setMaxAge(0);
			// ��Ű�� ���������� ����� ����� �����ϳ�, 
			// Ư�� ��Ű�� delete ���� ���·� ���� ���� ����.
			// �׷��� �����ð��� 0���� ������ �ָ� �˾Ƽ� ��������. 
	
			// ��Ű�� ������ �ð� ���Ŀ� ��������. �� �޼��尡 �ð� ���� �ϴ� �κ�
			// 0 �̴ϱ� 0��  => �� ��Ű�� �����Ǵ� ��ü �ð��� 0���� �ٲ۴�.
			response.addCookie(cookie);
			out.println("������");
			break;
				}
			}
		}
	%> --%>
	<!-- CookieUtil.java�� �޼���ȭ���״� -->
	
	<%
		String key = request.getParameter("key");
		// �ڹٿ����� request, response�� ����!
		// ���� request, response�� ������ �ʿ��ϴٸ�
		// �� ��ü���� �ݵ�� �ڹٿ� �Ű������� ��������Ѵ�!
		out.println(CookieUtil.deleteCookie(key, request, response));
	%>
	<a href="Ex6.jsp">���ư���</a>
</body>
</html>