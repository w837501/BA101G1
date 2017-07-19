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
 store_orderVO=orderSvc.getOrderByState("未確認", store_id);
 pageContext.setAttribute("store_orderVO",store_orderVO);
%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>吃訂我線上訂餐系統</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
</head>

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

<body>
	<div id="page">
		<div id="header">
			<jsp:include page="/header_store.jsp"></jsp:include>
		</div>

		<div class="contents" style="margin-top:30px;margin-bottom:900px;">
			<div id="mem-button" style="margin-left:50px;float:left;">
				<h1>我的帳戶</h1><br>
							
				<a href="<%=request.getContextPath() %>/store/store_update.jsp" class="list-group-item">
					<div>修改資料</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_list_all_product.jsp " class="list-group-item">
					<div>查詢所有商品</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_order.jsp " class="list-group-item">
					<div>查詢所有訂單</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_order_notconfirm.jsp " class="list-group-item">
					<div>查詢未確認訂單</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_order_handleing.jsp " class="list-group-item">
					<div>查詢進行中訂單</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_order_finish.jsp " class="list-group-item">
					<div>查詢已完成訂單</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_report.jsp " class="list-group-item">
					<div>查詢檢舉</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_insert_product.jsp " class="list-group-item">
					<div>商品新增</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_insert_ad.jsp " class="list-group-item">
					<div>廣告新增</div>
				</a>
			</div>	
				
			<div style="width:650px;float:right;margin-top:20px;margin-right:50px;">
				<div>
					<h3>未確認訂單資料</h3>
 				</div> 
				<table border="1" bordercolor='#CCCCFF' cellpadding="5px" width="650px";>
					<tr>
						<th width="10%"><font size="2">訂單編號</font></th>
						<th width="10%"><font size="2">訂餐時間</font></th>
						<th width="10%"><font size="2">取餐時間</font></th>
						<th width="10%"><font size="2">金額</font></th>
						<th width="10%"><font size="2">取餐方式</font></th>
						<th width="10%"><font size="2">訂單狀態</font></th>
						<th width="10%"><font size="2">確認</font></th>
						<th width="10%"><font size="2">顯示</font></th>
					</tr>
				</table>
					<c:forEach var="store_orderVO" items="${store_orderVO}" >
					<table border="1" bordercolor='#CCCCFF' cellpadding="5px" width="650px";>
					<tr align='center' valign='middle'${(store_orderVO.order_id==param.order_id) ? 'bgcolor=#CCCCFF':''}>
						<td width="10%"><font size="2">
							<a href="<%=request.getContextPath()%>/frontend/selectOrder/orderlist.do?action=getOneOrder_For_DetailDisplay&order_id=${store_orderVO.order_id}">${store_orderVO.order_id}</a></font>
						</td>
						<td width="10%"><font size="2"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${store_orderVO.order_time }"/></font></td>
						<td width="10%"><font size="2"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${store_orderVO.order_taketime }"/></font></td>
						<td width="10%"><font size="2">${store_orderVO.totalprice }</font></td>
						<td width="10%"><font size="2">${store_orderVO.order_way }</font></td>
						<td width="10%"><font size="2">${store_orderVO.order_state }</font></td>
						<td width="10%"><font size="2">
							<form method="post" action="<%=request.getContextPath()%>/frontend/selectOrder/order.do">
							<input type="submit" value="確認">
							<input type="hidden" name="order_id" value="${store_orderVO.order_id}">
							<input type="hidden" name="store_id" value="${storeVO.store_id}">
							<input type="hidden" name="action" value="Confirm_Order">
							</form>
						</font>
						</td>
						<td width="10%">
							<input type="button" value="顯示" class="abc" >
						</td>
					</tr>
					<jsp:useBean id="orderlistSvc" scope="page" class="com.orderlist.model.OrderlistService"></jsp:useBean>
					<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductService"></jsp:useBean>
						<tr style="display: none;">
							<td colspan="2"></td>
							<td colspan="2" bgcolor="#FFBB66">商品名稱</td>		
							<td colspan="2" bgcolor="#FFBB66">數量</td>
							<td colspan="2" bgcolor="#FFBB66">總金額</td>
						</tr>
					<c:forEach var="orderlistVO" items="${orderlistSvc.getOrderlist(store_orderVO.order_id)}" >
					<tr style="display: none;">
						<td colspan="2"></td>
						<td colspan="2">${productSvc.getOnePro(orderlistVO.pro_id).pro_name}</td>		
						<td colspan="2">${orderlistVO.order_amount}</td>
				 		<td colspan="2">${orderlistVO.price}</td>
					</tr>
					</c:forEach>
				</table>
				 </c:forEach>
				 
					

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