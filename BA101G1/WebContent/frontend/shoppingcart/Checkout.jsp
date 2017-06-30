<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="java.util.* "%>
<%@ page import="com.product.model.* "%>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Mode II 範例程式 - Checkout.jsp</title>
</head>
<body bgcolor="#FFFFFF">
<img src="images/tomcat.gif"> <font size="+3"> 結帳 </font>
<hr><p>

<table border="1" width="720">
	<tr bgcolor="#999999">
		<th width="200">商品圖片</th>
		<th width="100">商品名稱</th>
		<th width="100">商品價格</th>
		<th width="100">數量</th>
		<th width="100">小計</th>
		<th width="120"></th>
	</tr>
	
	<%
		Vector<ProductVO> buylist = (Vector<ProductVO>) session.getAttribute("shoppingcart");
		String amount =  (String) request.getAttribute("amount");
	%>	
	<%ProductVO productVO1 = buylist.get(0); %>
	<%	for (int i = 0; i < buylist.size(); i++) {
			ProductVO productVO = buylist.get(i);
			String name = productVO.getPro_name();
			int price = (Integer)productVO.getPro_price();
			int quantity = productVO.getQuantity();
	%>
	<tr>
		<td width="200"><div align="center"><b><img src="<%=request.getContextPath()%>/ProductReader?pro_id=<%= productVO.getPro_id()%>" width="150" height="120"></b></div></td>
		<td width="100"><div align="center"><b><%=name%></b></div></td>
		<td width="100"><div align="center"><b><%=price%></b></div></td>
		<td width="100"><div align="center"><b><%=quantity%></b></div></td>
		<td width="100"><div align="center"><b><%=price*quantity %></b></div></td>
		<td width="100"><div align="center"><b></b></div></td>
	</tr>
	<%
		}
	%>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td><div align="center"><font color="red"><b>總金額：</b></font></div></td>
		<td></td>
		<td> <font color="red"><b>$<%=amount%></b></font> </td>
	</tr>
</table>
<p><a href="<%=request.getContextPath()%>/store/store.do?action=getProduct_By_Store&store_id=<%=productVO1.getStore_id() %>">是否繼續購物</a>
</body>
</html>
