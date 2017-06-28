<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.man.model.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	ManagerService manSvc=new ManagerService();
	List<ManagerVO> list=manSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<html>
<head>
<title>List All Man</title>
</head>

<body bgcolor='white'>
<b><font color=red>EL</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#ccf' align='center' valign='middle' height='20'>
		<td>
		<h3>所有管理員資料-ListAllMan</h3>
		<a href="select_man.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>

<c:if test="${not empty errorMsgs }">
	<font color='red'>以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message }</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<table border='1' bordercolor='#CCF' width='800'>
	<tr>
		<th>管理員編號</th>
		<th>管理員名字</th>
		<th>管理員電話</th>
		<th>密碼</th>
		<th>信箱</th>
	</tr>
	<%@ include file="page1.file" %>
	<c:forEach var="ManagerVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1 %>">
		<tr align='center' valign='middle' ${(ManagerVO.man_id==param.man_id) ? 'bgcolor=#CCCCFF':''}>
			<td>${ManagerVO.man_id }</td>
			<td>${ManagerVO.man_name }</td>
		    <td>${ManagerVO.man_phone }</td>
		    <td>${ManagerVO.man_pw }</td>
		    <td>${ManagerVO.man_mail }</td>
			<td>
				<form method="post" action="<%=request.getContextPath()%>/backend/man/man.do">
					<input type="submit" value="修改">
					<input type="hidden" name="man_id" value="${ManagerVO.man_id }">
					<input type="hidden" name="action" value="getOne_For_Update">
				</form>	
			</td>
			<td>
				<form method="post" action="<%=request.getContextPath()%>/backend/man/man.do">
					<input type="submit" value="刪除">
					<input type="hidden" name="man_id" value="${ManagerVO.man_id }">
					<input type="hidden" name="action" value="delete">
				</form>	
			</td>
			</tr>
	</c:forEach>
</table>
	<%@ include file="page2.file" %>

</body>
</html>