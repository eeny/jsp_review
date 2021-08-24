<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="UpdateProc" method="post">
		<table border="1" cellspacing="0">
			<tr>
				<td>번호</td>
				<td>${data.getIdx() }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="${data.getName() }"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="pw" value="${data.getPw() }"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="${data.getTitle() }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content">${data.getContent() }</textarea></td>
			</tr>
		</table>
		<br>
		<input type="hidden" name="idx" value="${data.getIdx() }">
		<input type="submit" value="수정">
		<input type="button" value="취소" onclick="history.back()">
	</form>
</body>
</html>