<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
홈 버튼을 눌렀을 때 나오는 페이지 입니다.<br>
<%
	String value = request.getParameter("val");
	out.println("넘어온 값 : " + value);
%>