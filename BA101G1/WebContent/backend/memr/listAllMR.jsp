<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member_report.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>
	---${param.empno}----
<%
MemberReportService mrSvc = new MemberReportService();
	List<MemberReportVO> list = mrSvc.getAll();
	pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>�Ҧ��|�����|��� - listAllMR.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� EL ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ҧ��|�����|��� - ListAllMR.jsp</h3>
		<a href="<%=request.getContextPath()%>/backend/memr/select_page.jsp"><img src="<%=request.getContextPath()%>/backend/memr/images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

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

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�|�����|�渹</th>
		<th>�|���s��</th>
		<th>�q��s��</th>
		<th>���׽s��</th>
		<th>�޲z���s��</th>
		<th>���|���e</th>
		<th>���|�Ϥ�</th>
		<th>���|�ɶ�</th>
		<th>�f�֪��A</th>
		<th>���|���G</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<c:forEach var="mrVO" items="${list}" >
		<tr align='center' valign='middle' ${(mrVO.mr_id==param.mr_id) ? 'bgcolor=#CCCCFF':''}><!--�N�ק諸���@���[�J����Ӥw-->
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
			     <input type="submit" value="�ק�"> 
			     <input type="hidden" name="mr_id" value="${mrVO.mr_id}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member_report/member_report.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="mr_id" value="${mrVO.mr_id}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>

<br>�����������|:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
</body>
</html>
