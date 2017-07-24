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
<title>吃訂我線上訂餐系統</title>
<script language="JavaScript" src="js/pic_preview.js"></script>
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
					<h1>商家資料修改</h1>
	 			</div> 
				<FORM METHOD="post" ACTION="<%=request.getContextPath() %>/store/store.do" name="form1" enctype="multipart/form-data">
				
					<table border="0">
						<tr>
							<td>商家編號:<font color=red><b>*</b></font></td>
							<td><%=storeVO.getStore_id() %></td>
						</tr>
						<tr>
							<td>商家名稱:</td>
							<td><input type="text" name="store_name" size="45" value="<%=storeVO.getStore_name()%>" />
						</tr>
						
						<jsp:useBean id="storeclassSvc" scope="page" class="com.store_class.model.StoreClassService" />
						
						<tr>
							<td>商家類別:</td>
							<td><select size="1" name="sc_id">
								<c:forEach var="StoreClassVO" items="${storeclassSvc.all}">
									<option value="${StoreClassVO.sc_id}" ${(storeVO.sc_id==StoreClassVO.sc_id)? 'selected':'' } >${StoreClassVO.sc_name}
								</c:forEach>
							</select></td>
						</tr>
						
						<tr>
							<td>商家簡介:</td>
							<td><input type="text" name="store_content" size="45" value="<%=storeVO.getStore_content()%>" />
						</tr>
						<tr>
							<td>商家電話:</td>
							<td><input type="text" name="store_phone" size="45" value="<%=storeVO.getStore_phone()%>" />
						</tr>
						<tr>
							<td>商家地址:</td>
							<td><input type="text" name="store_addr" size="45" value="<%=storeVO.getStore_addr()%>" />
						</tr>
						<tr>
							<td>店家圖片:</td>
							<td>
						    	<img src="<%=request.getContextPath()%>/StoreReader?store_id=${storeVO.store_id}" id="image" style="max-width: 150px; max-height: 150px;">
								<input type="file" name="store_image" id="upfile1">
							</td>
						</tr>
						<tr>
							<td>商家帳號:</td>
							<td><%=storeVO.getStore_acc() %></td>
						</tr>
						<tr>
							<td>商家密碼:</td>
							<td><input type="password" name="store_pw" size="45" value="<%=storeVO.getStore_pw()%>" />
						</tr>
						<tr>
							<td>商家是否外送:</td>
							<td><select name="store_out">
								<option value='有外送' ${(storeVO.store_out=='有外送') ? 'selected':''}>有外送</option>
								<option value='沒有外送' ${(storeVO.store_out=='沒有外送') ? 'selected':''}>沒有外送</option></select>
							</td>
						</tr>
						<tr>
							<td>商家地區 :</td>
							<td>
							<select size="1" name="store_zone">
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
							</select>
							</td>
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
		<div id="footer">
			<jsp:include page="/footer.jsp"></jsp:include>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
