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
<title>�|�����</title>
</head>
<body>
	<ul>
		<li>�|���s���G<%=memberVO.getMem_id() %></li>
		<li>�|���m�W�G<%=memberVO.getMem_name() %></li>
		<li>�|���q�ܡG<%=memberVO.getMem_phone() %></li>
		<li>�|���K�X�G<%=memberVO.getMem_pw() %></li>
		<li>�|���H�c�G<%=memberVO.getMem_mail() %></li>
	</ul>
</body>
</html>