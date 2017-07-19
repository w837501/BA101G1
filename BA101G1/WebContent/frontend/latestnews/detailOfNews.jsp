<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.Timestamp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.news.model.*"%>
<%-- <%NewsVO newsVO = (NewsVO) request.getAttribute("newsVO"); %>  --%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>吃訂我線上訂餐系統</title>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
		<style>
			table{
				font-size:25px;
				width:800px;
			}
		</style>
	</head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
<script src="<%=request.getContextPath()%>/js/mobile.js" type="text/javascript"></script>
	<body>
	<div id="page">
		<div id="header">
			<jsp:include page="/header_both.jsp" />
		</div>

		<p><font size = "500px">
		<b style ="display:inline-block;"><a href="<%=request.getContextPath()%>/frontend/latestnews/browseLatestNews.jsp">最新消息</a> > 內容 </b>
		</font></p>
		
		<br>	
		<div id="classcontents">
		<div id="items">
		<div id ="outside" align="center">
			<table>
			<tr>
				<td width="80%">${newsVO.news_name}</td>
				<td width="20%"><fmt:formatDate value="${newsVO.news_time}" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<hr style="border-color: red;">
				</td>
			</tr>
			</table>	
		</div>
		
			<div id="content">
				${newsVO.news_content} 
			</div>
		</div>
		</div>
		<div id="footer">
			<jsp:include page="/footer.jsp"/>
		</div>
	</div>		
	</div>
	</body>
</html>
