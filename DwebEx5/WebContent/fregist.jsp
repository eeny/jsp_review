<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="ftop.jsp"/>
	<form action="fregist_proc.jsp">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="pw"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="가입완료">
					<input type="reset" value="취소">
					<input type="button" value="돌아가기" onclick="location.href='fmain.jsp'">
				</td>
			</tr>
		</table>
	</form>
<jsp:include page="fbottom.jsp"/>