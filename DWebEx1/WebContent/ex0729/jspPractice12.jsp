<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- p188 기본객체의 속성을 이용해서 값 전달하기 예제 -->
<%@ page import="java.util.Calendar"%>
<%
	Calendar cal = Calendar.getInstance();
	request.setAttribute("time", cal);
%>
<jsp:forward page="/ex0729/jspPractice13.jsp"/>