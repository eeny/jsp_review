<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="UpdateProc" method="post" enctype="multipart/form-data">
		<table border="1" cellspacing="0">
			<tr>
				<td>번호</td>
				<td>${data.getIdx() }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="${data.getTitle() }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="descr">${data.getDescr() }</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="ofilename"></td>
			</tr>
		</table>
		<br>
		<input type="hidden" name="idx" value="${data.getIdx() }">
		<input type="submit" value="수정">
		<input type="button" value="취소" onclick="history.back()">
	</form>
</body>
</html>