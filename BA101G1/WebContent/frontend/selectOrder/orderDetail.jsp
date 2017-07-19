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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<title>吃訂我線上訂餐系統</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
</head>
<body>
	<%
		String amount1 =  (String) session.getAttribute("amount1");
	%>
	<div id="page">
		<div id="header">
			<jsp:include page="/header_member.jsp"></jsp:include>
		</div>

		<div class="container" style="margin-bottom:180px;">
			<div class="row">
				<div id="sidebar">
				    <div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath() %>/frontend/mem/member_info_update.jsp" class="list-group-item">修改資料</a>
					</div>
					
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/frontend/mem/member_info_order.jsp " class="list-group-item">查詢訂單</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/frontend/mem/member_report.jsp " class="list-group-item">查詢檢舉</a>
					</div>
				</div>

				<div id="main">
					<div class="page-header"> 
						<h1>會員詳細訂單紀錄</h1>
 				    </div> 
                    
                    <table border='1' bordercolor='#CCCCFF' width='600'>
                    	<tr>
                    		<th>商品圖片</th>
                       		<th>商品名稱</th>
                       		<th>商品數量</th>
                    		<th>單價</th>
                    	</tr>
                    	<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductService"></jsp:useBean>
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
                    		<td></td>
                    		
                    	</tr>
                    	</c:forEach>
							<tr>
								<td></td>
								<td></td>
								<td>Subtotal:</td>
								<td>$<%=amount1%></td>   
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