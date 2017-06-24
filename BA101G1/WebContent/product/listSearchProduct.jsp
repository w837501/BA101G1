<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 此頁練習採用 Script 的寫法取值 --%>
<%--
	ProductService proSvc1=new ProductService();
	String pro_name=(String)request.getAttribute("pro_name");
	List<ProductVO> list=proSvc1.getName(pro_name);
--%>
<%-- 取出 Concroller EmpServlet.java已存入request的EmpVO物件--%>
<%--  <%List<ProductVO> productVO = (List) request.getAttribute("productlist");%>--%>
<jsp:useBean id="proSvc" scope="page" class="com.product.model.ProductService" />

<html>
<head>
<title>商品查詢結果 - listOnePro.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 Script 的寫法取值:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>商品查詢結果 - listOnePro.jsp</h3>
		<a href="<%=request.getContextPath()%>/index.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>商品編號</th>
		<th>商家編號</th>
		<th>商品名稱</th>
		<th>價格</th>
		<th>圖片</th>
		<th>商品類型</th>
		<th>說明</th>
	</tr>
	
	<c:forEach var="product" items="${productlist}">
		<tr align='center' valign='middle'>
			<td>${product.pro_id}</td>
			<td>${product.store_id}</td>
			<td>${product.pro_name}</td>
			<td>${product.pro_price}</td>
			<td>${product.pro_image}</td>
			<td>${product.pro_type}</td>
			<td>${product.pro_content}</td>
		<tr>
	</c:forEach>
	
</table>

</body>
</html>
