<%@page import="java.util.Vector"%>
<%@page import="com.company.FDao"%>
<%@page import="com.company.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="testUpload_proc.jsp" method="post" enctype="multipart/form-data">
		제목 <input type="text" name="title"><br>
		글쓴이 <input type="text" name="writer"><br>
		내용 <input type="text" name="content"><br>
		파일 (최대 10mb) <input type="file" name="myfile"><br>
		<input type="submit" value="업로드">
	</form>
	<hr>
	<h2>업로드한 목록</h2>
<%
	FDao dao = new FDao();
	Vector<FileDto> v = dao.getSelectAll();
	for(int i=0; i<v.size(); i++) {
%>
		<%=v.get(i).getIdx() %> / <a href="testUploadView.jsp?idx=<%=v.get(i).getIdx()%>"><%=v.get(i).getTitle() %></a> / <%=v.get(i).getWriter() %><br>
<%		
	}
	
%>
</body>
</html>