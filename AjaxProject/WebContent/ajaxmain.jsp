<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
ajax main<br>

<div></div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		//alert(1);
		$.ajax({
            type:"POST",
            url:"/AjaxProject/ajaxdata.do",     
            dataType:"json", //�޴� type�� json���
            success:function(args) { // ������� json������� args�� ���� ����		                 
                for(i in args){
                	$("div").append(args[i][0]+"/"+args[i][1]+"/"+args[i][2]+"/"+args[i][3]+"<br>");
                }
            },		 
            error:function(args) {		 
            	$("div").html(args.responseText+"<br>���� �߻�!");
            }
        });	
	});
</script>
</body>
</html>












