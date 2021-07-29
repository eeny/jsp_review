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
            <!-- left.jsp 내용을 복사해서 붙여넣는것과 같다. 100% 같다. -->
         </td>
         <td>
            <!-- 내용 내용~~ -->
            <%
               String value = request.getParameter("val"); // value=home
               
               if( value== null){                  
                  out.println("접속시 첫화면입니다.<br><br><br><br><br>"); 
               }else if(value.equals("home")){
                  //out.println("홈 홈 홈");
                  //이런식으로 값을 변경하거나
                  // 또는 <jsp:include>를 사용해서 다른 페이지를 가져와도 된다.
               %>
                  <jsp:include page="first.jsp">
                     <jsp:param value="<%=value%>" name="val"/>
                     <jsp:param value="first page" name="page"/>
                  </jsp:include>   
               <%
               }else if(value.equals("info")){
                  /* out.println("인포 인포 인포"); */
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