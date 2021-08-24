<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" cellspacing="0">
		<tr>
			<td>번호</td>
			<td>${data.getIdx() }</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${data.getName() }</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>${data.getPw() }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${data.getTitle() }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content" readonly>${data.getContent() }</textarea></td>
		</tr>
	</table>
	<br>
	<a href="Select">목록으로</a>
	<a href="Update?idx=${data.getIdx() }">수정</a>
	<a href="Delete?idx=${data.getIdx() }">삭제</a>
	<a href="Insert">글쓰기</a>
</body>
</html>