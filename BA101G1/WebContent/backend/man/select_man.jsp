<%@page import="com.man.model.ManagerService"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Group1 Manager</title>
</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>Group1 Manager: Home</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

<p>This is the Home page for Group1 Man: Home</p>

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
	<li><a href="ListAllMan.jsp">List</a> all Manager </li> <br><br>

	<li>
		<form action="emp.do" method="post">
			<b>輸入管理員編號(MAN-000001):</b>
			<input type="text" name="empno">
			<input type="submit" value="送出">
			<input type="hidden" name="action" value="getOne_For_Display">
		</form>
	</li>

	<jsp:useBean id="manSvc" scope="page" class="com.man.model.ManagerService"></jsp:useBean>

	<li>
		<form action="man.do" method="post">
			<b>選擇管理員編號:</b>
			<select size="1" name="man_id">
				<c:forEach var="ManagerVO" items="${manSvc.all }">
					<option value="${ManagerVO.man_id}">${ManagerVO.man_id}
				</c:forEach>
			</select>
			<input type="submit" value="送出">
			<input type="hidden" name="action" value="getOne_For_Display">
		</form>
	</li>

	<li>
		<Form method="post" action="man.do">
			<b>選擇員工姓名:</b>
			<select size="1" name="man_id">
				<c:forEach var="ManagerVO" items="${manSvc.all}">
					<option value="${ManagerVO.man_id }">${ManagerVO.man_name}
				</c:forEach>
			</select>
			<input type="submit" value="送出">
			<input type="hidden" anme="action" value="getOne_For_Display">
		</Form>	
	</li>
</ul>
<h3>管理員管理</h3>
	<ul>
		<li><a href='addMan.jsp'>ADD</a>a new Man.</li>
	</ul>

</body>
</html>