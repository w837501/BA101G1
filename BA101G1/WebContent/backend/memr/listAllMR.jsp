<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member_report.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>
	---${param.empno}----
<%
MemberReportService mrSvc = new MemberReportService();
	List<MemberReportVO> list = mrSvc.getAll();
	pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>所有會員檢舉資料 - listAllMR.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 EL 的寫法取值:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>所有會員檢舉資料 - ListAllMR.jsp</h3>
		<a href="<%=request.getContextPath()%>/backend/memr/select_page.jsp"><img src="<%=request.getContextPath()%>/backend/memr/images/back1.gif" width="100" height="32" border="0">回首頁</a>
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
		<th>會員檢舉單號</th>
		<th>會員編號</th>
		<th>訂單編號</th>
		<th>評論編號</th>
		<th>管理員編號</th>
		<th>檢舉內容</th>
		<th>檢舉圖片</th>
		<th>檢舉時間</th>
		<th>審核狀態</th>
		<th>檢舉結果</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<c:forEach var="mrVO" items="${list}" >
		<tr align='center' valign='middle' ${(mrVO.mr_id==param.mr_id) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
			<td>${mrVO.mr_id}</td>
			<td>${mrVO.mem_id}</td>
			<td>${mrVO.order_id}</td>
			<td>${mrVO.sc_id}</td>
			<td>${mrVO.man_id}</td>
			<td>${mrVO.mr_content}</td>
			<td>${mrVO.mr_image}</td>
			<td>${mrVO.mr_time}</td>
			<td>${mrVO.mr_state}</td>
			<td>${mrVO.mr_result}</td>			

			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member_report/member_report.do">
			     <input type="submit" value="修改"> 
			     <input type="hidden" name="mr_id" value="${mrVO.mr_id}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member_report/member_report.do">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="mr_id" value="${mrVO.mr_id}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>

<br>本網頁的路徑:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
</body>
</html>
