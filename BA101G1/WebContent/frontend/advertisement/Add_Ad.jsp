<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ad.model.*"%>
<%
	AdVO adVO=(AdVO)request.getAttribute("adVO");
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
<title>Add Advertisement here</title>
</head>
<bbody bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='500'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><h3>���u��Ʒs�W - addMan.jsp</h3></td>
			<td><a href="browseAD.jsp"><img src="${pageContext.request.contextPath}/frontend/advertisement/images/logo.png"	width="100" height="100" border="1"> �^���� </a></td></tr></table>

<h4>�s�i���:<font color=red><b>*</b></font>���������</h4>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
	
	
</c:if>
<FORM METHOD="post" ACTION= "<%=request.getContextPath()%>/frontend/advertisement/ad.do" name="form1" enctype="multipart/form-data">
<table border="0">

	<tr>
		<td>�ө��s��:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="store_id" size="45" 
			value="<%= (adVO==null)? "STP-000001" :adVO.getAd_id() %>" /></td>
		
	</tr>
	<tr>
		<td>�s�i�W�r:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="ad_name" size="45"
			 value="<%= (adVO==null)? "�{�l�j" :adVO.getAd_name() %>" /></td>
	</tr>
	<tr>
		<td>�s�i���e:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="ad_content" size="45"
			 value="<%= (adVO==null)? "�֨ӦY������" :adVO.getAd_content() %>" /></td>
	</tr>
	<tr>
		<td>�s�i�Ϥ�:<font color=red><b>*</b></font></td>
		<td><input type="file" name="upfile1" id="upfile1" >
		 <p>
    	<img id="image"   style="max-width: 150px; max-height: 150px;">
			</p>
  		</td>
		</tr>
	<tr>
		<td>�s�i�ɶ�: </td>
		<td><input class="cal-TextBox"
			onFocus="this.blur()" size="9" readonly type="text" name="ad_time" value="1981-11-17">
			<a class="so-BtnLink"
			href="javascript:calClick();return false;"
			onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);"
			onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);"
			onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','ad_time','BTN_date');return false;">
		    <img align="middle" border="0" name="BTN_date"	src="<%=request.getContextPath() %>/frontend/advertisement/images/btn_date_up.gif" width="22" height="17" alt="�}�l���"></a>
		   </td>     
		</tr>
</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>


</body>
</html>