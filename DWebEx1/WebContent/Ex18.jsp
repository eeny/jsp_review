<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <table width="400" border="1">
      <tr>
         <td colspan="2">
            <!-- include - top -->
            <jsp:include page="top.jsp" flush="false"/>
         </td>
      </tr>
      <tr>
         <td width="100">
            <!-- include - left -->
            <jsp:include page="left.jsp" flush="false"/>
            <!-- left.jsp ������ �����ؼ� �ٿ��ִ°Ͱ� ����. 100% ����. -->
         </td>
         <td>
            <!-- ���� ����~~ -->
            <%
               String value = request.getParameter("val"); // value=home
               
               if( value== null){                  
                  out.println("���ӽ� ùȭ���Դϴ�.<br><br><br><br><br>"); 
               }else if(value.equals("home")){
                  //out.println("Ȩ Ȩ Ȩ");
                  //�̷������� ���� �����ϰų�
                  // �Ǵ� <jsp:include>�� ����ؼ� �ٸ� �������� �����͵� �ȴ�.
               %>
                  <jsp:include page="first.jsp">
                     <jsp:param value="<%=value%>" name="val"/>
                     <jsp:param value="first page" name="page"/>
                  </jsp:include>   
               <%
               }else if(value.equals("info")){
                  /* out.println("���� ���� ����"); */
               %>
                  <jsp:include page="second.jsp">
                     <jsp:param value="<%=value%>" name="val"/>
                  </jsp:include>   
               <%   
               }
            %>
         </td>
      </tr>
      <tr>
         <td colspan="2">
            <!-- include - bottom -->
            <jsp:include page="bottom.jsp" flush="false"/>
         </td>
      </tr>
   </table>
</body>
</html>