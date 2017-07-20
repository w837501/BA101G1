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
<script language="JavaScript" src="js/pic_preview.js"></script>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>
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
						  <h3>廣告新增</h3>
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
		<div id="footer">
			<jsp:include page="/footer.jsp"></jsp:include>
		</div>

	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
