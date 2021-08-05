<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="jg_include_sel.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	<%
		String idx = request.getParameter("idx");
		String pw = request.getParameter("pw");
		//String name = request.getParameter("name"); 이전페이지에서 넘어온 적이 없으니까 사용할 수 없다! null이 뜬다!
		
		String sql = "SELECT COUNT(idx) AS cnt FROM guestbook WHERE idx = ? AND pw = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(idx));
		pstmt.setString(2, pw);
		rs = pstmt.executeQuery();
		
		int result = 0;
		if(rs.next()) {
			//rs.getInt("cnt");
			result = rs.getInt(1); // 숫자의 의미는? 결과 행의 컬럼 번호(순서)
			// result에는 총 개수 (count한 개수)가 담긴다. 0 아니면 1
		}
		if(result == 0) { // 어차피 결과는 0 아니면 1
	%>
			<script>
				alert("비밀번호가 틀립니다.");
				history.back();
			</script>
	<%
		} else { // 비밀번호 맞았을 때
				// 넘어온 idx로 값을 select 한 다음에 결과를 밑에 table에 넣어준다!
			String sql2 = "SELECT * FROM guestbook WHERE idx = ?";
										// DB에서 int 타입이므로 ''홑따옴표 없어도 된다!
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, Integer.parseInt(idx));
			rs = pstmt.executeQuery();
			
			String name = null;
			String password = null;
			String email = null;
			String content = null;
			if(rs.next()) {
				name = rs.getString(2);
				password = rs.getString(3);
				email = rs.getString(4);
				content = rs.getString(5);
			}
	%>
		<form action="jg_update_proc.jsp">
			<table>
				<tr>
					<td style="width: 70px;"><%= idx%> ) 이름</td>
					<td><input type="text" name="name" value="<%=name%>"></td>
					<td style="width: 70px;">비밀번호</td>
					<td><input type="password" name="pw" value="<%=password%>"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td colspan="3"><input type="text" name="email" value="<%=email%>"></td>			
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3"><textarea name="content"><%=content %></textarea></td>
				</tr>
				<tr>
					<td colspan="4"><input type="submit" value="쓰기"></td>
				</tr>
			</table>
		<input type="hidden" name="idx" value="<%=idx%>"> 
		</form>
	<%		
		}
	%>
</body>
</html>