<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.orderlist.model.*" %> 
<%@ page import="java.util.*"%>


<html>
<head>
<title>單一訂單詳細資料 - listOneOrderList.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 Script 的寫法取值:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>訂單資訊 - Order_Detail.jsp</h3>
		<a href="<%=request.getContextPath()%>/frontend/selectOrder/selectOrder.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>訂單編號</th>
		<th>商品編號</th>
		<th>數量</th>
		<th>單價</th>
	</tr>
	<c:forEach var="orderlistVO" items="${orderlistVO}" >
	<tr align='center' valign='middle'>
		<td>${orderlistVO.order_id}</td>
		<td>${orderlistVO.pro_id}</td>		
		<td>${orderlistVO.order_amount}</td>
 		<td>${orderlistVO.price}</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>