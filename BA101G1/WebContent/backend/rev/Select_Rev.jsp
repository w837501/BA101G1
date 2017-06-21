<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.rev.model.RevenueService"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Group1 Revenue</title>
</head>
<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><h3>Group1 Manager: Home</h3> <font color=red>( MVC )</font></td>
		</tr>
	</table>

	<p>This is the Home page for Group1 Rev: Home</p>

	<h3>查詢</h3>

	<c:if test="${not empty errorMsgs }">
		<font color='red'>修正以下錯誤
			<ul>
				<c:forEach var="message" items="${errorMsgs }">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</font>
	</c:if>
	<ul>
		<li><a href="ListAllRev.jsp">List</a> all Revenue</li>
		<br>
		<br>

		<li>
			<form action="rev.do" method="post">
				<b>輸入商家編號(STO-000001):</b> <input type="text" name="store_id" value="STO-000001">
				<input type="submit" value="送出"> 
				<input type="hidden"name="action" value="getStore_For_Display">
			</form>
		</li>
			<jsp:useBean id="revSvc" scope="page" class="com.rev.model.RevenueService"></jsp:useBean>
		<li>
			<form method="post" action="rev.do">
				<b>選擇商家編號:</b> <select size="1" name="store_id">
					<c:forEach var="RevenueVO" items="${revSvc.singleStore_id }">
						<option value="${RevenueVO.store_id }">${RevenueVO.store_id}</option>
					</c:forEach>
				</select> 
					<input type="submit" value="送出"> 
					<input type="hidden" name="action" value="getStore_For_Display">
			</form>
		</li>
		<li>
			<form action="rev.do" method="post">
				<b>輸入月份:</b> <select name="revenue_month">
					<option value='1'>1</option>
					<option value='2'>2</option>
					<option value='3'>3</option>
					<option value='4'>4</option>
					<option value='5'>5</option>
					<option value='6'>6</option>
					<option value='7'>7</option>
					<option value='8'>8</option>
					<option value='9'>9</option>
					<option value='10'>10</option>
					<option value='11'>11</option>
					<option value='12'>12</option>
				</select> 
					<input type="submit" value="送出"> 
					<input type="hidden" name="action" value="getMonth_For_Display">
			</form>
		</li>
		<li>
			<form action="rev.do" method="post">
				<b>輸入月份及商家編號:</b> 
				<select size="1" name="store_id">
					<c:forEach var="RevenueVO" items="${revSvc.singleStore_id }">
						<option value="${RevenueVO.store_id }">${RevenueVO.store_id}</option>
					</c:forEach>
				</select> 
				<select name="revenue_month">
					<option value='1'>1</option>
					<option value='2'>2</option>
					<option value='3'>3</option>
					<option value='4'>4</option>
					<option value='5'>5</option>
					<option value='6'>6</option>
					<option value='7'>7</option>
					<option value='8'>8</option>
					<option value='9'>9</option>
					<option value='10'>10</option>
					<option value='11'>11</option>
					<option value='12'>12</option>
				</select> 
					<input type="submit" value="送出"> 
					<input type="hidden" name="action" value="getOne_For_Display">
			</form>
		</li>
		
	</ul>
	<h3>管理</h3>
		<ul>
			<li><a href="AddRev.jsp">ADD</a> a new Rev</li>
		</ul>
		
</body>
</html>