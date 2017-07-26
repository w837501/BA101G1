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

<script type="text/javascript" src="js/pic_preview.js"></script>

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
			
				<div > 
					  <h3>�ӫ~�ק�</h3>
 				</div> 
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do" name="form1" enctype="multipart/form-data">
				<table border="0">
				<tr>
		<td>�ӫ~�s��:</td>
		<td><%=productVO.getPro_id() %></td>
	</tr>
	<tr>
		<td>�Ӯa�s��:</td>
		<td><%=productVO.getStore_id() %></td>
	</tr>
	<tr>
		<td>�ӫ~�W��:</td>
		<td><input type="text" name="pro_name" size="45" value="<%=productVO.getPro_name()%>" />
	</tr>
	<jsp:useBean id="productclassSvc" scope="page" class="com.product_class.model.ProductClassService" />
	<tr>
		<td>�ӫ~���O:</td>
		<td><select size="1" name="pc_id">
			<c:forEach var="ProductClassVO" items="${productclassSvc.all}">
				<option value="${ProductClassVO.pc_id}" ${(productVO.pc_id==ProductClassVO.pc_id)? 'selected':'' } >${ProductClassVO.pc_name}
			</c:forEach>
		</select></td>
	</tr>
	<tr>
		<td>�ӫ~���:</td>
		<td><input type="text" name="pro_price" size="45" value="<%=productVO.getPro_price()%>" />
	</tr>
	<tr>
		<td>�ӫ~���A:</td>
		<td><select name="pro_state">
			<option value='�W�[' ${(productVO.pro_state=='�W�[') ? 'selected':''}>�W�[</option>
			<option value='�U�[' ${(productVO.pro_state=='�U�[') ? 'selected':''}>�U�[</option></select> </td>
	</tr>
	<tr>
		<td>�ӫ~�Ϥ�:</td>
			<td>
			<input type="file" name="pro_image" id="upfile1">
			 <p>
    			<img src="<%=request.getContextPath()%>/ProDBGifReader?pro_id=${productVO.pro_id}" id="image" style="max-width: 150px; max-height: 150px;">
			</p>
			</td>
	</tr>
		<tr>
		<td>�ӫ~����:</td>
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