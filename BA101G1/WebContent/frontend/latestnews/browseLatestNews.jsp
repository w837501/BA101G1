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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
<script src="<%=request.getContextPath()%>/js/mobile.js" type="text/javascript"></script>
<style>
	b{
		margin-left:20px;
	}
</style>
<body>
	<div id="page">
		<div id="header">
			<jsp:include page="/header_member.jsp"></jsp:include>
		</div>
	    <div id="classcontents">
			<p>
				<font size = "6"><b>�̷s����</b></font>
			</p>
	
			<div id="items">
				<%@ include file="pages/page1.file" %> 
	            <ul>
	            	<c:forEach var="newsVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1 %>">
	            	<li style="text-align:center;line-height:100px;">
	            		<a href="news.do?news_name=${newsVO.news_name}&news_time=${newsVO.news_time}&news_id=${newsVO.news_id}&action=getOne_For_Display">
							<IMG src="<%=request.getContextPath() %>/MRDBGifReader?whichImg=latn&id=${newsVO.news_id}" style="max-width: 150px; max-height: 150px;">
						<h3>${newsVO.news_name}</h3>
						<h3><font color="#fff" size="2"><fmt:formatDate value="${newsVO.news_time}" pattern="yyyy.MM.dd"/></font></h3>
						</a>
						
	            	</li>
	            	</c:forEach>
	            </ul>   
		    </div>
		    	<%@ include file="pages/page2.file" %>
			
		</div>
		<div id="footer">
			<jsp:include page="/footer.jsp"/>
		</div>
	</div>
</body>


</html>