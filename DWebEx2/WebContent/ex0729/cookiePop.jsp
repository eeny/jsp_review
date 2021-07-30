<%@page import="com.company.CookieUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
html, body {
	height: 100%;
}

#wrap {
	width: 100%;
	height: 100%;
	background-color: pink;
	position: relative;
}

.pop {
	width: 300px;
	height: 300px;
	border: 1px solid black;
	position: absolute;
	top: 10%;
	left: 30%;
	background-color: skyblue;
}

.pop div {
	position: absolute;
	bottom: 0;
}
</style>
</head>
<body>
	<div id="wrap">
		현재 쿠기:<%=CookieUtil.getCookieValue("ad", request)%>

		<%
		if (CookieUtil.getCookieValue("ad", request) == null) {
		%>
		<div class="pop">
			<div>
				<input type="checkbox" name="ck" id="ck">
				<a href="javascript:myFunc();">1분동안 보지 않기</a>

			</div>
		</div>
		<%
		}
		%>
	</div>
	<script>
		function myFunc() {
			var isChecked = document.querySelector("#ck").checked;
			if (isChecked) {
				location.href = "cookieProc.jsp";
			}
			document.querySelector(".pop").style.display = "none";
		}
	</script>
</body>
</html>