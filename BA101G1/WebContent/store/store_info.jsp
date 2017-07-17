<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.store.model.*"%>
<% 
	StoreVO storeVO=(StoreVO)session.getAttribute("storeVO");
%>
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
					  <h1><%=storeVO.getStore_name() %>資料</h1>
 				</div> 
 				<div class="col-xs-12 col-sm-7" >
 				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do" name="form1" enctype="multipart/form-data">
				<table border='0'>
				<tr>
		<th>商家編號</th>
		<td><%=storeVO.getStore_id() %></td>
	</tr>
	<tr>
		<th>商家名稱</th>
		<td><%=storeVO.getStore_name() %></td>
	</tr>
	<jsp:useBean id="storeclassSvc" scope="page" class="com.store_class.model.StoreClassService" />
	<tr>
		<th>商家類別</th>
		<td><c:forEach var="StoreClassVO" items="${storeclassSvc.all}">
									<c:if test="${StoreClassVO.sc_id eq storeVO.sc_id }">
								<option value="${StoreClassVO.sc_id}" >${StoreClassVO.sc_name}
								</c:if>
							</c:forEach></td>
	</tr>
	<tr>
		<th>商家帳號</th>
		<td><%=storeVO.getStore_acc() %></td>
	</tr>
	<tr>
		<th>商家電話</th>
		<td><%=storeVO.getStore_phone() %></td>
	</tr>
	<tr>
		<th>商家地址</th>
		<td><%=storeVO.getStore_addr() %> </td>
	</tr>
	<tr>
		<th>商家圖片</th>
			<td><img src="<%=request.getContextPath()%>/StoreReader?store_id=${storeVO.store_id}" id="image" style="max-width: 150px; max-height: 150px;">
			</td>
	</tr>
		<tr>
			<th>商家簡介</th>
			<td><%=storeVO.getStore_content() %></td>
		</tr>
		<tr>
		<tr>
			<th>商家是否外送</th>
			<td><%=storeVO.getStore_out() %></td>
		</tr>
		<tr>
			<th>商家地區</th>
			<td><%=storeVO.getStore_zone() %></td>
		</tr>
		<tr>
			<th>商家狀態</th>
			<td><%=storeVO.getStore_state() %></td>
		</tr>
				 </table>
				 </FORM>
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
