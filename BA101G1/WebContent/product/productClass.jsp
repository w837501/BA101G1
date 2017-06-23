<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.product.model.*"%>
<html>
<head><title>IBM Emp: Home</title></head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>IBM Emp: Home</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

<p>This is the Home page for IBM Emp: Home</p>

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
        <input type="hidden" name="action" value="get_product">
    </FORM>
  </li>
</ul>

<jsp:useBean id="proSvc" scope="page" class="com.product.model.ProductService" />

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>圖片</th>
		<th>商品類型</th>
	</tr>
	
	<c:forEach var="proVO" items="${proSvc.all}">
		<tr align='center' valign='middle'>
			<td></td>
			<td><a href='<%=request.getContextPath()%>/product/product.do?action=get_type&pro_type='>${proVO.pro_type}</a></td>
		</tr>
	</c:forEach>
</table>

</body>
</html>
