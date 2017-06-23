<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.store_report.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>
	---${param.empno}----
<%
	StoreReportService srSvc = new StoreReportService();
	List<StoreReportVO> list = srSvc.getAll();
	pageContext.setAttribute("list",list);
%>
<%-- <jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" /> --%>

<html>
<head>
<title>所有商家檢舉資料 - listAllSR.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 EL 的寫法取值:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>所有商家檢舉資料 - ListAllSR.jsp</h3>
		<a href="<%=request.getContextPath()%>/backend/str/select_page.jsp"><img src="/BA101G1/backend/str/images/back1.gif" width="100" height="32" border="0">回首頁</a>
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
		<th>商家檢舉單號</th>
		<th>商家編號</th>
		<th>評論編號</th>
		<th>訂單編號</th>
		<th>管理員編號</th>
		<th>檢舉內容</th>
		<th>檢舉圖片</th>
		<th>檢舉時間</th>
		<th>檢舉審核狀態</th>
		<th>檢舉結果</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="pages/page1.file" %> 
	<c:forEach var="srVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ${(srVO.sr_id==param.sr_id) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
			<td>${srVO.sr_id}</td>
			<td>${srVO.store_id}</td>
			<td>${srVO.sc_id}</td>
			<td>${srVO.order_id}</td>
			<td>${srVO.man_id}</td>
			<td>${srVO.sr_content}</td>			
			<td>${srVO.sr_image}</td>			
			<td>${srVO.sr_time}</td>			
			<td>${srVO.sr_state}</td>			
			<td>${srVO.sr_result}</td>			

			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store_report/store_report.do">
			     <input type="submit" value="修改"> 
			     <input type="hidden" name="sr_id" value="${srVO.sr_id}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			    <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--送出當前是第幾頁給Controller-->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store_report/store_report.do">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="sr_id" value="${srVO.sr_id}">
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
