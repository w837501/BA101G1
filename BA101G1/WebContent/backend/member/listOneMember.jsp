<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mem.model.*" %>
<%
	MemberVO memberVO=(MemberVO)request.getAttribute("memberVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>會員資料</title>
</head>
<body bgcolor="white">

<a href="<%=request.getContextPath()%>/backend/mem/select_mem.jsp">會員</a>
<a href="<%=request.getContextPath()%>/backend/news/news_index.jsp">最新消息</a>
<a href="<%=request.getContextPath()%>/backend/rev/Select_Rev.jsp">商家月結</a>
<a href="<%=request.getContextPath()%>/backend/store/store_index.jsp">商家</a>
<a href='<%=request.getContextPath()%>/backend/store_class/listAllStoreClass.jsp'>商家類別</a> 
<a href="<%=request.getContextPath()%>/backend/store_commit/store_commit_index.jsp">商家評價</a>

<table border='1' cellpadding='5' cellspacing='0' width='600'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>員工資料 - ListOneEmp.jsp</h3>
		<a href="select_mem.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>
<table border='1' bordercolor='#ccf' width='600'>
	<tr>
		<th>會員編號</th>
		<th>會員姓名</th>
		<th>會員電話</th>
		<th>會員編密碼</th>
		<th>會員編信箱</th>
		
	</tr>
	<tr align='center' valign='middle'>
			<td><%=memberVO.getMem_id() %> </td>
			<td><%=memberVO.getMem_name() %></td>
			<td><%=memberVO.getMem_phone() %></td>
			<td><%=memberVO.getMem_pw() %></td>
			<td><%=memberVO.getMem_mail() %></td>
	</tr>
</table>


</body>
</html>