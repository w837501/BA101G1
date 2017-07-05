<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ page import="java.util.*" %>
<%@ page import="com.product.model.ProductVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>Title Page</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		
		<style type="text/css">
		#header{
			height: 200px;
			background-color: #F5F5DC;
		}
		/*LOGO*/
		#page div#header a img{
			float:left;
			margin:20px 0  0 220px;
			width:160px;
		}
		.table-hover tbody tr:hover{
			background-color: #fa0;
		}	
		div>p{
			font-size: 30px;
		}
		th{
			font-size: 25px;
		}
		td{
			font-size: 20px;
		}
		</style>	
	</head>
	
	
	<body>
	
	<%Vector<ProductVO> buylist = (Vector<ProductVO>) session.getAttribute("shoppingcart");%>
	<%if (buylist != null && (buylist.size() > 0)) {%>
	<div id="page">
		<div id="header">
			<a href="index.html">
				<img src="C:/Users/Java/git/BA101G1_fat/BA101G1/WebContent/FakeInfo/LOGO.png" width="150px" height="150">
			</a>
		</div>
	</div>
	    <div class="col-xs-12 col-sm-4  ee" align="right">
			<font size="30">購物車</font>
	    </div>
		<div class="col-xs-12 col-sm-8  ff"></div>
		
		
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12">
					<table class="table table-hover table-condensed  ">
						<thead>
							<tr>
								<th></th>
								<th>商品名稱</th>
								<th>價格</th>
								<th>數量</th>
								<th>小計</th>
								<th></th>
							</tr>
						</thead>
						<%ProductVO productVO1 = buylist.get(0); %>
						<%	
	 						for (int index = 0; index < buylist.size(); index++) {
	 							ProductVO productVO = buylist.get(index);
						%>
						
						<tbody>
						
							<tr>
								<td align="center"><img src="<%=request.getContextPath()%>/ProductClassReader?pro_id=<%= productVO.getPro_id()%>" width="150" height="120"></td>
								<td><%=productVO.getPro_name() %></td>
								<td><%=productVO.getPro_price() %></td>
								<td><%=productVO.getQuantity() %></td>
								<td><%=(int)productVO.getPro_price()*(int)productVO.getQuantity() %></td>
								<td>
								<form name="deleteForm" action="Shopping.html" method="POST">
                                <input type="hidden" name="action" value="DELETE">
                                <input type="hidden" name="del" value=" ">
                                <input type="submit" value="刪除">
								</form></td>
							</tr>
						
						</tbody>
							<%}%>
					</table>
					<hr>
				</div>		
			</div>
		</div>

		<div class="col-xs-12 col-sm-8  cc"></div>
		<div class="col-xs-12 col-sm-4  dd">
			<br><br>
			<a href="<%=request.getContextPath()%>/store/store.do?action=getProduct_By_Store&store_id=<%=productVO1.getStore_id() %>" class="btn btn-info"><i class="glyphicon glyphicon-ok"></i>回商店/繼續購物</a>
			<form name="checkoutForm" action="<%=request.getContextPath()%>/product/product.do" method="POST">
              <input type="hidden" name="action"	value="Checkout"> 
              <input type="submit" value="付款結帳">
          	</form>
		</div>


		<%System.out.println(buylist.size());%>
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<%}%>	
	</body>
</html>