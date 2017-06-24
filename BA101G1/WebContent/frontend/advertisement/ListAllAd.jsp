<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ad.model.*" %>
<%@ page import="java.util.*" %>
<% 
	AdService adSvc=new AdService();
	List<AdVO> list=adSvc.getAll();
	pageContext.setAttribute("list",list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>所有資料</title>
</head>
<body bgcolor='white'>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>所有員工資料 - ListAllMem.jsp</h3>
		<a href="browseAD.jsp"><img src="${pageContext.request.contextPath}/frontend/advertisement/images/logo.png" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>
<c:if test="${not empty errorMsgs }">
	<font color='red'>修正以下錯誤
	<ul>
		<c:forEach var="message" items="${errorMsgs }">
			<li>${message }</li>
		</c:forEach>
	</ul>	
	</font>
</c:if>	

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
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="page1.file" %>	
	<c:forEach var="adVO" items="${list}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1 %>">
		<tr align='center' valign='middle' ${(adVO.ad_id==param.ad_id) ? 'bgcolor=#CCCCFF':''}>
			<td>${adVO.ad_id } </td>
			<td>${adVO.store_id }</td>
			<td>${adVO.ad_name }</td>
			<td>${adVO.ad_content }</td>
			<td><img src="<%=request.getContextPath()%>/advertisement/DBGifReader.do?ad_id=${adVO.ad_id}" style="max-width: 150px; max-height: 150px;"></td>
			<td>${adVO.ad_time }</td>
			<td>${adVO.ad_state }</td>
			<td>${adVO.ad_push_content }</td>
			<td>
				<form method="post" action="<%=request.getContextPath() %>/frontend/advertisement/ad.do">
					<input type="submit" value="修改">
					<input type="hidden" name="ad_id" value="${adVO.ad_id }">
					<input type="hidden" name="action" value="getOne_For_Update">
				</form>
			</td>
			<td>
				<form method="post" action="<%=request.getContextPath() %>/frontend/advertisement/ad.do">
					<input type="submit" value="刪除">
					<input type="hidden" name="ad_id" value="${adVO.ad_id }">
					<input type="hidden" name="action" value="delete">
				</form>
			</td>
	</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>	
</body>
</html>