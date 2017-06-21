<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.push.model.*"%>
<%
	PushVO pushVO = (PushVO) request.getAttribute("pushVO"); //PushServlet.java (Concroller), 存入req的pushVO物件 (包括幫忙取出的pushVO, 也包括輸入資料錯誤時的pushVO物件)
%>
<html>
<head>
<title>推播資料修改 - update_push_input.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>推播資料修改 - update_push_input.jsp</h3>
		<a href="<%=request.getContextPath()%>/backend/push/select_page.jsp"><img src="/BA101G1/backend/man/images/back1.gif" width="100" height="32" border="0">回首頁</a></td>
	</tr>
</table>

<h3>推播資料修改:</h3>
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

<FORM METHOD="post" ACTION="/push/push.do" name="form1">
<table border="0">
	<tr>
		<td>推播編號:<font color=red><b>*</b></font></td>
		<td><%=pushVO.getPush_id()%></td>
	</tr>
	<tr>
		<td>管理員編號:</td>
		<td><input type="TEXT" name="man_id" size="45" value="<%=pushVO.getMan_id()%>" /></td>
	</tr>
	<tr>
		<td>推播內容:</td>
		<td><input type="TEXT" name="push_content" size="45" value="<%=pushVO.getPush_content()%>" /></td>
	</tr>
	<tr>
		<td>推播時間:</td>
		<td bgcolor="#CCCCFF">
		    <input class="cal-TextBox"
			onFocus="this.blur()" size="9" readonly type="text" name="push_time" value="<%=pushVO.getPush_time()%>">
			<a class="so-BtnLink"
			href="javascript:calClick();return false;"
			onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);"
			onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);"
			onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','push_time','BTN_date');return false;">
		    <img align="middle" border="0" name="BTN_date"	src="images/btn_date_up.gif" width="22" height="17" alt="開始日期"></a>
		</td>
	</tr>
	<tr>
		<td>最新消息編號:</td>
		<td><input type="TEXT" name="news_id" size="45"	value="<%=pushVO.getNews_id()%>" /></td>
	</tr>
	<tr>
		<td>廣告編號:</td>
		<td><input type="TEXT" name="ad_id" size="45" value="<%=pushVO.getAd_id()%>" /></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="push_id" value="<%=pushVO.getPush_id()%>">
<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"><!--接收原送出修改的來源網頁路徑後,再送給Controller準備轉交之用-->
<input type="hidden" name="whichPage" value="<%=request.getParameter("whichPage")%>">  <!--只用於:istAllEmp.jsp-->
<input type="submit" value="送出修改"></FORM>

<br>送出修改的來源網頁路徑:<br><b>
   <font color=blue>request.getParameter("requestURL"):</font> <%= request.getParameter("requestURL")%><br>
   <font color=blue>request.getParameter("whichPage"):</font> <%= request.getParameter("whichPage")%> (此範例目前只用於:istAllEmp.jsp))</b>
</body>
</html>
