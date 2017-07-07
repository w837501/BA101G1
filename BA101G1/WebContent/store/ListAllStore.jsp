<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.store.model.*" %>
<%@ page import="java.util.*" %>
<% 
	StoreService storeSvc=new StoreService();
	List<StoreVO> list=storeSvc.getAll();
	pageContext.setAttribute("list",list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>List All Store here</title>
</head>
<body bgcolor='white'>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>所有商家資料 - ListAllStore.jsp</h3>
		<a href="index.jsp"><img src="${pageContext.request.contextPath}/images/logo.png" width="100" height="32" border="0">回首頁</a>
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
	<jsp:useBean id="storeclassSvc" scope="page" class="com.store_class.model.StoreClassService" />
<table border='1' bordercolor='#ccf' width='600'>
	<tr>
		<th>商家編號</th>
		<th>商家名稱</th>
		<th>商家類別</th>
		<th>商家簡介</th>
		<th>商家電話</th>
		<th>商家地址</th>
		<th>商家照片</th>
		<th>商家帳號</th>
		<th>商價密碼</th>
		<th>商家外送</th>
		<th>商家地區</th>
		<th>商家狀態</th>
		<th>修改</th>
	</tr>
	<%@ include file="page1.file" %>	
	<c:forEach var="storeVO" items="${list}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1 %>">
		<tr align='center' valign='middle' ${(storeVO.store_id==param.store_id) ? 'bgcolor=#CCCCFF':''}>
			<td>${storeVO.store_id } </td>
			<td>${storeVO.store_name }</td>
			<td>${storeclassSvc.getSC_name(storeVO.sc_id).sc_name }</td>
			<td>${storeVO.store_content }</td>
			<td>${storeVO.store_phone }</td>
			<td>${storeVO.store_addr }</td>
			<td><img src="<%=request.getContextPath()%>/StoreReader?store_id=${storeVO.store_id}" style="max-width: 150px; max-height: 150px;"></td>
			<td>${storeVO.store_acc }</td>
			<td>${storeVO.store_pw }</td>
			<td>${storeVO.store_out }</td>
			<td>${storeVO.store_zone }</td>
			<td>${storeVO.store_state }</td>
			
			<td>
				<form method="post" action="store.do">
					<input type="submit" value="修改">
					<input type="hidden" name="store_id" value="${storeVO.store_id }">
					<input type="hidden" name="action" value="getOne_For_Update">
				</form>
			
			</td>
			</tr>
			</c:forEach>
			
</body>
</html>