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
		<td>評價編號<font color=red><b>*</b></font></td>
		<td><%=scVO.getSc_id()%></td>
	</tr>

	<tr>
		<td>商家編號</td>
		<td><%=scVO.getStore_id()%></td>
	</tr>
	<tr>
		<td>會員編號</td>
		<td><%=scVO.getMem_id()%></td>
	</tr>
	<tr>
		<td>評價</td>
		<td><input type="TEXT" name="sc_content" size="45" placeholder="評價"
			value="<%=scVO.getSc_content()%>" /></td>
	</tr>
 	<tr>
		<td>評價時間</td>
		<td><%=scVO.getSc_time()%></td>
	</tr>
	<tr>
		<td>評價狀態</td>
		<td><input type="radio" name="sc_state" value="顯示"  ${(scVO.sc_state eq '顯示')?'checked':'' } />顯示
			<input type="radio" name="sc_state" value="隱藏"  ${(scVO.sc_state eq '隱藏')?'checked':'' }/>隱藏
		</td>
	</tr>	

</table>
<br>
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="sc_id" value="<%=scVO.getSc_id()%>">
            <input type="hidden" name="mem_id" value="<%=scVO.getMem_id()%>">
            <input type="hidden" name="store_id" value="<%=scVO.getStore_id()%>">
            <input type="hidden" name="sc_time" value="<%=scVO.getSc_time()%>">
            <input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>">
            <input type="hidden" name="whichPage" value="<%=request.getParameter("whichPage")%>"> 
            <input type="submit" value="送出修改"></FORM>



    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/custom.js"></script>
</body>
</html>