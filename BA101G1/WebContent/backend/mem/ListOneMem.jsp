<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mem.model.*" %>
<%
	MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>會員資料</title>
</head>
<body>
	<ul>
		<li>會員編號：<%=memberVO.getMem_id() %></li>
		<li>會員姓名：<%=memberVO.getMem_name() %></li>
		<li>會員電話：<%=memberVO.getMem_phone() %></li>
		<li>會員密碼：<%=memberVO.getMem_pw() %></li>
		<li>會員信箱：<%=memberVO.getMem_mail() %></li>
	</ul>
</body>
</html>