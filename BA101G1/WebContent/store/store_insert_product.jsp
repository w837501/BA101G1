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
<script language="JavaScript" src="js/pic_preview.js"></script>
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
					  <h3>商品新增</h3>
	 			</div> 
	 				
	 			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do" name="form1" enctype="multipart/form-data">
					<div class="form-group">
						商品名稱
						<input type="text" name="pro_name" id="pro_name" placeholder="請輸入商品名稱" value="<%=(productVO == null) ? "珍奶" : productVO.getPro_name()%>">
					</div>
					
				
					<div class="form-group">
					<jsp:useBean id="productclassSvc" scope="page" class="com.product_class.model.ProductClassService" />
							
						<table>
							<tr>
								<td>商品類別</td>
								<td>
									<select size="1" name="pc_id">
										<c:forEach var="ProductClassVO" items="${productclassSvc.all}">
											<option value="${ProductClassVO.pc_id}" ${(productVO.pc_id==ProductClassVO.pc_id)? 'selected':'' } >${ProductClassVO.pc_name}
										</c:forEach>
									</select>
								</td>
							</tr>
						</table>
						
					</div>
						
					<div class="form-group">
						商品價格 
						<input type="text" name="pro_price" id="pro_price"
							placeholder="請輸入商品價格"
							value="<%=(productVO == null) ? "50" : productVO.getPro_price()%>">
					</div>
					
					<div class="form-group" style="padding-bottom:30px;">
						<table>
							<tr>
								<td>商品狀態</td>
								<td>
									<select size="1" name="pro_state">
										<option value="上架">上架
										<option value="下架">下架</option></select>
								</td>
							</tr>
						</table>
					</div>
					
					<div class="form-group">
						商品說明
						<input type="text" name="pro_content" id="pro_content"
							placeholder="請輸入商品說明"
							value="<%=(productVO == null) ? "50asdsd" : productVO.getPro_content()%>">
					</div>
					
					<div class="form-group">
						商品照片
						<input type="file" name="pro_image" id="upfile1" >
						<p>
							<img id="image"  style="max-width: 200px; max-height: 200px;">
						</p>
					</div>
					
					<div class="form-group">
						<input type="hidden" name="action" value="insert">
						<input type="hidden" name="store_id" value="<%=storeVO.getStore_id()%>">
						<input type="submit" value="送出新增"> 
					</div>
				 </FORM>
				</div>
			</div>
		<div id="footer">
			<jsp:include page="/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
