<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ page import="com.man.model.*"%>
<%
ManagerVO managerVO=(ManagerVO)request.getAttribute("managerVO");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>���u���</title>
</head>
<body bgcolor='white'>

<table border='1' cellpadding="5" cellspacing="0" width='600'>
	<tr bgcolor='#CCF' align='center' valign='middle' height='20'>
	<td>
	<h3>���u���</h3>	
	<a href="select_man.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����	</a>
	</td>
	</tr>
</table>

<table border='1' bordercolor='#CCF' width='600'>
	<tr>
		<th>�޲z���s��</th>
		<th>�޲z���W�r</th>
		<th>�޲z���q��</th>
		<th>�K�X</th>
		<th>�H�c</th>
	</tr>
	<tr align='center' valign='middle'>
		<td><%=managerVO.getMan_id() %></td>
		<td><%=managerVO.getMan_name() %></td>
		<td><%=managerVO.getMan_phone() %></td>
		<td><%=managerVO.getMan_pw() %></td>
		<td><%=managerVO.getMan_mail() %></td>
	</tr>
</table>
</body>
</html>