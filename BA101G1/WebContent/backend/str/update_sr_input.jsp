<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.store_report.model.*"%>
<%
StoreReportVO srVO = (StoreReportVO) request.getAttribute("srVO"); //EmpServlet.java (Concroller), �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>
<html>
<head>
<title>�Ӯa���|��ƭק� - update_sr_input.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ӯa���|��ƭק� - update_sr_input.jsp</h3>
		<a href="<%=request.getContextPath()%>/backend/str/select_page.jsp"><img src="/BA101G1/backend/str/images/back1.gif" width="100" height="32" border="0">�^����</a></td>
	</tr>
</table>

<h3>�Ӯa���|��ƭק�:</h3>
<%-- ���~���C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<FORM METHOD="post" ACTION="/store_report/store_report.do" name="form1">
<table border="0">
	<tr>
		<td>�Ӯa���|�渹:<font color=red><b>*</b></font></td>
		<td><%=srVO.getSr_id()%></td>
	</tr>
	<tr>
		<td>�Ӯa�s��:</td>
		<td><input type="TEXT" name="store_id" size="45" value="<%=srVO.getStore_id()%>" /></td>
	</tr>
	<tr>
		<td>���׽s��:</td>
		<td><input type="TEXT" name="sc_id" size="45"	value="<%=srVO.getSc_id()%>" /></td>
	</tr>
	<tr>
		<td>�q��s��:</td>
		<td><input type="TEXT" name="order_id" size="45"	value="<%=srVO.getOrder_id()%>" /></td>
	</tr>
	<tr>
		<td>�޲z���s��:</td>
		<td><input type="TEXT" name="man_id" size="45"	value="<%=srVO.getMan_id()%>" /></td>
	</tr>
	<tr>
		<td>���|���e:</td>
		<td><input type="TEXT" name="sr_content" size="45"	value="<%=srVO.getSr_content()%>" /></td>
	</tr>
	<tr>
		<td>���|�Ϥ�:</td>
		<td><input type="TEXT" name="sr_image" size="45"	value="<%=srVO.getSr_image()%>" /></td>
	</tr>
	<tr>
		<td>���|�ɶ�:</td>
		<td bgcolor="#CCCCFF">
		    <input class="cal-TextBox"
			onFocus="this.blur()" size="9" readonly type="text" name="sr_time" value="<%=srVO.getSr_time()%>">
			<a class="so-BtnLink"
			href="javascript:calClick();return false;"
			onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);"
			onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);"
			onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','sr_time','BTN_date');return false;">
		    <img align="middle" border="0" name="BTN_date"	src="images/btn_date_up.gif" width="22" height="17" alt="�}�l���"></a>
		</td>
	</tr>
	<tr>
		<td>���|�f�֪��A:</td>
		<td><input type="TEXT" name="sr_state" size="45"	value="<%=srVO.getSr_state()%>" /></td>
	</tr>
	<tr>
		<td>���|���G:</td>
		<td><input type="TEXT" name="sr_result" size="45" value="<%=srVO.getSr_result()%>" /></td>
	</tr>

<%-- 	<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" /> --%>
<!-- 	<tr> -->
<!-- 		<td>����:<font color=red><b>*</b></font></td> -->
<!-- 		<td><select size="1" name="deptno"> -->
<%-- 			<c:forEach var="deptVO" items="${deptSvc.all}"> --%>
<%-- 				<option value="${deptVO.deptno}" ${(empVO.deptno==deptVO.deptno)?'selected':'' } >${deptVO.dname} --%>
<%-- 			</c:forEach> --%>
<!-- 		</select></td> -->
<!-- 	</tr> -->

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="sr_id" value="<%=srVO.getSr_id()%>">
<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"><!--������e�X�ק諸�ӷ��������|��,�A�e��Controller�ǳ���椧��-->
<input type="hidden" name="whichPage" value="<%=request.getParameter("whichPage")%>">  <!--�u�Ω�:istAllSR.jsp-->
<input type="submit" value="�e�X�ק�"></FORM>

<br>�e�X�ק諸�ӷ��������|:<br><b>
   <font color=blue>request.getParameter("requestURL"):</font> <%= request.getParameter("requestURL")%><br>
   <font color=blue>request.getParameter("whichPage"):</font> <%= request.getParameter("whichPage")%> (���d�ҥثe�u�Ω�:istAllSR.jsp))</b>
</body>
</html>