<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.company.Dto"%>
<%@page import="com.company.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	Dao dao = new Dao();
	Dto dto = dao.getRegMember(idx);
	//out.println(dto.getIdx() + "/" + dto.getId());
	
	// json은 map이랑 똑같다!!!
	JSONObject json = new JSONObject();
	json.put("result1", dto.getIdx());
	json.put("result2", dto.getId());
	
	out.println(json.toString());
%>