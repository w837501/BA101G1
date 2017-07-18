<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.order.model.*"%>
<%@ page import="com.ad.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
StoreVO storeVO=(StoreVO)session.getAttribute("storeVO");
AdVO adVO=(AdVO)request.getAttribute("adVO");
%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script language="JavaScript" src="js/pic_preview.js"></script>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>
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
					  <h1>廣告 新增</h1>
 				</div> 
 				<FORM METHOD="post" ACTION= "<%=request.getContextPath()%>/frontend/advertisement/ad.do" name="form1" enctype="multipart/form-data">
<table border="0">

	<tr>
		<td>商店編號:</td>
		<td><%=storeVO.getStore_id() %></td>
		
	</tr>
	<tr>
		<td>廣告名字:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="ad_name" size="45"
			 value="<%= (adVO==null)? "肚子餓" :adVO.getAd_name() %>" /></td>
	</tr>
	<tr>
		<td>廣告內容:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="ad_content" size="45"
			 value="<%= (adVO==null)? "快來吃唷唷唷唷唷" :adVO.getAd_content() %>" /></td>
	</tr>
	<tr>
		<td>廣告圖片:<font color=red><b>*</b></font></td>
		<td><input type="file" name="upfile1" id="upfile1" >
		 <p>
    	<img id="image"   style="max-width: 150px; max-height: 150px;">
			</p>
  		</td>
		</tr>
	<tr>
		<td>廣告時間: </td>
		<td><input class="cal-TextBox"
			onFocus="this.blur()" size="9" readonly type="text" name="ad_time" value="1981-11-17">
			<a class="so-BtnLink"
			href="javascript:calClick();return false;"
			onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);"
			onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);"
			onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','ad_time','BTN_date');return false;">
		    <img align="middle" border="0" name="BTN_date"	src="<%=request.getContextPath() %>/frontend/advertisement/images/btn_date_up.gif" width="22" height="17" alt="開始日期"></a>
		   </td>     
		</tr>
</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="hidden" name="store_id" value="<%=storeVO.getStore_id() %>">
<input type="submit" value="送出新增"></FORM>

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
