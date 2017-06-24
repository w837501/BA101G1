<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.store_class.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 此頁練習採用 Script 的寫法取值 --%>
<%--
	ProductService proSvc1=new ProductService();
	String pro_name=(String)request.getAttribute("pro_name");
	List<ProductVO> list=proSvc1.getName(pro_name);
--%>
<%-- 取出 Concroller EmpServlet.java已存入request的EmpVO物件--%>
<%--  <%List<ProductVO> productVO = (List) request.getAttribute("productlist");%>--%>
<jsp:useBean id="storeSvc" scope="page" class="com.store.model.StoreService" />

<html>
<head>
<title>商家查詢結果 - listSearchStore.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 Script 的寫法取值:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>商家查詢結果 - listSearchStore.jsp</h3>
		<a href="<%=request.getContextPath()%>/index.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>商家圖片</th>
		<th>商家名稱</th>
		<th>商家類型</th>
		<th>商家類型名稱</th>
	</tr>
	
	<c:forEach var="store" items="${storelist}">
		<tr align='center' valign='middle'>
			<td>${store.store_image}</td>
			<td>${store.store_name}</td>
			<td>${store.sc_id}</td>
			<td><c:forEach var="store_class" items="${store_class.all}">
                    <c:if test="${storeVO.sc_id==storeClassVO.sc_id}">
	                    ${store_class.sc_name}
                    </c:if>
                </c:forEach>
			</td>
		<tr>
	</c:forEach>
	
</table>

</body>
</html>
