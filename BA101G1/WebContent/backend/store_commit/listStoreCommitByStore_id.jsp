<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.store_commit.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.mem.model.*"%>
<%
		StoreCommitService scSvc = new StoreCommitService();
		String store_id=request.getParameter("store_id");
		List<StoreCommitVO> list = scSvc.getAllByStore_id(store_id);
		pageContext.setAttribute("list", list);
		StoreCommitVO scVO = (StoreCommitVO) request.getAttribute("scVO");
		MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>listAllStoreCommit.jsp</title>
    <link href="<%=request.getContextPath()%>/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/assets/css/custom.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
<div id="page">
	<div id="header">
		<jsp:include page="/header_both.jsp" />
	</div>
	<div id="contents">
		<div id="sidebar">
			<h1>評論</h1>
			<c:if test="${memberVO eq null }">
				<a href="<%=request.getContextPath()%>/frontend/mem/LoginAndAddMem.jsp">我要登入留言</a>
			</c:if>
		</div>
		<div id="main">
			<c:if test="${memberVO != null }">
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/storecommit.do" name="form1">
					<table border="0">
						<tr>
							<td>會員名稱</td>
							<td><%=memberVO.getMem_name()%></td>
						</tr>
					 	<tr>
							<td>評價分數</td>
							<td>
							<select size="1" name="sc_score">
								<option value="1">1
								<option value="2">2
								<option value="3">3
								<option value="4">4
								<option value="5">5
							</option></select>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea name="sc_content" rows="5" cols="30">輸入您的心得感想...</textarea>
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
			<jsp:useBean id="storeSvc" scope="page" class="com.store.model.StoreService" />
			<jsp:useBean id="memberSvc" scope="page" class="com.mem.model.MemberService"></jsp:useBean>
	
			<c:forEach var="scVO" items="${list}">
			
				<ul id="blogs">
					<li class="box">
						<div class="links">
							<a class="time"><fmt:formatDate  pattern="yyyy-MM-dd HH:mm:ss" value="${scVO.sc_time}"/></a>
							<h2>${memberSvc.getOneMem(scVO.mem_id).mem_name}</h2>
							評分：${scVO.sc_score}
							<img src="<%=request.getContextPath()%>/images/star.jpg" height="15" width="15" alt="star">
							<p>${scVO.sc_content}</p>
						</div>
					</li>
				</ul>
			
			</c:forEach>
			
		</div>
		
	</div>
	<div id="footer">
		<jsp:include page="/footer.jsp"/>
	</div>
</div>
</body>
</html>