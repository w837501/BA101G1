<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.store_commit.model.*"%>
<%@ page import="com.mem.model.*"%>
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
		String store_id=request.getParameter("store_id");
		List<StoreCommitVO> list = scSvc.getAllByStore_id(store_id);
		pageContext.setAttribute("list", list);
		StoreCommitVO scVO = (StoreCommitVO) request.getAttribute("scVO");
		MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
	%>
	<jsp:useBean id="memberSvc" scope="page" class="com.mem.model.MemberService"></jsp:useBean>
<c:forEach var="scVO" items="${list}">
	<table border='0'>
			<tr align='center' valign='middle'>
				<td>${memberSvc.getOneMem(scVO.mem_id).mem_name}</td>
				<td>${scVO.sc_score}</td>
				<td>${scVO.sc_content}</td>
				<td><fmt:formatDate  pattern="yyyy-MM-dd HH:mm:ss" value="${scVO.sc_time}"/></td>
			</tr>
	</table>
		</c:forEach>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<c:if test="${memberVO eq null }">
		<a href="<%=request.getContextPath()%>/frontend/mem/LoginAndAddMem.jsp">我要登入留言</a>
	
	
	</c:if>
	
	<c:if test="${memberVO != null }">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/storecommit.do" name="form1">
<table border="0">


	<tr>
		<td>商家編號(大寫)</td>
		<td><%=store_id%></td>
	</tr>
	<tr>
		<td>會員編號(大寫)</td>
		<td><%=memberVO.getMem_name()%></td>
	</tr>
	<tr>
		<td>內容</td>
		<td><input type="TEXT" name="sc_content" size="45" placeholder="內容"
			value="<%= (scVO==null)? "GOOD" : scVO.getSc_content()%>" /></td>
	</tr>
 	<tr>
		<td>評價分數</td>
		<td><select size="1" name="sc_score">
								<option value="1">1
								<option value="2">2
								<option value="3">3
								<option value="4">4
								<option value="5">5
		</option></select>
		</td>
	</tr>
	</table>
	<br>
	<input type="hidden" name="action" value="insert">
	<input type="hidden" name="store_id" value="<%=store_id%>">
	<input type="hidden" name="mem_id" value="<%=memberVO.getMem_id()%>">
	<input type="submit" value="送出新增"></FORM>
</FORM>
</c:if>
</body>
</html>