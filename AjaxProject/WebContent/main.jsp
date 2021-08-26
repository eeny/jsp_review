<%@page import="com.hs.myapp.SensorDTO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% Vector<SensorDTO> v = (Vector)request.getAttribute("data"); 
	for(int i=0;i<v.size();i++){
		out.print(
			v.get(i).getIdx()+"/"+
			v.get(i).getTemperature()+"/"+
			v.get(i).getHumidity()+"/"+
			v.get(i).getPrecipitation()+"<br>");
	}
%>
</body>
</html>








