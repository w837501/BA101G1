<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.store_commit.model.*"%>
<html>
<head>
<style>
table{
  border-collapse: collapse;
  border-spacing: 0;
}
tr{
/*   border: 1px solid #E0607E; */
}
td{
  border: 1px solid #607ee0;
  padding: 10px 30px;
  background-color: #E0607E;
/*   border-radius: 10px; */
  color: #FFF;
}
td:first-child{
  border-top-left-radius: 10px;
  border-bottom-left-radius: 10px;
}

td:last-child{
  border-top-right-radius: 10px;
  border-bottom-right-radius: 10px;
}
</style>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>listAllStoreCommit.jsp</title>
    <link href="<%=request.getContextPath()%>/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/assets/css/custom.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>

	<%
		StoreCommitService scSvc = new StoreCommitService();
		List<StoreCommitVO> list = scSvc.getAll();
		pageContext.setAttribute("list", list);
	%>

<c:forEach var="scVO" items="${list}">
	<table border='0'>
			<tr align='center' valign='middle'>
				<td>${scVO.mem_id}</td>
				<td>${scVO.sc_score}</td>
				<td>${scVO.sc_content}</td>
				<td><fmt:formatDate  pattern="yyyy-MM-dd HH:mm:ss" value="${scVO.sc_time}"/></td>
			</tr>
	</table>
		</c:forEach>




    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/custom.js"></script>
</body>
</html>