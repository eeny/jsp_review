<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.company.Dto"%>
<%@page import="com.company.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	Dao dao = new Dao();
	JSONObject json = dao.getRegMemberJson(idx);
	//out.println(dto.getIdx() + "/" + dto.getId());
	
	out.println(json.toString());
%>