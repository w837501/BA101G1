<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@page import="com.mem.model.MemberService"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Group1 Member</title>
</head>
<body bgcolor='white'>
<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>Group1 Member: Home</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

<p>This is the Home page for Group1 Man: Home</p>

<h3>查詢</h3>
<c:if test="${not empty errorMsgs }">
	<font color='red'>修正以下錯誤
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
	</c:if>
	
<ul>
	<li><a href="ListAllMem.jsp">List</a> all Manager</li><br><br>
	
	<li>
		<form action="mem.do" method="post">
			<b>輸入會員編號(MEM-000001):</b>
			<input type="text" name="mem_id">
			<input type="submit" value="送出">
			<input type="hidden" name="action" value="getOne_For_Display">
		</form>
	</li>

	<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemberService"></jsp:useBean>

	<li>
		<form action="mem.do" method="post">
			<b>選擇會員編號:</b>
			<select size="1" name="mem_id">
				<c:forEach var="MemberVO" items="${memSvc.all }">
					<option value="${MemberVO.mem_id }">${MemberVO.mem_id }</option>
				</c:forEach>
			</select>
			<input type="submit" value="送出">
			<input type="hidden" name="action" value="getOne_For_Display">
		</form>
	</li>
	
	<li>
		<form method="post" action="mem.do">
			<b>選擇員工姓名:</b>
			<select size="1" name="mem_id">
				<c:forEach var="MemberVO" items="${memSvc.all }">
					<option value="${MemberVO.mem_id }">${MemberVO.mem_name}</option>
				</c:forEach>
			</select>
			<input type="submit" value="送出">
			<input type="hidden" name="action" value="getOne_For_Display">
		</form>
	</li>
</ul>	
	<h3>會員管理</h3>
		<ul>
			<li><a href="AddMem.jsp">ADD</a> a new Mem</li>
		</ul>
</body>
</html>