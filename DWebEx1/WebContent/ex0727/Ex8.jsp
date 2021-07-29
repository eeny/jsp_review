<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
div {
	border: 1px solid black;
}
</style>
</head>
<body>
	<form name="frm" id="frm" action="Ex8-2.jsp">
		<input type="button" value="추가" onclick="addInput()">
		<input type="button" value="삭제" onclick="delInput()">
		<input type="submit" value="전송">
	</form>

	<script>
		var idx = 0;

		function addInput() {
			var box = document.createElement("div");
			box.setAttribute("id", "box" + idx);
			
			var input = document.createElement("input");
			var txt = document.createTextNode("값 : ");
			var br = document.createElement("br");

			input.setAttribute("type", "text");
			input.setAttribute("name", "txt" + idx);
			input.setAttribute("value", idx);

			box.appendChild(txt);
			box.appendChild(input);
			box.appendChild(br);
			document.getElementById("frm").appendChild(box);
			idx++;
		}
		function delInput() {
			if (idx > 0)
				idx--;

			var id = "box" + idx;
			document.getElementById(id).remove();

		}
	</script>
</body>
</html>