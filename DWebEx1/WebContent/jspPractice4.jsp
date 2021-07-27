<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 정보 출력하기(회원가입창)</title>
</head>
<body>
	<form name="frm" action="jspPractice4-1.jsp">
		아이디
		<input type="text" name="id">
		<hr>
		비밀번호
		<input type="password" name="pw">
		<hr>
		비밀번호 확인
		<input type="password" name="repw">
		<hr>
		이름
		<input type="text" name="name">
		<hr>
		이메일
		<input type="text" name="email">
		<hr>
		<input type="button" value="회원가입" onclick="reg()">
		<input type="reset" value="취소">
	</form>

	<script>
		function reg() {
			var id = document.frm.id;
			var pw = document.frm.pw;
			var repw = document.frm.repw;
			var name = document.frm.name;
			var email = document.frm.email;
			var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

			if (id.value == "" || id.value.indexOf(" ") != -1
					|| id.value.length > 8) {
				alert("아이디는 8자 이하 / 빈칸을 포함하면 안됩니다.");
				id.focus();
			} else if (pw.value == "" || pw.value.indexOf(" ") != -1
					|| pw.value.length > 12 || pw.value.length < 6) {
				alert("비밀번호를 제대로 입력해 주세요");
				pw.focus();
			} else if (repw.value == "" || repw.value.indexOf(" ") != -1
					|| repw.value.length > 12) {
				alert("비밀번호가 일치하지 않습니다.");
				repw.focus();
			} else if (repw.value != pw.value) {
				alert("비밀번호와 비밀번호 확인은 같아야 합니다.")
				pw.value = "";
				repw.value = "";
				pw.focus();
			} else if (email.value == "" || regex.test(email.value) === false) {
				alert("이메일 형식이 맞지 않습니다");
				email.focus();
			} else {
				alert("회원가입");
				document.frm.submit();
			}
		}
	</script>
</body>
</html>