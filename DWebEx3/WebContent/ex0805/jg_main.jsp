<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">
</head>
<body>
<!-- 
CREATE TABLE guestbook (
	idx INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(100) NOT NULL,
	pw VARCHAR(100) NOT NULL,
	email VARCHAR(100),
	content text
);

방명록 이름 규칙
jg_눈에 보이는 기능 - 처리하는 기능(뒤에 proc를 붙인다.)
jsp guest book
 -->
	<form action="jg_write_proc.jsp">
		<table>
			<tr>
				<td style="width: 70px;">이름</td>
				<td><input type="text" name="name"></td>
				<td style="width: 70px;">비밀번호</td>
				<td><input type="password" name="pw"></td>
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
	
	<br>
	<form action="jg_main.jsp">
		<select name="searchCategory">
			<option value="content">내용</option>
			<option value="name">이름</option>
		</select>
		<input type="text" name="searchWord">
		<input type="submit" value="검색">
	</form>
	
	<br>
	<div>
	
	<jsp:include page="jg_select.jsp"/>
	
	</div>
</body>
</html>