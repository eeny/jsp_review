<%@page import="com.company.JDto"%>
<%@page import="java.util.Vector"%>
<%@page import="com.company.JDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
</head>
<body> 
	<!-- 입력 -->
	<form action="jinsert_proc.jsp">
		<table>
			<tr>
				<td style="width: 70px;">이름</td>
				<td><input type="text" name="name" required></td>
				<td style="width: 70px;">비밀번호</td>
				<td><input type="password" name="pw" required></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td colspan="3"><input type="text" name="email"></td>			
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3"><textarea name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="4"><input type="submit" value="쓰기"></td>
			</tr>
		</table>
	</form>
	
	<!-- 검색 -->
	<hr>
	<form action="jmain.jsp">
		<select name="kind">
			<option value="content">내용</option>
			<option value="name">이름</option>
		</select>
		<input type="text" name="search">
		<input type="submit" value="검색">
	</form>
	<hr>
<%
	// 검색했을 경우 사용되는 변수
	request.setCharacterEncoding("utf-8");
	String kind = request.getParameter("kind");
	String search = request.getParameter("search");
	
	if(kind == null) {
		kind = "content";
	}
	
	if(search == null) {
		search = "";
	}

	JDao dao = new JDao();

	// DB에서 가져와서 출력하는 방법 1
	/* String str = dao.getSelectAll();
	String[] arrstr = str.split(",");
	for(int i=0; i<arrstr.length; i++) {
		out.println(arrstr[i] + "<br>");
	} */
	
	// DB에서 가져와서 출력하는 방법 2
	Vector<JDto> v = dao.getSelectAll(kind, search);
%>
		<table border="1">

<%
	if(v.size() < 1) {
		out.print("검색 결과 없음");
	} else {
		for(int i=0; i<v.size(); i++) {
			//out.println(v.get(i) + "<br>");
%>		
				<tr style="background-color: pink;">
					<%-- <td><%=v.get(i).split("/")[0] %></td>
					<td><%=v.get(i).split("/")[1] %></td>
					<td><%=v.get(i).split("/")[2] %></td>
					<td><%=v.get(i).split("/")[3] %></td>
					<td><%=v.get(i).split("/")[4] %></td> --%>
					
					<!-- DB에서 가져와서 출력하는 방법 3 : Dto(bean) 사용 -->
					<td width="30px"><%=v.get(i).getIdx() %></td>
					<td><a href="jdelete.jsp?idx=<%=v.get(i).getIdx()%>"><%=v.get(i).getName() %></a></td>
					<td><%=v.get(i).getPw() %></td>
					<td><%=v.get(i).getEmail() %></td>
				</tr>
				<tr>
					<td colspan="4"><%=v.get(i).getContent().replace("\r\n", "<br>") %></td>			
				</tr>
<%
		}
	}
%>
		</table>
	<hr>
	Vector로 저장된 Dto를 JSTL로 꺼낼 수도 있다!<br>
	밑의 부분은 forEach 사이의 내용이 반복된다!<br>
	DB의 내용을 한 줄 씩 가져와서 뿌리는 것이다!<br>
	<hr>
	<c:forEach var="i" items="<%=v %>">
		${i.idx }/
		<a href="jdelete.jsp?idx=${i.idx }">${i.name }</a>/
		${i.pw }/${i.email }/${i.content }<br>
	</c:forEach>
</body>
</html>