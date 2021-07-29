<%@page import="java.util.Enumeration"%>
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
		// String txt0 = request.getParameter("txt0");
		// out.print(txt0);
		// 이런식으로 값을 일일이 넘겨받게되면 넘어오는 값이 몇 개인지를 모르기 때문에 곤란하다!
		// 이럴 때 사용하는 것이 request.getParameterNames() 이다!
		
		Enumeration names = request.getParameterNames();
		// names 안에는 넘어온 name들이 전부 담겨있다!
		while(names.hasMoreElements()) {
			// 넘어온 모든 name들 출력
			// out.println(names.nextElement());
			// 각 name들의 값 출력
			out.println(request.getParameter((String)names.nextElement()));
		}
	%>
	
	<pre>
	request.getParameter(name) - 값 하나 들고오기 - 타입: String
	request.getParameterValues(name) - 값 덩어리 하나 들고오기 - 타입: String[]
	request.getParameterNames() - 모든 name 들고오기 - 타입: String
	=> name을 들고오므로 바로 사용이 불가능하고 name을 가지고 다시 getParameter(name)을 적용해야 한다!
	</pre>
</body>
</html>