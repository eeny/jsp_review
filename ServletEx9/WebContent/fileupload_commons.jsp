<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="fileuploadok.jsp" method="post" enctype="multipart/form-data">
		아무 글이나 쓰세요<input type="text" name="text"><br>
		파일<input type="file" name="myfile"><br>
		<input type="submit">
	</form>
</body>
</html>