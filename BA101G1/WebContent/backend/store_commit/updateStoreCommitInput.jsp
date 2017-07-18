<%@ page  contentType="text/html; charset=UTF-8"  pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.store_commit.model.*"%>
<%
	StoreCommitVO scVO = (StoreCommitVO) request.getAttribute("scVO");
%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>updateStoreCommitInput.jsp</title>
    <link href="<%=request.getContextPath()%>/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/assets/css/custom.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
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

<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>



<FORM METHOD="post" ACTION="store_commit.do" name="form1">
<table border="0">

	<tr>
		<td>�����s��<font color=red><b>*</b></font></td>
		<td><%=scVO.getSc_id()%></td>
	</tr>

	<tr>
		<td>�Ӯa�s��</td>
		<td><input type="TEXT" name="store_id" size="45" placeholder="�Ӯa�s��"
			value="<%=scVO.getStore_id()%>" /></td>
	</tr>
	<tr>
		<td>�|���s��</td>
		<td><input type="TEXT" name="mem_id" size="45" placeholder="�|���s��"
			value="<%=scVO.getMem_id()%>" /></td>
	</tr>
	<tr>
		<td>����</td>
		<td><input type="TEXT" name="sc_content" size="45" placeholder="����"
			value="<%=scVO.getSc_content()%>" /></td>
	</tr>
 	<tr>
		<td>�����ɶ�</td>
		<td><input type="date" name="sc_time" size="45" 
			value="<%=scVO.getSc_time()%>" /></td>
	</tr>
	<tr>
		<td>�������A</td>
		<td><input type="radio" name="sc_state" value="���"         />���
			<input type="radio" name="sc_state" value="����" checked />����
		</td>
	</tr>	

</table>
<br>
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="sc_id" value="<%=scVO.getSc_id()%>">
            <input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>">
            <input type="hidden" name="whichPage" value="<%=request.getParameter("whichPage")%>"> 
            <input type="submit" value="�e�X�ק�"></FORM>



    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/custom.js"></script>
</body>
</html>