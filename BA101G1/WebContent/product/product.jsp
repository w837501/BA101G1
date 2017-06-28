<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>PRODUCT</title></head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>PRODUCT</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

<p>PRODUCT</p>

<h3>餐點查詢:</h3>
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
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do" >
        <b>輸入餐點關鍵字:</b>
        <input type="text" name="pro_name">
        <input type="submit" value="送出">
        <input type="hidden" name="action" value="getproduct_b">
    </FORM>
  </li>
</ul>
 
<%if (request.getAttribute("productlist")!=null){%>
       <jsp:include page="/product/listSearchProduct.jsp" />
<%} %>

</body>
</html>
