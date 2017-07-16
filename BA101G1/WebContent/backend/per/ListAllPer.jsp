<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.permission.model.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	PermissionService pSvc = new PermissionService();
	List<PermissionVO> list = pSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<jsp:useBean id="paDAO" scope="page" class="com.permission_ability.model.PermissionAbilityDAO" />
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
		<th>管理員編號</th>
		<th>權限編號 - 名稱</th>
	</tr>
	<c:forEach var="PermissionVO" items="${list}">
		<tr align='center' valign='middle' >
			<td>${PermissionVO.man_id }</td>
			<td>
				<c:forEach var="Permission_AbilityVO" items="${paDAO.all}">
                    <c:if test="${PermissionVO.pa_id==Permission_AbilityVO.pa_id}">
	                    	【${PermissionVO.pa_id } - ${Permission_AbilityVO.pa_name}】
                    </c:if>
                </c:forEach>
			</td>


		</tr>
	</c:forEach>
</table>

</body>
</html>