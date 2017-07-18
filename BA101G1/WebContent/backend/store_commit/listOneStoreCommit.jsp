<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.store_commit.model.*"%>

<%
	StoreCommitVO scVO = (StoreCommitVO) request.getAttribute("scVO");
%>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>listOneStoreCommit.jsp</title>
    <link href="<%=request.getContextPath()%>/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/assets/css/custom.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>

<br>�����������|:<br><b>
   <font>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>

<a href="<%=request.getContextPath()%>/backend/mem/select_mem.jsp">�|��</a>
<a href="<%=request.getContextPath()%>/backend/news/news_index.jsp">�̷s����</a>
<a href="<%=request.getContextPath()%>/backend/rev/Select_Rev.jsp">�Ӯa�뵲</a>
<a href="<%=request.getContextPath()%>/backend/store/store_index.jsp">�Ӯa</a>
<a href='<%=request.getContextPath()%>/backend/store_class/listAllStoreClass.jsp'>�Ӯa���O</a> 
<a href="<%=request.getContextPath()%>/backend/store_commit/store_commit_index.jsp">�Ӯa����</a>


	<table border='1'>
		<tr>
			<th>�����s��</th>
			<th>�Ӯa�s��</th>
			<th>�|���s��</th>
			<th>����</th>
			<th>�����ɶ�</th>
			<th>�������A</th>

		</tr>
		<tr align='center' valign='middle'>
			<td>${scVO.sc_id}</td>
			<td>${scVO.store_id}</td>
			<td>${scVO.mem_id}</td>
			<td>${scVO.sc_content}</td>
			<td>${scVO.sc_time}</td>
            <td>${scVO.sc_state}</td>

		</tr>
	</table>


    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/custom.js"></script>
</body>
</html>