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
<title>�Y�q�ڽu�W�q�\�t��</title>
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
						
				<h1>�ڪ��b��</h1><br>
							
				<a href="<%=request.getContextPath() %>/store/store_update.jsp" class="list-group-item">
					<div>�ק���</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_list_all_product.jsp " class="list-group-item">
					<div>�d�ߩҦ��ӫ~</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_order.jsp " class="list-group-item">
					<div>�d�ߩҦ��q��</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_order_notconfirm.jsp " class="list-group-item">
					<div>�d�ߥ��T�{�q��</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_order_handleing.jsp " class="list-group-item">
					<div>�d�߶i�椤�q��</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_order_finish.jsp " class="list-group-item">
					<div>�d�ߤw�����q��</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_report.jsp " class="list-group-item">
					<div>�d�����|</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_insert_product.jsp " class="list-group-item">
					<div>�ӫ~�s�W</div>
				</a>
				<a href="<%=request.getContextPath()%>/store/store_insert_ad.jsp " class="list-group-item">
					<div>�s�i�s�W</div>
				</a>
			
			</div>
				<div style="width:650px;float:right;margin-top:20px;margin-right:50px;">
					<div> 
						  <h3>�ӫ~�s�W</h3>
	 				</div> 
 				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do" name="form1" enctype="multipart/form-data">
				<div class="form-group">
					<br> <label for="pro_name" class="col-xs-12 col-sm-3 control-label">�ӫ~�W��</label> 
					<div class="col-xs-12 col-sm-6">
					<input type="text" name="pro_name" id="pro_name"
						placeholder="�п�J�ӫ~�W��"
						value="<%=(productVO == null) ? "�å�" : productVO.getPro_name()%>">
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
					<br> <label for="pc_id" class="col-xs-12 col-sm-3 control-label">�ӫ~�W��</label> 
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
					<br> <label for="pro_price" class="col-xs-12 col-sm-3 control-label">�ӫ~����</label> 
					<div class="col-xs-12 col-sm-6">
					<input type="text" name="pro_price" id="pro_price"
						placeholder="�п�J�ӫ~����"
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
					<br> <label for="pro_content" class="col-xs-12 col-sm-3 control-label">�ӫ~���A</label> 
					<div class="col-xs-12 col-sm-6">
						<select size="1" name="pro_state">
							<option value="�W�[">�W�[
							<option value="�U�[">�U�[</option></select>
					</div>
				</div>
				<div class="form-group">
					<br> <label for="pro_content" class="col-xs-12 col-sm-3 control-label">�ӫ~����</label> 
					<div class="col-xs-12 col-sm-6">
					<input type="text" name="pro_content" id="pro_content"
						placeholder="�п�J�ӫ~����"
						value="<%=(productVO == null) ? "50asdsd" : productVO.getPro_content()%>">
					</div>
					<div class="col-xs-12 col-sm-3">
						<span class='error1_content' style="margin-left:-60px;"></span>
						<img src="" id="error_img_content">
						<span class='correct_content' style="margin-left:-100px;"></span> 
						<img src="" id="correct_img_content"> 
					</div>
				</div>
				<div class="form-group">
					<br> <label for="pro_image" class="col-xs-12 col-sm-3 control-label">�ӫ~�Ӥ�</label> 
					<div class="col-xs-12 col-sm-9">
					<input type="file" name="pro_image" id="upfile1" >
					<p>
						<img id="image"  style="max-width: 200px; max-height: 200px;">
					</p>
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
						<input type="submit" value="�e�X�s�W"> 
					</div>
				</div>
				 </FORM>
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
