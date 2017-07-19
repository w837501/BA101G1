<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*" %>
<% 
	StoreVO storeVO=(StoreVO)session.getAttribute("storeVO");
	ProductService proSvc=new ProductService();
	List<ProductVO> productlist=new LinkedList<ProductVO>();
	productlist=proSvc.getAllProductByStore(storeVO.getStore_id());
	pageContext.setAttribute("productlist", productlist);
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
					<h3>全部商品列表</h3>
 				</div> 
				<table border="1" cellpadding="10px" width="650px";>
				<tr>
					<th width="10%">圖片</th>
					<th>商品名稱</th>
					<th>價格</th>
					<th>商品狀態</th>
					<th width="30%">商品說明</th>
				</tr>
				<c:forEach var="product" items="${productlist}">
				<tr>
					<th width="10%">
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do">
						<a href="<%=request.getContextPath()%>/store/store_product_update.jsp?pro_id=${product.pro_id}"><IMG src="<%=request.getContextPath()%>/ProDBGifReader?pro_id=${product.pro_id}" height="100" width="100"></a>
					</th>
					<td>${product.pro_name}</td>
					<td>${product.pro_price}</td>
					<td>${product.pro_state}</td>
					<td width="30%">${product.pro_content}</td>
					</FORM>
				</tr>
				</c:forEach>
				</table>
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
