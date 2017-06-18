<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.product.model.*"%>
<%-- 此頁練習採用 Script 的寫法取值 --%>

<%-- 取出 Concroller EmpServlet.java已存入request的EmpVO物件--%>
<%ProductVO productVO = (ProductVO) request.getAttribute("productVO");%>


<html>
<head>
<title>員工資料 - listOneEmp.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 Script 的寫法取值:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>員工資料 - ListOneEmp.jsp</h3>
		<a href="<%=request.getContextPath()%>/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>商品編號</th>
		<th>商家編號</th>
		<th>商品名稱</th>
		<th>價格</th>
		<th>圖片</th>
		<th>商品類型</th>
		<th>說明</th>
	</tr>
	<tr align='center' valign='middle'>
		<td><%=productVO.getPro_id()%></td>
		<td><%=productVO.getStore_id()%></td>
		<td><%=productVO.getPro_name()%></td>
		<td><%=productVO.getPro_price()%></td>
		<td><%=productVO.getPro_image()%></td>
		<td><%=productVO.getPro_type()%></td>
		<td><%=productVO.getPro_content()%></td>
	</tr>
</table>

</body>
</html>
