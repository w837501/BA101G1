<%@ page  contentType="text/html; charset=UTF-8"  pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.store_commit.model.*"%>

<%
StoreCommitVO scVO = (StoreCommitVO) request.getAttribute("scVO");
%>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>addStoreCommit.jsp</title>
    <link href="<%=request.getContextPath()%>/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/assets/css/custom.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>

<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/storecommit.do" name="form1">
<table border="0">


	<tr>
		<td>商家編號(大寫)</td>
		<td><input type="TEXT" name="store_id" size="45" placeholder="商家編號"
			value="<%= (scVO==null)? "STO-000002" : scVO.getStore_id()%>" /></td>
	</tr>
	<tr>
		<td>會員編號(大寫)</td>
		<td><input type="TEXT" name="mem_id" size="45" placeholder="會員編號"
			value="<%= (scVO==null)? "MEM-000001" : scVO.getMem_id()%>" /></td>
	</tr>
	<tr>
		<td>評價</td>
		<td><input type="TEXT" name="sc_content" size="45" placeholder="評價"
			value="<%= (scVO==null)? "GOOD" : scVO.getSc_content()%>" /></td>
	</tr>
 	<tr>
		<td>評價分數</td>
		<td><input type="TEXT" name="sc_score" size="45" placeholder="評價分數"
			value="<%= (scVO==null)? "5" : scVO.getSc_content()%>" /></td>
	</tr>
	
</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/custom.js"></script>
</body>
</html>