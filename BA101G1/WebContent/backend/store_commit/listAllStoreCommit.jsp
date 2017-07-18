<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.store_commit.model.*"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>listAllStoreCommit.jsp</title>
    <link href="<%=request.getContextPath()%>/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/assets/css/custom.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>

	<br>�����������|:
	<br>
	<b> <font>request.getServletPath():</font> <%=request.getServletPath()%><br>
		<font>request.getRequestURI(): </font> <%=request.getRequestURI()%>
	</b>

	<%
		StoreCommitService scSvc = new StoreCommitService();
		List<StoreCommitVO> list = scSvc.getAll();
		pageContext.setAttribute("list", list);
	%>


<a href="<%=request.getContextPath()%>/backend/mem/select_mem.jsp">�|��</a>
<a href="<%=request.getContextPath()%>/backend/news/news_index.jsp">�̷s����</a>
<a href="<%=request.getContextPath()%>/backend/rev/Select_Rev.jsp">�Ӯa�뵲</a>
<a href="<%=request.getContextPath()%>/backend/store/store_index.jsp">�Ӯa</a>
<a href='<%=request.getContextPath()%>/backend/store_class/listAllStoreClass.jsp'>�Ӯa���O</a> 
<a href="<%=request.getContextPath()%>/backend/store_commit/store_commit_index.jsp">�Ӯa����</a>

	<c:if test="${not empty errorMsgs}">
		<font color='red'>�Эץ��H�U���~:
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</font>
	</c:if>

	<table border='1'>
		<tr>
			<th>�����s��</th>
			<th>�Ӯa�s��</th>
			<th>�|���s��</th>
			<th>����</th>
			<th>�����ɶ�</th>
			<th>�������A</th>
			<th>�ק�</th>
			<th>�R��</th>



		</tr>
		<%@ include file="pages/page1.file"%>
		
		<c:forEach var="scVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<tr align='center' valign='middle' ${(scVO.sc_id==param.sc_id) ? 'bgcolor=#CCCCFF':''}>
				<td>${scVO.sc_id}</td>
				<td>${scVO.store_id}</td>
				<td>${scVO.mem_id}</td>
				<td>${scVO.sc_content}</td>
				<td>${scVO.sc_time}</td>
				<td>${scVO.sc_state}</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/backend/store_commit/store_commit.do">
						<input type="submit" value="�ק�"> 
						<input type="hidden" name="sc_id" value="${scVO.sc_id}"> 
						<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
<input type="hidden" name="whichPage"	value="<%=whichPage%>">						
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>


				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/backend/store_commit/store_commit.do">
						<input type="submit" value="�R��"> 
						<input type="hidden" name="sc_id" value="${scVO.sc_id}"> 
						<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
<input type="hidden" name="whichPage"	value="<%=whichPage%>"> 						
						<input type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>

	<%@ include file="pages/page2.file"%>



    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/custom.js"></script>
</body>
</html>