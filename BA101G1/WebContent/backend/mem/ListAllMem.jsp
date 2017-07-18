j<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mem.model.*" %>
<%@ page import="java.util.*" %>
<%
	MemberService memSvc=new MemberService();
	List<MemberVO> list=memSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>�Ҧ����u���</title>
</head>
<body bgcolor='white'>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ҧ����u��� - ListAllMem.jsp</h3>
		<a href="select_mem.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

<c:if test="${not empty errorMsgs }">
	<font color='red'>�ץ��H�U���~
	<ul>
		<c:forEach var="message" items="${errorMsgs }">
			<li>${message }</li>
		</c:forEach>
	</ul>	
	</font>
</c:if>	

<table border='1' bordercolor='#ccf' width='800'>
	<tr>
		<th>�|���s��</th>
		<th>�|���m�W</th>
		<th>�|���q��</th>
		<th>�|���s�K�X</th>
		<th>�|���s�H�c</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<%@ include file="page1.file" %>	
	<c:forEach var="MemberVO" items="${list }" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1 %>">
		<tr align="center" valign="middle" ${(MemberVO.mem_id==param.mem_id) ? 'bgcolor=#CCCCFF':''}>
			<td>${MemberVO.mem_id }</td>
			<td>${MemberVO.mem_name }</td>
			<td>${MemberVO.mem_phone }</td>
			<td>${MemberVO.mem_pw }</td>
			<td>${MemberVO.mem_mail }</td>
			<td>
				<form method="post" action="<%=request.getContextPath() %>/backend/mem/mem.do">
					<input type="submit" value="�ק�">
					<input type="hidden" name="mem_id" value="${MemberVO.mem_id }">
					<input type="hidden" name="action" value="getOne_For_Update">
				</form>
			</td>
			<td>
				<form method="post" action="<%=request.getContextPath() %>/backend/mem/mem.do">
					<input type="submit" value="�R��">
					<input type="hidden" name="mem_id" value="${MemberVO.mem_id }">
					<input type="hidden" name="action" value="delete">
				</form>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>
</body>
</html>