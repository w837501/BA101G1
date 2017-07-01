<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>IBM Order: Home</title></head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>IBM Order: Home</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

<p>This is the Home page for IBM Order: Home</p>

<h3>資料查詢:</h3>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
  <font color='red'>請修正以下錯誤:
  <ul>
  <c:forEach var="message" items="${errorMsgs}">
    <li>${message}</li>
  </c:forEach>
  </ul>
  </font>
</c:if>

<ul>

  
  <li>
    <FORM METHOD="post" ACTION="order.do" >
        <b>輸入會員編號 :</b>
        <input type="text" name="mem_id">
        <input type="submit" value="送出">
        <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>
   <li>
    <FORM METHOD="post" ACTION="order.do" >
        <b>查詢未確認訂單 :</b>
        <input type="submit" value="送出">        
        <input type="hidden" name="order_state" value="未確認">
        <input type="hidden" name="action" value="getOrder_State">
    </FORM>
  </li>
   <li>
    <FORM METHOD="post" ACTION="order.do" >
        <b>查詢已確認訂單 :</b>
        <input type="submit" value="送出">        
        <input type="hidden" name="order_state" value="已確認">
        <input type="hidden" name="action" value="getOrder_State">
    </FORM>
  </li>

</ul>

</body>

</html>
