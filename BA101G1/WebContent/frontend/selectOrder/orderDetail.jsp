<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.orderlist.model.*" %> 
<%@ page import="java.util.*"%>


<html>
<head>
<title>��@�q��ԲӸ�� - listOneOrderList.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� Script ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�q���T - Order_Detail.jsp</h3>
		<a href="<%=request.getContextPath()%>/frontend/selectOrder/selectOrder.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>
<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductService"></jsp:useBean>
<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�q��s��</th>
		<th>�ӫ~�W��</th>
		<th>�ƶq</th>
		<th>���</th>
	</tr>
	<c:forEach var="orderlistVO" items="${orderlistVO}" >
	<tr align='center' valign='middle'>
		<td>${orderlistVO.order_id}</td>
		<td>${productSvc.getOnePro(orderlistVO.pro_id).pro_name}</td>		
		<td>${orderlistVO.order_amount}</td>
 		<td>${orderlistVO.price}</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>