<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.orderlist.model.*" %> 
<%@ page import="java.util.*"%>


<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>吃訂我線上訂餐系統</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
<style>
	#mem-button{
		display:table-cell;
		vertical-align: middle;
	}
	#mem-button div{
		border-width:2px;
		border-style:solid;
		border-color:#fff;
		width:150px;
		height:40px;
		margin:0 auto;
		color:#fff;
		font-size:15px;
		line-height: 40px;
		text-align: center;
		background: #D6656A;
		border-radius: 5px;
		margin-bottom: 30px;
	}

	a{
		text-decoration:none;
	}
	
</style>
</head>
<body>
	<%
		
		String order_id=(String) request.getParameter("order_id");
		Store_OrderService storeorderSvc=new Store_OrderService();
		int amount1=storeorderSvc.getOneOrder(order_id).getTotalprice();
		pageContext.setAttribute("amount1", amount1);
	%>
	<div id="page">
		<div id="header">
			<jsp:include page="/header_member.jsp"></jsp:include>
		</div>

		<div class="contents" style="margin-top:30px;margin-bottom:500px;">
			
				<div id="mem-button" style="margin-left:50px;float:left;">
				    <h1>我的帳戶</h1><br>
						
						<a href="<%=request.getContextPath() %>/frontend/mem/member_info_update.jsp" class="list-group-item">
							<div>修改資料</div>
						</a>
						<a href="<%=request.getContextPath()%>/frontend/mem/member_info_order.jsp " class="list-group-item">
							<div>查詢訂單</div>
						</a>
						<a href="<%=request.getContextPath()%>/frontend/mem/member_report.jsp " class="list-group-item">
							<div>查詢檢舉</div>
						</a>
				</div>

				<div style="width:650px;float:right;margin-top:20px;margin-right:50px;">
					<div> 
						<h3>會員詳細訂單明細</h3>
						<hr color="#FFFFFF">
	 				</div> 
                    
                    <table border='1' bordercolor='#CCCCFF' width='600'>
                    	<tr>
                    		<th>商品圖片</th>
                       		<th>商品名稱</th>
                       		<th>商品數量</th>
                    		<th>單價</th>
                    	</tr>
                    	<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductService"></jsp:useBean>
                    	<jsp:useBean id="orderSvc" scope="page" class="com.order.model.Store_OrderService"></jsp:useBean>
                    	<c:forEach var="orderlistVO" items="${orderlistVO}">
                    	<tr align='center' valign='middle'>
                    		<td>
                    			<div class="frame">
									<img src="<%=request.getContextPath()%>/ProDBGifReader?pro_id=${orderlistVO.getPro_id()}" alt="Img" height="80" width="87">
								</div>
							</td>
                    		<td>${productSvc.getOnePro(orderlistVO.pro_id).pro_name}</td>
							<td>${orderlistVO.order_amount}</td>
                    		<td>${orderlistVO.price}</td>
                    		
                    	</tr>
                    	</c:forEach>
							<tr>
								<td></td>
								<td></td>
								<td>Subtotal:</td>
								<td>$<%=amount1 %></td>   
							</tr>
                    </table>		
				</div>
			</div>			
		</div>	
		<div id="footer">
			<jsp:include page="/footer.jsp"/>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>