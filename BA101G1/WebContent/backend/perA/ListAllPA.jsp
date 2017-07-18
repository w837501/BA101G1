<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.permission_ability.model.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	PermissionAbilityDAO dao = new PermissionAbilityDAO();
	List<Permission_AbilityVO> list=dao.getAll();
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

<table border='1' bordercolor='#CCF' width='800'>
	<tr>
		<th>權限編號</th>
		<th>權限名稱</th>
	</tr>
	<c:forEach var="Permission_AbilityVO" items="${list}">
		<tr align='center' valign='middle' ${(Permission_AbilityVO.pa_id==param.pa_id) ? 'style="background-color:#84d8d1;"':''}}>
			<td>${Permission_AbilityVO.pa_id }</td>
			<td>${Permission_AbilityVO.pa_name }</td>


		</tr>
	</c:forEach>
</table>

</body>
</html>