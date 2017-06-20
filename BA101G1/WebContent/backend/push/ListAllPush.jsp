<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.push.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>
	---${param.push_id}----
<%
	PushService pushSvc = new PushService();
	List<PushVO> list = pushSvc.getAll();
	pageContext.setAttribute("list",list);
%>
<jsp:useBean id="pushSvc1" scope="page" class="com.push.model.PushService" />

<html>
<head>
<title>所有推播資料 - listAllPush.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 EL 的寫法取值:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>所有推播資料 - ListAllPush.jsp</h3>
		<a href="<%=request.getContextPath()%>/backend/push/select_page.jsp"><img src="/BA101G1/backend/man/images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>推播編號</th>
		<th>管理員編號</th>
		<th>推播內容</th>
		<th>推播時間</th>
		<th>最新消息編號</th>
		<th>廣告編號</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="pages/page1.file" %> 
	<c:forEach var="empVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ${(pushVO.push_id==param.push_id) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
			<td>${pushVO.push_id}</td>
			<td>${pushVO.man_id}</td>
			<td>${pushVO.push_content}</td>
			<td>${pushVO.push_time}</td>
			<td>${pushVO.news_id}</td>
			<td>${pushVO.ad_id}</td>			

			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/push/push.do">
			     <input type="submit" value="修改"> 
			     <input type="hidden" name="push_id" value="${pushVO.push_id}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			    <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--送出當前是第幾頁給Controller-->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/push/push.do">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="push_id" value="${pushVO.push_id}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			    <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--送出當前是第幾頁給Controller-->
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="pages/page2.file" %>

<br>本網頁的路徑:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
</body>
</html>
