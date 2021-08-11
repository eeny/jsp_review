<%@page import="com.company.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	Dao dao = new Dao();
	boolean b = dao.getRegId(id);
	if(b) { // true라면
		out.println("이미 있음");
	} else {
		out.println("사용 가능");
	}
%>