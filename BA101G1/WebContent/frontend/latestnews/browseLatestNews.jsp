<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.news.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	NewsService newsSvc = new NewsService();
	List<NewsVO> list = newsSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>�Y�q�ڽu�W�q�\�t��</title>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
	</head>

	<body>
	<div id="page">
		<div id="header">
			<jsp:include page="/header_member.jsp"></jsp:include>
		</div>
	    <div id="classcontents">

		<p>
			<font size = "500px">
				<b>�̷s����</b>
			</font>
		</p>

		<div id="items">
			<%@ include file="pages/page1.file" %> 
            <ul>
            	<c:forEach var="newsVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1 %>">
            	<li>
            		<a href="news.do?news_name=${newsVO.news_name}&news_time=${newsVO.news_time}&news_id=${newsVO.news_id}&action=getOne_For_Display">
					<img src="<%=request.getContextPath()%>/latestnews/DBGifReader.do?news_id=${newsVO.news_id}"style="max-width: 150px; max-height: 150px;"></a>
					<br>
					<div style="width:150px">
					<h3>${newsVO.news_name}</h3></div>
					<fmt:formatDate value="${newsVO.news_time}" pattern="yyyy-MM-dd"/>  
					
            	</li>
            	</c:forEach>
            </ul>   
	    </div>
	    	<%@ include file="pages/page2.file" %>
		</div>
	    <div id="footer">
				<ul class="navigation">         
					<li class="selected"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
					<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>�����Ӯa</a></li>
					<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>��Ӯa</a></li>
					<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>��ӫ~</a></li>
					<li><a href="news.html">�̷s����</a></li>
				</ul>
				<p id="footnote">Eternal Beauty Essentials 2012. All Rights Reserved.</p>
		</div>	
	</div>
</body>
</html>
