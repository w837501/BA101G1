<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.rev.model.*" %>
<%
String month=request.getParameter("month");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>資料 here</title>
</head>
<body bgcolor='white'>
<table border='1' cellpadding='5' cellspacing='0' width='600'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>ListStore_OrderRevenue.jsp</h3>
		<a href="Select_Rev.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
	
	<table border='1' bordercolor='#ccf' width='600'>
	<tr>
		<th>商家編號</th>
		<th>月份</th>
		<th>營業額</th>
		
	</tr>
	
	<c:forEach var="Store_OrderVO" items="${revenueList}">
		<tr align='center' valign='middle'>
			<td>${Store_OrderVO.store_id } </td>
			<td><%=month %></td>
			<td>${Store_OrderVO.sum_totalprice }</td>
			
			<td><form method="post" action="<%=request.getContextPath() %>/backend/rev/rev.do">
					<input type="submit" value="新增">
					<input type="hidden" name="store_id" value="${Store_OrderVO.store_id }">
					<input type="hidden" name="revenue_month" value="<%=month %>">
					<input type="hidden" name="store_revenue" value="${Store_OrderVO.sum_totalprice }">
					<input type="hidden" name="action" value="revenueinsert">
				</form></td>
	</tr>
	</c:forEach>
</table>
</table>


</body>
</html>