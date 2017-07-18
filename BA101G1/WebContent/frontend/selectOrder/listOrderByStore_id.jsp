<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>
<% 
StoreVO storeVO=(StoreVO)session.getAttribute("storeVO");
Store_OrderService orderSvc=new Store_OrderService();
String store_id=storeVO.getStore_id();
List<Store_OrderVO> store_orderVO=new LinkedList<Store_OrderVO>();
 store_orderVO=orderSvc.getOrderByStore_id(store_id);
 pageContext.setAttribute("store_orderVO",store_orderVO);
%>
<html>
<head>
<title>�q�� - listOneOrder.jsp</title>
</head>
<body bgcolor='white'>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ӯa�q��- ListOrderByStore_id.jsp</h3>
		<a href="<%=request.getContextPath()%>/frontend/selectOrder/selectOrder.jsp"><img src="<%=request.getContextPath()%>/backend/push/images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>


<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�q��s��</th>
		<th>�q�\�ɶ�</th>
		<th>���a�W��</th>
		<th>�`���B</th>
		<th>���\�覡</th>
		<th>�q�檬�A</th>
		<th>�����q��</th>
		<th>�����Ӯa</th>
		<th>���|�Ӯa</th>
	</tr>
	<c:forEach var="store_orderVO" items="${store_orderVO}" >
	<tr align='center' valign='middle'>
		

		

			
		<td>
			<a href="<%=request.getContextPath()%>/frontend/selectOrder/orderlist.do?action=getOneOrder_For_DetailDisplay&order_id=${store_orderVO.order_id}">${store_orderVO.order_id}</a>
		</td>

		<td>${store_orderVO.order_time }</td>
 		<td>${store_orderVO.store_name }</td>
		<td>${store_orderVO.totalprice }</td>
		<td>${store_orderVO.order_way }</td>
		<td>${store_orderVO.order_state }</td>
		<td>����</td>
		<td>����</td>
		<td>���|</td>
	</tr>
	</c:forEach>

</table>

</body>
</html>