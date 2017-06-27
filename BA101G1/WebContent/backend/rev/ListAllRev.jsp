<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.rev.model.*" %>
<%@ page import="java.util.*" %>
<% 
	RevenueService revSvc=new RevenueService();
	List<RevenueVO> list=revSvc.getAll();
	pageContext.setAttribute("list1",list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>所有資料</title>
</head>
<body bgcolor='white'>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>所有營業資料 - ListAllMemRev.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
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

<table border='1' bordercolor='#ccf' width='600'>
	<tr>
		<th>商家編號</th>
		<th>月份</th>
		<th>管理員編號</th>
		<th>營業額</th>
		<th>狀態</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="page1.file" %>	
	<c:forEach var="RevenueVO" items="${list1}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1 %>">
		<tr align='center' valign='middle'>
			<td>${RevenueVO.store_id } </td>
			<td>${RevenueVO.revenue_month }</td>
			<td>${RevenueVO.man_id }</td>
			<td>${RevenueVO.store_revenue }</td>
			<td>${RevenueVO.state }</td> 
			<td>
				<form method="post" action="<%=request.getContextPath() %>/backend/rev/rev.do">
					<input type="submit" value="修改">
					<input type="hidden" name="store_id" value="${RevenueVO.store_id }">
					<input type="hidden" name="revenue_month" value="${RevenueVO.revenue_month }">
					<input type="hidden" name="requestURI" value="<%= request.getRequestURI()%>">					
					<input type="hidden" name="action" value="getOne_For_Update">
				</form>
			</td>
			<td>
				<form method="post" action="<%=request.getContextPath() %>/backend/rev/rev.do">
					<input type="submit" value="刪除">
					<input type="hidden" name="store_id" value="${RevenueVO.store_id }">
					<input type="hidden" name="revenue_month" value="${RevenueVO.revenue_month }">
					<input type="hidden" name="action" value="delete">
				</form>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/rev/rev.do">
			    <input type="submit" value="送出商家查詢"> 
			    <input type="hidden" name="store_id" value="${RevenueVO.store_id}">
			    <input type="hidden" name="revenue_month" value="${RevenueVO.revenue_month }">
			    <input type="hidden" name="action" value="getOne_For_Display">
			    </FORM>
			</td>
			
	</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>	

<form action="rev.do" method="post">
<td>選擇月份:</td>
<td><select name="revenue_month">
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
				</select> </td>

<input type="submit" value="送出"> 
<input type="hidden" name="action" value="getMonth_For_Display">
</form>


<%if (request.getAttribute("oneList")!=null){%>
       <jsp:include page="/backend/rev/ListOneRev.jsp" />
<%} %>


</body>
</html>