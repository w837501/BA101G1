<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.product.model.*"%>
<% 
	StoreVO storeVO=(StoreVO)session.getAttribute("storeVO");
	ProductService proSvc=new ProductService();
	String pro_id=request.getParameter("pro_id");
	ProductVO productVO=proSvc.getOnePro(pro_id);
	pageContext.setAttribute("productVO", productVO);
%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<title>�Y�q�ڽu�W�q�\�t��</title>
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
					    <a href="<%=request.getContextPath() %>/store/store_update.jsp" class="list-group-item">�ק���</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_list_all_product.jsp " class="list-group-item">�d�ߩҦ��ӫ~</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_order.jsp " class="list-group-item">�d�ߩҦ��q��</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_order_notconfirm.jsp " class="list-group-item">�d�ߥ��T�{�q��</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_order_handleing.jsp " class="list-group-item">�d�߶i�椤�q��</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_order_finish.jsp " class="list-group-item">�d�ߤw�����q��</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_report.jsp " class="list-group-item">�d�����|</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_insert_product.jsp " class="list-group-item">�ӫ~�s�W</a>
					</div>
					
				</div>
				<div class="col-xs-12 col-sm-7" >

			
				<div class="page-header"> 
					  <h1>�ӫ~��ƭק�</h1>
 				</div> 
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do" name="form1" enctype="multipart/form-data">
				<table border="0">
				<tr>
		<td>�ӫ~�s��:<font color=red><b>*</b></font></td>
		<td><%=productVO.getPro_id() %></td>
	</tr>
	<tr>
		<td>�Ӯa�s��:<font color=red><b>*</b></font></td>
		<td><%=productVO.getStore_id() %></td>
	</tr>
	<tr>
		<td>�ӫ~�W��:<font color=red><b>*</b></font></td>
		<td><input type="text" name="pro_name" size="45" value="<%=productVO.getPro_name()%>" />
	</tr>
	<jsp:useBean id="productclassSvc" scope="page" class="com.product_class.model.ProductClassService" />
	<tr>
		<td>�ӫ~���O:<font color=red><b>*</b></font></td>
		<td><select size="1" name="pc_id">
			<c:forEach var="ProductClassVO" items="${productclassSvc.all}">
				<option value="${ProductClassVO.pc_id}" ${(productVO.pc_id==ProductClassVO.pc_id)? 'selected':'' } >${ProductClassVO.pc_name}
			</c:forEach>
		</select></td>
	</tr>
	<tr>
		<td>�ӫ~���:<font color=red><b>*</b></font></td>
		<td><input type="text" name="pro_price" size="45" value="<%=productVO.getPro_price()%>" />
	</tr>
	<tr>
		<td>�ӫ~���A:<font color=red><b>*</b></font></td>
		<td><select name="pro_state">
			<option value='�W�[' ${(productVO.pro_state=='�W�[') ? 'selected':''}>�W�[</option>
			<option value='�U�[' ${(productVO.pro_state=='�U�[') ? 'selected':''}>�U�[</option></select> </td>
	</tr>
	<tr>
		<td>�ӫ~�Ϥ�:<font color=red><b>*</b></font></td>
			<td>
			<input type="file" name="pro_image" id="upfile1">
			 <p>
    			<img src="<%=request.getContextPath()%>/ProDBGifReader?pro_id=${productVO.pro_id}" id="image" style="max-width: 150px; max-height: 150px;">
			</p>
			</td>
	</tr>
		<tr>
		<td>�ӫ~����:<font color=red><b>*</b></font></td>
		<td><input type="text" name="pro_content" size="45" value="<%=productVO.getPro_content()%>" />
	</tr>
				
				 </table>
				<input type="hidden" name="action" value="update">
				<input type="hidden" name="pro_id" value="<%=productVO.getPro_id() %>">
				<input type="submit" value="�e�X�ק�">
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
