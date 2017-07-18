<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ page import="java.util.*" %>
<%@ page import="com.product.model.ProductVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>吃訂我線上訂餐系統</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
<script src="<%=request.getContextPath()%>/js/mobile.js" type="text/javascript"></script>
</head>
<body>
	<%
		String amount =  (String) session.getAttribute("amount");
		Vector<ProductVO> buylist = (Vector<ProductVO>) session.getAttribute("shoppingcart");
	%>
	<div id="page">
		<div id="header">
				<jsp:include page="/header_member.jsp"></jsp:include>
		</div>
		<%if (buylist != null && (buylist.size() > 0)) {%>
	
		<div id="contents">
			<div id="sidebar">
				<h1>購物車</h1>
			</div>

				<div id="main02" style="padding-left:100px;">   
				<form action="<%=request.getContextPath()%>/product/product.do" method="post" id="cart">
					<table frame="hsides">
						<thead>
							<tr bgcolor="#F5DEB3">
								<th>商品名稱</th>
								<th>價格</th>
								<th>數量</th>
								<th>小計</th>
								<th class="last-child"></th>
							</tr>
						</thead>
						<%ProductVO productVO1 = buylist.get(0); %>
						<%	
	 						for (int index = 0; index < buylist.size(); index++) {
	 							ProductVO productVO = buylist.get(index);
						%>
						<tbody>
							<tr bgcolor=#F5DEB3>
								<td><div class="frame">
										<img src="<%=request.getContextPath()%>/ProDBGifReader?pro_id=<%= productVO.getPro_id()%>" alt="Img" height="80" width="87">
									</div>
								
									<span class="title"><%=productVO.getPro_name() %></span>
								</td>
								<td><%=productVO.getPro_price() %></td>
								<td><%=productVO.getQuantity() %></td>
								<td><span class="total">$ <%=(Integer)productVO.getPro_price()*(Integer)productVO.getQuantity() %></span></td>
								<td>
								<form name="deleteForm" action="<%=request.getContextPath()%>/product/product.do" method="POST">
                                <input type="hidden" name="action" value="DELETE">
                                <input type="hidden" name="del" value="<%=index%>">
                                <input type="submit" value="刪除">
								</form></td>
							</tr>
						</tbody>
						<%}%>
						<tfoot>
							<tr>
								<td></td>
								<td></td>
								<td>Subtotal:</td>
								<td>$<%=amount%></td>
								<td></td>
							</tr>
						</tfoot>
					</table>
					
					
					<div style="float:right;">
						<form name="checkoutForm" action="<%=request.getContextPath()%>/product/product.do" method="POST">
		              		<input type="hidden" name="action"	value="Checkout"> 
		              		<input type="submit" value="付款結帳">
	          			</form>
          			</div>
					<div style="float:right; padding-right:30px;">
						<a href="<%=request.getContextPath()%>/store/store.do?action=getProduct_By_Store&store_id=<%=productVO1.getStore_id() %>">繼續購物</a>
					</div>
				</form>
				</div>
		</div>
	   <%}%>
	   <%if (buylist.size() == 0) {%>
	    	
		<a href="<%=request.getContextPath()%>/store/storeClass.jsp">購物車已無東西，請點擊繼續購買商品</a>
		<%} %>
		
		<div id="footer">
			<jsp:include page="/footer.jsp"/>
		</div>
	</div>
</body>
</html>