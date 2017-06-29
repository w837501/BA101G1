<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="java.util.*"%>




<html>
<head>
<title>員工資料 - listOneOrder.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 Script 的寫法取值:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>員工資料 - ListOneEmp.jsp</h3>
		<a href="<%=request.getContextPath()%>/frontend/selectOrder/selectOrder.jsp"><img src="<%=request.getContextPath()%>/backend/push/images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>訂單編號</th>
		<th>日期</th>
		<th>商店</th>
		<th>訂單金額</th>
		<th>取餐方式</th>
		<th>訂單狀態</th>
		<th>取消訂單</th>
		<th>評價商家</th>
		<th>檢舉商家</th>
	</tr>
	<c:forEach var="store_orderVO" items="${store_orderVO}" >
	<tr align='center' valign='middle'>
		
		<td><a href="orderlist.do?order_id=${store_orderVO.order_id}&action=getOneOrder_For_DetailDisplay">${store_orderVO.order_id }</a></td>
		<td><a href="<%=request.getContextPath()%>/frontend/selectOrder/orderDetail.jsp?order_id=${store_orderVO.order_id}">${store_orderVO.order_id }</a></td>
		<td>${store_orderVO.order_time }</td>
 		<td>${store_orderVO.store_name }</td>
		<td>${store_orderVO.totalprice }</td>
		<td>${store_orderVO.order_way }</td>
		<td>${store_orderVO.order_state }</td>
		<td>取消</td>
		<td>評價</td>
		<td>檢舉</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>