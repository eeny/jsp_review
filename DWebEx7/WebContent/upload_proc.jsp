<%@page import="java.io.DataInputStream"%>
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
	// 스트림 방식으로 넘어오기 때문에 request.getParameter()를 쓰는 것이 불가능하다!
	// request.getParameter()는 스트링을 받아서 처리하는 것이므로 스트림을 받을 수 없다.
	request.setCharacterEncoding("UTF-8");
	Enumeration<String> en = request.getHeaderNames();
	out.println("헤더 정보<br>");
	while(en.hasMoreElements()) {
		String key = en.nextElement();
		String value = request.getHeader(key);
		out.println("key : " + key + " / value : " + value + "<br>");
	}
	
	out.println("<br><br><br>");
	
	out.println("전송받은 데이터<br>");
	ServletInputStream sis = request.getInputStream();
	DataInputStream dis = new DataInputStream(sis);
	String line = "";
	while((line = dis.readLine()) != null) {
		out.println(line);
	}
%>
</body>
</html>