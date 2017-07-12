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

	<br>本網頁的路徑:
	<br>
	<b> <font>request.getServletPath():</font> <%=request.getServletPath()%><br>
		<font>request.getRequestURI(): </font> <%=request.getRequestURI()%>
	</b>

	<%
		StoreCommitService scSvc = new StoreCommitService();
		List<StoreCommitVO> list = scSvc.getAll();
		pageContext.setAttribute("list", list);
	%>


<a href="<%=request.getContextPath()%>/backend/mem/select_mem.jsp">會員</a>
<a href="<%=request.getContextPath()%>/backend/news/news_index.jsp">最新消息</a>
<a href="<%=request.getContextPath()%>/backend/rev/Select_Rev.jsp">商家月結</a>
<a href="<%=request.getContextPath()%>/backend/store/store_index.jsp">商家</a>
<a href='<%=request.getContextPath()%>/backend/store_class/listAllStoreClass.jsp'>商家類別</a> 
<a href="<%=request.getContextPath()%>/backend/store_commit/store_commit_index.jsp">商家評價</a>

	<c:if test="${not empty errorMsgs}">
		<font color='red'>請修正以下錯誤:
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</font>
	</c:if>

	<table border='1'>
		<tr>
			<th>評價編號</th>
			<th>商家編號</th>
			<th>會員編號</th>
			<th>評價</th>
			<th>評價時間</th>
			<th>評價狀態</th>
			<th>修改</th>
			<th>刪除</th>



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
						<input type="submit" value="修改"> 
						<input type="hidden" name="sc_id" value="${scVO.sc_id}"> 
						<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
<input type="hidden" name="whichPage"	value="<%=whichPage%>">						
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>


				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/backend/store_commit/store_commit.do">
						<input type="submit" value="刪除"> 
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