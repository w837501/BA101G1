<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		    <link href="<%=request.getContextPath() %>/backend/assets/css/bootstrap.css" rel="stylesheet" />
<title>所有會員資料</title>
</head>
<body bgcolor='white'>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>所有會員資料 - ListAllMem.jsp</h3>
		<a href="select_mem.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>
<!-- ****************** -->
<h1 class="text-center">哈囉～哩後！</h1>
		
		<div class="panel panel-danger">
		  <div class="panel-heading">
		    <h3 class="panel-title">標題</h3>
		  </div>
		  <div class="panel-body">
		    內容文字
		  </div>
		</div>
<!-- ****************** -->
<c:if test="${not empty errorMsgs }">
	<font color='red'>修正以下錯誤
	<ul>
		<c:forEach var="message" items="${errorMsgs }">
			<li>${message }</li>
		</c:forEach>
	</ul>	
	</font>
</c:if>	

<table border='1' bordercolor='#ccf' width='800'>
	<tr>
		<th>會員編號</th>
		<th>會員姓名</th>
		<th>會員電話</th>
		<th>會員編密碼</th>
		<th>會員編信箱</th>
		<th>修改</th>
		<th>刪除</th>
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
				<form method="post" action="mem.do">
					<input type="submit" value="修改">
					<input type="hidden" name="mem_id" value="${MemberVO.mem_id }">
					<input type="hidden" name="action" value="getOne_For_Update">
				</form>
			</td>
			<td>
				<form method="post" action="<%=request.getContextPath() %>/backend/mem/mem.do">
					<input type="submit" value="刪除">
					<input type="hidden" name="mem_id" value="${MemberVO.mem_id }">
					<input type="hidden" name="action" value="delete">
				</form>
			</td>
		</tr>
	</c:forEach>
</table>
<ul class="pager">
	<%@ include file="page2.file" %>
</ul>



					<ul class="pager">
					  <li><a href="#">上一頁</a></li>
					  <li><a href="#">下一頁</a></li>
					</ul>

</body>
</html>