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
<script language="JavaScript" src="js/pic_preview.js"></script>

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
					  <h1>商家資料修改</h1>
 				</div> 
				<FORM METHOD="post" ACTION="<%=request.getContextPath() %>/store/store.do" name="form1" enctype="multipart/form-data">
<table border="0">
<tr>
		<td>商家編號:<font color=red><b>*</b></font></td>
		<td><%=storeVO.getStore_id() %></td>
	</tr>
	<tr>
		<td>商家名稱:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_name" size="45" value="<%=storeVO.getStore_name()%>" />
	</tr>
	<jsp:useBean id="storeclassSvc" scope="page" class="com.store_class.model.StoreClassService" />
	<tr>
		<td>商家類別:<font color=red><b>*</b></font></td>
		<td><select size="1" name="sc_id">
			<c:forEach var="StoreClassVO" items="${storeclassSvc.all}">
				<option value="${StoreClassVO.sc_id}" ${(storeVO.sc_id==StoreClassVO.sc_id)? 'selected':'' } >${StoreClassVO.sc_name}
			</c:forEach>
		</select></td>
	</tr>
	
	<tr>
		<td>商家簡介:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_content" size="45" value="<%=storeVO.getStore_content()%>" />
	</tr>
	<tr>
		<td>商家電話:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_phone" size="45" value="<%=storeVO.getStore_phone()%>" />
	</tr>
	<tr>
		<td>商家地址:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_addr" size="45" value="<%=storeVO.getStore_addr()%>" />
	</tr>
	<tr>
		<td>店家圖片:<font color=red><b>*</b></font></td>
			<td>
			<input type="file" name="store_image" id="upfile1">
			 <p>
    			<img src="<%=request.getContextPath()%>/StoreReader?store_id=${storeVO.store_id}" id="image" style="max-width: 150px; max-height: 150px;">
			</p>
			</td>
	</tr>
	<tr>
		<td>商家帳號:<font color=red><b>*</b></font></td>
		<td><%=storeVO.getStore_acc() %></td>
	</tr>
	<tr>
		<td>商家密碼:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_pw" size="45" value="<%=storeVO.getStore_pw()%>" />
	</tr>
	<tr>
		<td>商家是否外送:<font color=red><b>*</b></font></td>
		<td><select name="store_out">
			<option value='有外送' ${(storeVO.store_out=='有外送') ? 'selected':''}>有外送</option>
			<option value='沒有外送' ${(storeVO.store_out=='沒有外送') ? 'selected':''}>沒有外送</option></select> </td>
	</tr>
	<tr>
			<td>商家地區 :<font color=red><b>*</b></font></td>
			<td><select size="1" name="store_zone">
							<option value="基隆市" ${(storeVO.store_zone=='基隆市') ? 'selected':''}>基隆市
							<option value="臺北市" ${(storeVO.store_zone=='臺北市') ? 'selected':''}>臺北市
							<option value="新北市" ${(storeVO.store_zone=='新北市') ? 'selected':''}>新北市
							<option value="桃園市" ${(storeVO.store_zone=='桃園市') ? 'selected':''}>桃園市
							<option value="新竹市" ${(storeVO.store_zone=='新竹市') ? 'selected':''}>新竹市
							<option value="新竹縣" ${(storeVO.store_zone=='新竹縣') ? 'selected':''}>新竹縣
							<option value="苗栗縣" ${(storeVO.store_zone=='苗栗縣') ? 'selected':''}>苗栗縣
							<option value="臺中市" ${(storeVO.store_zone=='臺中市') ? 'selected':''}>臺中市
							<option value="彰化縣" ${(storeVO.store_zone=='彰化縣') ? 'selected':''}>彰化縣
							<option value="南投縣" ${(storeVO.store_zone=='南投縣') ? 'selected':''}>南投縣
							<option value="雲林縣" ${(storeVO.store_zone=='雲林縣') ? 'selected':''}>雲林縣
							<option value="嘉義市" ${(storeVO.store_zone=='嘉義市') ? 'selected':''}>嘉義市
							<option value="嘉義縣" ${(storeVO.store_zone=='嘉義縣') ? 'selected':''}>嘉義縣
							<option value="臺南市" ${(storeVO.store_zone=='臺南市') ? 'selected':''}>臺南市
							<option value="高雄市" ${(storeVO.store_zone=='高雄市') ? 'selected':''}>高雄市
							<option value="屏東縣" ${(storeVO.store_zone=='屏東縣') ? 'selected':''}>屏東縣
							<option value="臺東縣" ${(storeVO.store_zone=='臺東縣') ? 'selected':''}>臺東縣
							<option value="花蓮縣" ${(storeVO.store_zone=='花蓮縣') ? 'selected':''}>花蓮縣
							<option value="宜蘭縣" ${(storeVO.store_zone=='宜蘭縣') ? 'selected':''}>宜蘭縣
							
					</select></td>
	</tr>
	</table>
	<br>
			<input type="hidden" name="action" value="update">
			<input type="hidden" name="store_id" value="<%=storeVO.getStore_id() %>">
			<input type="hidden" name="store_acc" value="<%=storeVO.getStore_acc() %>">
			<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
			<input type="submit" value="送出修改"></FORM>
				 
					

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
