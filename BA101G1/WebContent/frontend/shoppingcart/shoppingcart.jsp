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
	<title>Shopping Cart - Eternal Beauty Essentials Website Template</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<!--[if IE]>
		<link rel="stylesheet" href="css/ie.css" type="text/css" charset="utf-8">
	<![endif]-->
	
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<%
		String amount =  (String) request.getAttribute("amount");
		Vector<ProductVO> buylist = (Vector<ProductVO>) session.getAttribute("shoppingcart");
	%>
	

	<div id="page">
	<%if (buylist != null && (buylist.size() > 0)) {%>
		<div id="header">
			<div id="logo">
				<a href="index.html"><img src="<%=request.getContextPath()%>/images/logo.png" alt="LOGO"></a>
			</div>
		</div>
		<div id="contents">
			<div id="sidebar">
				<h1>購物車</h1>
			</div>

				<div id="main02" >   
				<form action="index.html" method="post" id="cart">
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
					
					<div class="col-xs-12 col-sm-8"></div>
					<div class="col-xs-12 col-sm-4">
					
					<a href="<%=request.getContextPath()%>/store/store.do?action=getProduct_By_Store&store_id=<%=productVO1.getStore_id() %>" class="btn btn-info"><i class="glyphicon glyphicon-ok"></i>繼續購物</a>
					<form name="checkoutForm" action="<%=request.getContextPath()%>/product/product.do" method="POST">
              		<input type="hidden" name="action"	value="Checkout"> 
              		<input type="submit" value="付款結帳">
          			</form>
          			</div>
				</form>
				</div>
		</div>
	    <%}%>	
		
		<div id="footer">
			<ul class="navigation">
				<li>
					<a href="index.html">Home</a>
				</li>
				<li>
					<a href="news.html">Whats New</a>
				</li>
				<li class="selected">
					<a href="cosmetics.html">Cosmetics</a>
				</li>
				<li>
					<a href="skincare.html">Skincare</a>
				</li>
				<li>
					<a href="fragrance.html">Fragrance</a>
				</li>
				<li>
					<a href="about.html">About</a>
				</li>
				<li>
					<a href="blogs.html">Blog</a>
				</li>
				<li>
					<a href="contact.html">Contact</a>
				</li>
			</ul>
			<p id="footnote">
			</p>
		</div>
	</div>
</body>
</html>