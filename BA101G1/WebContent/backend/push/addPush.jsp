<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.push.model.*"%>
<%
PushVO pushVO = (PushVO) request.getAttribute("pushVO");
%>

<html>
<head>
<title>推播資料新增 - addPush.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>推播資料新增 - addPush.jsp</h3>
		</td>
		<td>
		   <a href="<%=request.getContextPath()%>/backend/push/select_page.jsp"><img src="/BA101G1/backend/man/images/tomcat.gif" width="100" height="100" border="1">回首頁</a>
	    </td>
	</tr>
</table>

<h3>推播資料:</h3>
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
		<td>管理員編號:</td>
		<td><input type="TEXT" name="man_id" size="45" 
			value="<%= (pushVO==null)? "MAN-000001" : pushVO.getMan_id()%>" /></td>
	</tr>
	<tr>
		<td>推播內容:</td>
		<td><input type="TEXT" name="push_content" size="45"
			value="<%= (pushVO==null)? "今天麥當勞大薯買一送一" : pushVO.getPush_content()%>" /></td>
	</tr>
	<tr>
		<%java.sql.Timestamp date_SQL = new java.sql.Timestamp(System.currentTimeMillis());%>
		<td>推播時間:</td>
		<td bgcolor="#CCCCFF">
		    <input class="cal-TextBox"
			onFocus="this.blur()" size="9" readonly type="text" name="push_time" value="<%= (pushVO==null)? date_SQL : pushVO.getPush_time()%>">
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
		<td><input type="TEXT" name="news_id" size="45"
			value="<%= (pushVO==null)? "10000" : pushVO.getNews_id()%>" /></td>
	</tr>
	<tr>
		<td>廣告編號:</td>
		<td><input type="TEXT" name="ad_id" size="45"
			value="<%= (pushVO==null)? "100" : pushVO.getAd_id()%>" /></td>
	</tr>
	
</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
</body>

</html>
