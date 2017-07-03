<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.product.model.*"%>
<html>
<head><title>PRODUCT CLASS</title></head>
<body bgcolor='white'>



<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>PRODUCT CLASS</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

<p>PRODUCT CLASS</p>

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
        <input type="hidden" name="action" value="getproduct_a">
    </FORM>
  </li>
</ul>

<jsp:useBean id="pcSvc" scope="page" class="com.product_class.model.ProductClassService" />

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>圖片</th>
		<th>商品類型</th>
	</tr>
	
	<c:forEach var="pcVO" items="${pcSvc.all}" varStatus="loop">
		<tr align='center' valign='middle'>
			<td></td>
			<td><a href='<%=request.getContextPath()%>/product/product.do?action=getProductClass&pc_id=${pcVO.pc_id}'>${pcVO.pc_name}</a></td>
		</tr>
	</c:forEach>
</table>

</body>
</html>
