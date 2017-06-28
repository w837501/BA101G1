<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ad.model.*" %>
<% 
AdVO adVO = (AdVO) request.getAttribute("adVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>List One Ad here</title>
</head>
<body bgcolor='white'>
<table border='1' cellpadding='5' cellspacing='0' width='600'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>廣告資料 - ListOneAd.jsp</h3>
		<a href="ListAllAd.jsp"><img src="images/logo.png" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>
<table border='1' bordercolor='#ccf' width='600'>
	<tr>
		<th>廣告編號</th>
		<th>商家編號</th>
		<th>廣告名稱</th>
		<th>廣告內容</th>
		<th>廣告圖片</th>
		<th>廣告時間</th>
		<th>廣告狀態</th>
		<th>廣告推播</th>
	</tr>
	
		<tr align='center' valign='middle'>
			<td>${adVO.ad_id}</td>
			<td>${adVO.store_id}</td>
			<td>${adVO.ad_name}</td>
			<td>${adVO.ad_content}</td>
			<td><img src="<%=request.getContextPath()%>/advertisement/DBGifReader.do?ad_id=${adVO.ad_id}" style="max-width: 150px; max-height: 150px;"></td>
			<td>${adVO.ad_time}</td>
			<td>${adVO.ad_state}</td>
			<td>${adVO.ad_push_content}</td>
	

</body>
</html>