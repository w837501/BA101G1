<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ad.model.*"%>
<%
	AdVO adVO = (AdVO) request.getAttribute("adVO"); //EmpServlet.java (Concroller), 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<script language="JavaScript" src="js/pic_preview.js"></script>
<script language="JavaScript" src="js/push_select.js"></script>
<div id="popupcalendar" class="text"></div>
<title>Update Ad here</title>
</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>員工資料修改 - update_emp_input.jsp</h3>
		<a href="ListAllAd.jsp"><img src="images/logo.png" width="100" height="32" border="0">回首頁</a></td>
	</tr>
</table>

<h3>資料修改:</h3>
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
<FORM METHOD="post" ACTION="ad.do" name="form1" enctype="multipart/form-data">
<table border="0">
	<tr>
		<td>廣告編號:<font color=red><b>*</b></font></td>
		<td><%=adVO.getAd_id() %></td>
	</tr>
	<tr>
		<td>商家編號:<font color=red><b>*</b></font></td>
		<td><%=adVO.getStore_id() %></td>
	</tr>
	<tr>
		<td>廣告名字:<font color=red><b>*</b></font></td>
		<td><input type="text" name="ad_name" size="45" value="<%=adVO.getAd_name()%>" />
	</tr>
	<tr>
		<td>廣告內容:<font color=red><b>*</b></font></td>
		<td><input type="text" name="ad_content" size="45" value="<%=adVO.getAd_content()%>" />
	</tr>
	<tr>
		<td>廣告圖片:<font color=red><b>*</b></font></td>
			<td>
			<input type="file" name="upfile1" id="upfile1">
			 <p>
    			<img src="<%=request.getContextPath()%>/advertisement/DBGifReader.do?ad_id=${adVO.ad_id}" id="image"   style="max-width: 150px; max-height: 150px;">
			</p>
			</td>
	</tr>
	<tr>
		<td>廣告時間:<font color=red><b>*</b></font></td>
		<td bgcolor="#CCCCFF">
		    <input class="cal-TextBox"
			onFocus="this.blur()" size="9" readonly type="text" name="ad_time" value="<%=adVO.getAd_time()%>">
			<a class="so-BtnLink"
			href="javascript:calClick();return false;"
			onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);"
			onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);"
			onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','ad_time','BTN_date');return false;">
		    <img align="middle" border="0" name="BTN_date"	src="images/btn_date_up.gif" width="22" height="17" alt="開始日期"></a>
		</td>
	</tr>
	<tr>
		<td>廣告狀態:<font color=red><b>*</b></font></td>
		<td><select name="ad_state"><%=adVO.getAd_state() %>
				<option value="${adVO.ad_state}" ${(adVO.ad_state==adVO.ad_state)?'selected':'' } >${adVO.ad_state}
					<option value="審核中">審核中</option>
					<option value="刊登中">刊登中</option>
					<option value="下架">下架</option>		
			</select></td>
	</tr>
	<tr>
		<td>是否推播:<font color=red><b>*</b></font></td>
		<td><select id="push_select" onclick=selectChange()>
			<option value='1'>是</option>
			
			<option value='2'>否</option>
		</select>
		<input type="TEXT" id="ad_push_content" name="ad_push_content" size="45" value="<%=adVO.getAd_push_content()%>" /></td></td>
	</tr>
	</table>
	<br>
<input type="hidden" name="ad_id" value="<%=adVO.getAd_id()%>">
<input type="hidden" name="store_id" value="<%=adVO.getStore_id()%>">
<input type="hidden" name="action" value="update">
<input type="submit" value="送出修改">
</FORM>
</body>
</html>