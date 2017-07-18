<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ad.model.*"%>
<%@ page import="java.util.*"%>
<%@page import="java.sql.Timestamp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
// AdVO adVO = (AdVO) request.getAttribute("adVO"); //Chatroom_MessageServlet.java(Concroller), �s�Jreq��empVO����
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
		<title>�Y�q�ڽu�W�q�\�t��</title>
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
					<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>�����Ӯa</a></li>
					<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>��Ӯa</a></li>
					<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>��ӫ~</a></li>
					<li><a href="news.html">�̷s����</a></li>
				</ul>
			</div>
		</div>
	
		<p><font size = "10px">
		<b style ="display:inline-block;"> �s�i  > ���e </b>
		</font></p>
		
		<br>
		<div id="classcontents">
		<div id="items">
		<div id="ad" align="center">
			<table>
			<tr>
				<td width="80%">${adVO.ad_name}</td>
				<td width="20%"><fmt:formatDate value="${adVO.ad_time}" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<hr style="border-color:red;">
				</td>
			</tr>
			</table>		
			<img src="<%=request.getContextPath()%>/advertisement/DBGifReader.do?ad_id=${adVO.ad_id}"style="max-width: 250px; max-height: 250px;"></img>
			<div id="content">
				<h3>${adVO.ad_content}</h3>
			</div>
		</div>
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
	</div>
	</body>
</html>
