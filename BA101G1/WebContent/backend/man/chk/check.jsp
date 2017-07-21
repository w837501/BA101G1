<%@page contentType="text/html" pageEncoding="UTF-8"%>

  
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>認證結果</title>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
  
  
    <%
 String rand = (String)session.getAttribute("rand");
 String input = request.getParameter("insrand");
%>
系統產生的認證碼為： <%= rand %><br>
您輸入的認證碼為： <%= input %><br>
<br>
  <%
    if (rand.equals(input)) {
  %>
    <font color=green>輸入相同，認證成功！</font>
  <%
    } else {
  %>
    <font color=red>輸入不同，認證失敗！</font>
  <%
    }
  %>