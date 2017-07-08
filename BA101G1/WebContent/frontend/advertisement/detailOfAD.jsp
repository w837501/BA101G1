<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ad.model.*"%>
<%@ page import="java.util.*"%>
<%@page import="java.sql.Timestamp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
// AdVO adVO = (AdVO) request.getAttribute("adVO"); //Chatroom_MessageServlet.java(Concroller), 存入req的empVO物件
AdService adSvc=new AdService();
String ad_id=request.getParameter("ad_id");
AdVO adVO=adSvc.getOneAd(ad_id);
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>吃訂我線上訂餐系統</title>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
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
	
		<p><font size = "10px">
		<b style ="display:inline-block;"><a href="?????"> 廣告 </a>> 內容 </b>
		</font></p>
		
		<br>
		
		<div id="ad" align="center">
			<h1>${adVO.ad_name}</h1>
			<h2><fmt:formatDate value="${adVO.ad_time}" pattern="yyyy-MM-dd"/></h2>
<!--  			<hr style="border-color: red;"> -->
			<img src="<%=request.getContextPath()%>/advertisement/DBGifReader.do?ad_id=${adVO.ad_id}"style="max-width: 250px; max-height: 250px;"></img>
			<div id="content">
				<h3>${adVO.ad_content}</h3>
				<h3>11111111</h3>
				<h3>22222222</h3>
			</div>
		</div>
	</div>
	</body>
</html>
