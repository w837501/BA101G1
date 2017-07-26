<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.permission_ability.model.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	PermissionAbilityService paSvc = new PermissionAbilityService();
	List<Permission_AbilityVO> list = paSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<html>
<head>
<title>List All Man</title>
<link href="<%=request.getContextPath() %>/backend/assets/css/custom.css" rel="stylesheet" />
</head>
<hr style="border-color: red;">
<table border='1' bordercolor='#CCF' width='600'>
	<tr>
		<th>權限編號</th>
		<th>權限名稱</th>
	</tr>
	<c:forEach var="Permission_AbilityVO" items="${list}">
		<tr align='center' valign='middle' ${(Permission_AbilityVO.pa_id==param.pa_id) ? 'style="background-color:#84d8d1;"':''}}>
			<td style="color:blue;">${Permission_AbilityVO.pa_id }</td>
			<td>${Permission_AbilityVO.pa_name }</td>
		</tr>
	</c:forEach>
</table>

</body>
</html>