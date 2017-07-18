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

	<body>
	<div id="page">
		<div id="header">
			<div id="logo">
				<a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/images/logo.png" alt="LOGO"></a>
				<span id="login"><a href="news.html">Login in</a></span>

				<ul>
					<li class="selected"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
					<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>熱門商家</a></li>
					<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>找商家</a></li>
					<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>找商品</a></li>
					<li><a href="news.html">最新消息</a></li>
				</ul>
			</div>	
		</div>

		<p><font size = "500px">
		<b style ="display:inline-block;">最新消息 > 內容 </b>
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
				<ul class="navigation">
					<li class="selected"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
					<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>熱門商家</a></li>
					<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>找商家</a></li>
					<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>找商品</a></li>
					<li><a href="news.html">最新消息</a></li>
				</ul>
				<p id="footnote">Eternal Beauty Essentials 2012. All Rights Reserved.</p>
		</div>
	</div>		
	</div>
	</body>
</html>
