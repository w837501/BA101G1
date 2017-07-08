<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.product.model.*" %>
<%@ page import="java.util.*" %>
<% 
	ProductService productSvc=new ProductService();
	List<ProductVO> list=productSvc.getAll();
	pageContext.setAttribute("list",list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>ListAllProduct here</title>
</head>
<body bgcolor='white'>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>所有商品 - ListAllProduct.jsp</h3>
		<a href="index.jsp"><img src="${pageContext.request.contextPath}/images/logo.png" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>
<c:if test="${not empty errorMsgs }">
	<font color='red'>修正以下錯誤
	<ul>
		<c:forEach var="message" items="${errorMsgs }">
			<li>${message }</li>
		</c:forEach>
	</ul>	
	</font>
</c:if>	
	<jsp:useBean id="productclassSvc" scope="page" class="com.product_class.model.ProductClassService" />
<table border='1' bordercolor='#ccf' width='1200'>
	<tr>
		<th>商品編號</th>
		<th>商家編號</th>
		<th>商品名稱</th>
		<th>商品單價</th>
		<th>商品狀態</th>
		<th>商品圖片</th>
		<th>商品類型</th>
		<th>商品說明</th>
		<th>修改</th>
	</tr>
	<%@ include file="page1.file" %>	
	<c:forEach var="procudtVO" items="${list}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1 %>">
		<tr align='center' valign='middle' ${(procudtVO.pro_id==param.pro_id) ? 'bgcolor=#CCCCFF':''}>
			<td>${procudtVO.pro_id } </td>
			<td>${procudtVO.store_id }</td>
			<td>${procudtVO.pro_name }</td>
			<td>${procudtVO.pro_price }</td>
			<td>${procudtVO.pro_state }</td>
			<td><img src="<%=request.getContextPath()%>/ProDBGifReader?pro_id=${procudtVO.pro_id }" style="max-width: 150px; max-height: 150px;"></td>
			<td>${productclassSvc.getPC_Name(procudtVO.pc_id).pc_name }</td>
			<td>${procudtVO.pro_content }</td>
			<td>
				<form method="post" action="<%=request.getContextPath()%>/product/product.do">
					<input type="submit" value="修改">
					<input type="hidden" name="pro_id" value="${procudtVO.pro_id }">
					<input type="hidden" name="store_id" value="${procudtVO.store_id }">
					<input type="hidden" name="action" value="getOne_For_Update">
				</form>
			
			</td>
			</tr>
			</c:forEach>
			
</body>
</html>