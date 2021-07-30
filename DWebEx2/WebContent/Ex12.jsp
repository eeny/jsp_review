<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	내 컴퓨터에 저장하면 쿠키!<br>
	서버에 저장하면 세션!<br>

	<% 
		if(session.getAttribute("idinfo") == null) {
	%>
			<!-- session에 담긴 값은 Object타입이다. -->
			<form action="Ex12-2.jsp">
				아이디 <input type="text" name="id"><br>
				비밀번호 <input type="text" name="pw"><br>
				<input type="submit" value="로그인"><br>
			</form>
	
	<%		
		} else {
			String id = (String)session.getAttribute("idinfo");
	%>
			<%= id %> 님 반갑습니다!
			<a href="Ex12-4.jsp">로그아웃</a>
			<a href="Ex12-3.jsp">내 정보</a>
			<input type="button" value="세션 연장" onclick="conSession()">
	<%
		}
	%>
	<div><%= session.getLastAccessedTime() %> : 접속한 시간을 밀리세컨즈로 표시</div>
	<p></p>
	
	<script type="text/javascript">
		// 자바 코드를 스크립트로 가져오기? 가능!
		// 스크립트 코드를 자바로 가져오기? 불가능!
				
		// 마지막 접속시간
		var lastAcc = <%= session.getLastAccessedTime() %>;
		// 마지막 접속시간이 밀리세컨이라서 초로 바꿨음
		var lsec = Math.floor(lastAcc * 0.001);
		// prnTime() 1초마다 반복
		var timer = setInterval(prnTime, 1000);
		
		var i = 0;
		function prnTime() {
			var id = "<%= session.getAttribute("idinfo")%>";
			
			if(id != "null") {
				var csec = lsec + i;
				document.querySelector("p").innerHTML = (csec - lsec) + "초/" + id;
				i++;
				if(i == 30) { // 30초가 지나면 
					// 로그아웃 페이지로 보내기
					location.href = "Ex12-4.jsp";
				}				
			}
		}
		
		function conSession() {
			location.reload(); // 새로고침		
		}
	</script>
</body>
</html>