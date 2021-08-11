<%@page import="com.company.FileDto"%>
<%@page import="com.company.FDao"%>
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
	String idx = request.getParameter("idx");
	
	FDao dao = new FDao();
	FileDto dto = dao.getSelectData(Integer.parseInt(idx));
	
	if(dto != null) {
%>
		제목 : <%=dto.getTitle() %><br>
		글쓴이 : <%=dto.getWriter() %><br>
		내용 : <%=dto.getContent() %><br>
		파일 경로 : <%=getServletContext().getRealPath("/upload")%>\<%=dto.getCopyfile()%><br> 
		<%-- 
			<img src="<%=getServletContext().getRealPath("/upload")%>\<%=dto.getCopyfile()%>">
			이거는 크롬 보안상 경로에 있는 파일을 불러올 수 없다! 내 컴퓨터에 있는 폴더라서!
		 --%>
		<img src="upload\<%=dto.getCopyfile()%>">
		<br>
		<a href="testUpload.jsp">처음으로</a>
<%		
	} else {
		out.println("존재하지 않는 글");
	}
%>

</body>
</html>