<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.rev.model.*"%>
<%
	RevenueVO revenueVO=(RevenueVO)request.getAttribute("revenueVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>ADD here</title>
</head>
<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='500'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><h3>月營業額資料新增 - AddRev.jsp</h3></td>
			<td><a href="Select_Rev.jsp"><img src="images/tomcat.gif"	width="100" height="100" border="1"> 回首頁 </a></td></tr></table>

<h4>營業額資料:<font color=red><b>*</b></font>為必填欄位</h4>
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
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/rev/rev.do" name="form1">
<table border="0">
	<tr>
		<td>商家編號:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="store_id" size="45" 
			value="<%= (revenueVO==null)? "STO-000001" :revenueVO.getStore_id() %>" /></td>
		
	</tr>
	<tr>
		<td>月份:<font color=red><b>*</b></font></td>
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
	</tr>
	<tr>
		<td>管理員編號:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="man_id" size="45"
			 value="<%= (revenueVO==null)? "MAN-000003" :revenueVO.getMan_id() %>" /></td>
	</tr>
	<tr>
		<td>月營業額:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="store_revenue" size="45"
			 value="<%= (revenueVO==null)? "602120" :revenueVO.getStore_revenue() %>" /></td>
	</tr>
	
	</table>
	<br>
		<input type="hidden" name="action" value="insert">
		<input type="submit" value="送出新增"></FORM>
</body>
</html>