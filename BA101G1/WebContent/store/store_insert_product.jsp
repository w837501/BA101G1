<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.order.model.*"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
StoreVO storeVO=(StoreVO)session.getAttribute("storeVO");
ProductVO productVO=(ProductVO)request.getAttribute("productVO");
%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script language="JavaScript" src="js/pic_preview.js"></script>
<title>吃訂我線上訂餐系統</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
</head>
<body>
	<div id="page">
		<div id="header">
			<jsp:include page="/header.jsp"></jsp:include>
		</div>

		<div class="container" style="margin-bottom:180px;">
			<div class="row">
				<div class="col-xs-12 col-sm-3">
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath() %>/frontend/mem/member_info_update.jsp" class="list-group-item">修改資料</a>
					</div>
					
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/frontend/mem/member_info_order.jsp " class="list-group-item">查詢訂單</a>
					</div>
				</div>
				<div class="col-xs-12 col-sm-7" >

			
				<div class="page-header"> 
					  <h1>商品新增</h1>
 				</div> 
 				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do" name="form1" enctype="multipart/form-data">
				<div class="form-group">
					<br> <label for="pro_name" class="col-xs-12 col-sm-3 control-label">商品名稱</label> 
					<div class="col-xs-12 col-sm-6">
					<input type="text" name="pro_name" id="pro_name"
						placeholder="請輸入商品名稱"
						value="<%=(productVO == null) ? "珍奶" : productVO.getPro_name()%>">
					</div>
					<div class="col-xs-12 col-sm-3">
						<span class='error1_name' style="margin-left:-60px;"></span>
						<img src="" id="error_img_name">
						<span class='correct_name' style="margin-left:-100px;"></span> 
						<img src="" id="correct_img_name"> 
					</div>
				</div>
				<div class="form-group">
				<jsp:useBean id="productclassSvc" scope="page" class="com.product_class.model.ProductClassService" />
					<br> <label for="pc_id" class="col-xs-12 col-sm-3 control-label">商品名稱</label> 
					<div class="col-xs-12 col-sm-6">
					<select size="1" name="pc_id">
					<c:forEach var="ProductClassVO" items="${productclassSvc.all}">
					<option value="${ProductClassVO.pc_id}" ${(productVO.pc_id==ProductClassVO.pc_id)? 'selected':'' } >${ProductClassVO.pc_name}
					</c:forEach>
					</select>
					</div>
					<div class="col-xs-12 col-sm-3">
						<span class='error1_name' style="margin-left:-60px;"></span>
						<img src="" id="error_img_name">
						<span class='correct_name' style="margin-left:-100px;"></span> 
						<img src="" id="correct_img_name"> 
					</div>
				</div>
				<div class="form-group">
					<br> <label for="pro_price" class="col-xs-12 col-sm-3 control-label">商品價格</label> 
					<div class="col-xs-12 col-sm-6">
					<input type="text" name="pro_price" id="pro_price"
						placeholder="請輸入商品價格"
						value="<%=(productVO == null) ? "50" : productVO.getPro_price()%>">
					</div>
					<div class="col-xs-12 col-sm-3">
						<span class='error1_price' style="margin-left:-60px;"></span>
						<img src="" id="error_img_price">
						<span class='correct_price' style="margin-left:-100px;"></span> 
						<img src="" id="correct_img_price"> 
					</div>
				</div>
				<div class="form-group">
					<br> <label for="pro_image" class="col-xs-12 col-sm-3 control-label">商品照片</label> 
					<div class="col-xs-12 col-sm-9">
					<input type="file" name="pro_image" id="upfile1" >
					<p>
						<img id="image"  style="max-width: 200px; max-height: 200px;">
					</p>
					</div>
				</div>
				<div class="form-group">
					<br> <label for="pro_content" class="col-xs-12 col-sm-3 control-label">商品狀態</label> 
					<div class="col-xs-12 col-sm-6">
						<select size="1" name="pro_state">
							<option value="上架">上架
							<option value="下架">下架</option></select>
					</div>
				</div>
				<div class="form-group">
					<br> <label for="pro_content" class="col-xs-12 col-sm-3 control-label">商品說明</label> 
					<div class="col-xs-12 col-sm-6">
					<input type="text" name="pro_content" id="pro_content"
						placeholder="請輸入商品說明"
						value="<%=(productVO == null) ? "50asdsd" : productVO.getPro_content()%>">
					</div>
					<div class="col-xs-12 col-sm-3">
						<span class='error1_content' style="margin-left:-60px;"></span>
						<img src="" id="error_img_content">
						<span class='correct_content' style="margin-left:-100px;"></span> 
						<img src="" id="correct_img_content"> 
					</div>
				</div>
				<br>
				<br>
				<br>
				<br>
				<br>
				<div class="form-group">
					<div class="col-xs-12 col-sm-4"></div>
					<div class="col-xs-12 col-sm-8">
						<input type="hidden" name="action" value="insert">
						<input type="hidden" name="store_id" value="<%=storeVO.getStore_id()%>">
						<input type="submit" value="送出新增"> 
					</div>
				</div>
				 </FORM>
				 </div>
				</div>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="/footer.jsp"></jsp:include>
		</div>

	<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
