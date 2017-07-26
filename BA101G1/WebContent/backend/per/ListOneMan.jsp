<%@ page import="com.man.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.permission.model.*" %>   
<%@ page import="com.permission_ability.model.*" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%
	String user = (String)request.getAttribute("user");
	pageContext.setAttribute("user", user);

	PermissionService pSvc = new PermissionService();
	List<PermissionVO> list = pSvc.getAll();
	pageContext.setAttribute("list", list);
	
	ManagerService mSvc = new ManagerService();
	ManagerVO mVO = mSvc.getOneMan(user);
	pageContext.setAttribute("mVO", mVO);
	
%>
<jsp:useBean id="paSvc" scope="page" class="com.permission_ability.model.PermissionAbilityDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>列出單一管理員權限資料</title>
</head>
	<hr style="border-color: red;">
	
	<table class="table table-hover">
		<tr align='center' valign='middle' >
			<th>管理員編號 - name</th>
			<th>權限編號 - 名稱</th>
			<th></th>
		</tr>
		<c:forEach var="PermissionVO" items="${list}">
			<tr align='center' valign='middle' >
				<c:if test="${user eq PermissionVO.man_id}">
<%-- 						<c:forEach var="manVO" items="listman"> --%>
<%-- 							<c:if test="${user eq manVO.man_id}"> --%>
					<td><c:if test="${user eq (mVO.man_id)}">【${user} - ${mVO.man_name}】</c:if></td>
<%-- 							</c:if> --%>
<%-- 						</c:forEach> --%>
					<td>
						<c:forEach var="Permission_AbilityVO" items="${paSvc.all}">
		                    <c:if test="${PermissionVO.pa_id==Permission_AbilityVO.pa_id}">
			                    	【${Permission_AbilityVO.pa_id } - ${Permission_AbilityVO.pa_name}】
		                    </c:if>
		                </c:forEach>
					</td>

					<td>
						<form method="post" action="<%=request.getContextPath()%>/backend/per/p.do">
							<input type="submit" value="刪除">
							<input type="hidden" name="man_id" value="${manVO.man_id }">
							<input type="hidden" name="pa_id" value="${PermissionVO.pa_id }">
							<input type="hidden" name="action" value="delete">
							<input type="hidden" name="iswhich" value="drop">
						</form>	
					</td>
				</c:if>
	
			</tr>
		</c:forEach>
	</table>
</body>
</html>