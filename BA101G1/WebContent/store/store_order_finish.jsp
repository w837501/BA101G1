<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.order.model.*"%>
<%@ page import="java.util.*"%>
<% 
StoreVO storeVO=(StoreVO)session.getAttribute("storeVO");
Store_OrderService orderSvc=new Store_OrderService();
String store_id=storeVO.getStore_id();
List<Store_OrderVO> store_orderVO=new LinkedList<Store_OrderVO>();
 store_orderVO=orderSvc.getOrderByState("已取餐", store_id);
 pageContext.setAttribute("store_orderVO",store_orderVO);
%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<title>吃訂我線上訂餐系統</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
</head>
<body>
	<div id="page">
		<div id="header">
			<jsp:include page="/header_store.jsp"></jsp:include>
		</div>

		<div class="container" style="margin-bottom:180px;">
			<div class="row">
				<div class="col-xs-12 col-sm-3">
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath() %>/store/store_update.jsp" class="list-group-item">修改資料</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_list_all_product.jsp " class="list-group-item">查詢所有商品</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_order.jsp " class="list-group-item">查詢所有訂單</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_order_notconfirm.jsp " class="list-group-item">查詢未確認訂單</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_order_handleing.jsp " class="list-group-item">查詢進行中訂單</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_order_finish.jsp " class="list-group-item">查詢已完成訂單</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_report.jsp " class="list-group-item">查詢檢舉</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_insert_product.jsp " class="list-group-item">商品新增</a>
					</div>
					
				</div>
				<div class="col-xs-12 col-sm-7" >

			
				<div class="page-header"> 
					  <h1>完成訂單資料</h1>
 				</div> 
				<table border='1' bordercolor='#CCCCFF' width='600'>
					<tr>
						<th width="16%">訂單編號</th>
						<th width="16%">訂餐時間</th>
						<th width="16%">取餐時間</th>
						<th width="16%">總金額</th>
						<th width="16%">取餐方式</th>
						<th width="16%">訂單狀態</th>
					</tr>
				</table>
					<c:forEach var="store_orderVO" items="${store_orderVO}" >
				<table border='1' bordercolor='#CCCCFF' width='600'>
					<tr align='center' valign='middle'>
						<td width="16%">
							<a href="<%=request.getContextPath()%>/frontend/selectOrder/orderlist.do?action=getOneOrder_For_DetailDisplay&order_id=${store_orderVO.order_id}">${store_orderVO.order_id}</a>
						</td>
				
						<td width="16%"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${store_orderVO.order_time }"/></td>
						<td width="16%"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${store_orderVO.order_taketime }"/></td>
						<td width="16%">${store_orderVO.totalprice }</td>
						<td width="16%">${store_orderVO.order_way }</td>
						<td width="16%">${store_orderVO.order_state }</td>
						<td>
							<input type="button" value="Show" class="abc" ></Button>
						</td>
					</tr>
					<jsp:useBean id="orderlistSvc" scope="page" class="com.orderlist.model.OrderlistService"></jsp:useBean>
					<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductService"></jsp:useBean>
					<c:forEach var="orderlistVO" items="${orderlistSvc.getOrderlist(store_orderVO.order_id)}" >
					<tr style="display: none;">
						<td>${productSvc.getOnePro(orderlistVO.pro_id).pro_name}</td>		
						<td>${orderlistVO.order_amount}</td>
				 		<td>${orderlistVO.price}</td>
					</tr>
					</c:forEach>
				</table>
					</c:forEach>
				</div>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="/footer.jsp"></jsp:include>
		</div>

	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
<script type="text/javascript">
$(".abc").on('click',function(){
	console.log($(".abc").index(this))
	var father=$(".abc").eq($(".abc").index(this)).parent().parent().siblings();
	father.toggle();
})
 
</script>