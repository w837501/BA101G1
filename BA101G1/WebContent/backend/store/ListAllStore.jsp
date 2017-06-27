<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.store.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	StoreService storeSvc = new StoreService();
	List<StoreVO> list = storeSvc.getAll();
	pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有員工資料 - listAllEmp.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 EL 的寫法取值:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>所有員工資料 - ListAllEmp.jsp</h3>
		<a href="<%=request.getContextPath()%>/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
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
		<th>商店編號</th>
		<th>商店名稱</th>
		<th>商店地址</th>
		<th>商店電話</th>
		<th>商店評價</th>
		<th>商店狀態</th>
		<th>商店圖片</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="pages/page1.file" %> 
	<c:forEach var="storeVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ><!--將修改的那一筆加入對比色而已-->
			<td>${storeVO.store_id}</td>
			<td>${storeVO.store_name}</td>
			<td>${storeVO.store_addr}</td>
			<td>${storeVO.store_phone}</td>
			<td>${storeVO.store_star}</td>
			<td>${storeVO.store_state}</td>			
			<td></td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do">
			     <input type="submit" value="修改"> 
			     <input type="hidden" name="store_id" value="${storeVO.store_id}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--送出當前是第幾頁給Controller-->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="empno" value="${storeVO.store_id}">
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
