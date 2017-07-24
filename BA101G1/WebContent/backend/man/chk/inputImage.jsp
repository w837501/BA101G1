  <%@page contentType="text/html" pageEncoding="UTF-8"%>

  
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>認證碼輸入頁面</title>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
  
  
    <form method="post" action="check.jsp" name="insImg">
      系統產生的認證碼：<img src="newImage.jsp" alt="New Image"/><br>
      輸入上面的認證碼：<input type="text" name="insrand" maxlength="4"/><br>
      <input type="submit" value="Submit">
    </form>