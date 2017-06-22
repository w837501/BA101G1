<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>IBM Push: HomePage</title>
</head>
<body>
<p>This is the home page for IBM Push: Home </p>
<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCF align='center' valign='middle' height='20'>
		<td>
			<h3>IBM Push : Home</h3><font color=red>( MVC )</font>
		</td>
	</tr>
</table>
<p>This is the Home page for IBM Push : Home</p>
<h3>Push資料查詢  我改錯了QQ</h3>
<%-- 資料錯誤列表 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li>${message}</li>
			</c:forEach>
		</ul>
	</font>
</c:if>
<ul>
<li><a href='<%=request.getContextPath() %>/push/listAllPush.jsp'>List</a></li>
</body>
</html>