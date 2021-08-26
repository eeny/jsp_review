<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	인서트 페이지
	<br>
	<form action="InsertAjaxProc" method="post" name="frm">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id" id="id"><input type="button" onclick="idChk()" value="아이디 체크">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="text" name="pw" id="pw">
				</td>
			</tr>
		</table>
		<input type="submit">
	</form>
	<br>
	<hr>
	keyup: <span id="res1"></span> <br>
	button: <span id="res2"></span>
	<hr>
	<hr>
	pw: <span id="res3"></span>
	<hr>
	<br>
	<br>

	<!-- <script>
	/* function idChk(){
		var inputId = document.frm.id.value;
		location.href="CheckAjax?id="+inputId;
	} */
</script> -->


	<script>
		$(document).ready(function() {
			$("#id").keyup(function() {// 키를 눌렀다가 땠을때 반응함				
				//$("#res").text($("#id").val());// 테스트 코드

				var params = "id=" + $("#id").val();

				$.ajax({
					type : "post",//method
					url : "CheckIdAjax",
					data : params,//넘길 값 우리는 나중에 id를 넘겨줘야한다.
					dataType : "json",//돌려받을 결과의 타입					
					success : function(args) {// 문제없이 이전 페이지의 결과를 가져왔다면 실행
						// 결과는 agrs에 담김
						$("#res1").text(args.rtn);
					},
					error : function(args) {// 문제 발생했을 때 실행
						// 에러 내용이 args에 담김
						$("#res1").text(args.responseText + " 에러!");
					}
				});
			});
		});
		
		$("#pw").keyup(function() {
			var params = "pw=" + $("#pw").val();
			
			$.ajax({
				type: "post",
				url: "CheckPwAjax",
				data: params,
				dataType: "json",
				success: function(args) {
					$("#res3").text(args.rtn);
				},
				error: function(args) {
					$("#res3").text(args.responseText + " 에러!");
				}
			});
		});
		
		function idChk(){
			var params = "id=" + $("#id").val();

			$.ajax({
				type : "post",//method
				url : "CheckIdAjax",
				data : params,//넘길 값 우리는 나중에 id를 넘겨줘야한다.
				dataType : "json",//돌려받을 결과의 타입					
				success : function(args) {// 문제없이 이전 페이지의 결과를 가져왔다면 실행
					// 결과는 agrs에 담김
					$("#res2").text(args.rtn);
				},
				error : function(args) {// 문제 발생했을 때 실행
					// 에러 내용이 args에 담김
					$("#res2").text(args.responseText + " 에러!");
				}
			});
		}
	</script>