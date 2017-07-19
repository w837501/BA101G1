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
						  <h3>�s�i�s�W</h3>
	 				</div> 
 				<FORM METHOD="post" ACTION= "<%=request.getContextPath()%>/frontend/advertisement/ad.do" name="form1" enctype="multipart/form-data">
				
				<table border="0">
				
					<tr>
						<td>�ө��s��:</td>
						<td><%=storeVO.getStore_id() %></td>
						
					</tr>
					<tr>
						<td>�s�i�W�r:<font color=red><b>*</b></font></td>
						<td><input type="TEXT" name="ad_name" size="45"
							 value="<%= (adVO==null)? "�{�l�j" :adVO.getAd_name() %>" /></td>
					</tr>
					<tr>
						<td>�s�i���e:<font color=red><b>*</b></font></td>
						<td><input type="TEXT" name="ad_content" size="45"
							 value="<%= (adVO==null)? "�֨ӦY������" :adVO.getAd_content() %>" /></td>
					</tr>
					<tr>
						<td>�s�i�Ϥ�:<font color=red><b>*</b></font></td>
						<td><input type="file" name="upfile1" id="upfile1" >
						 <p>
				    	<img id="image"   style="max-width: 150px; max-height: 150px;">
							</p>
				  		</td>
						</tr>
					<tr>
						<td>�s�i�ɶ�: </td>
						<td><input class="cal-TextBox"
							onFocus="this.blur()" size="9" readonly type="text" name="ad_time" value="1981-11-17">
							<a class="so-BtnLink"
							href="javascript:calClick();return false;"
							onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);"
							onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);"
							onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','ad_time','BTN_date');return false;">
						    <img align="middle" border="0" name="BTN_date"	src="<%=request.getContextPath() %>/frontend/advertisement/images/btn_date_up.gif" width="22" height="17" alt="�}�l���"></a>
						   </td>     
						</tr>
				</table>
				<br>
				<input type="hidden" name="action" value="insert">
				<input type="hidden" name="store_id" value="<%=storeVO.getStore_id() %>">
				<input type="submit" value="�e�X�s�W"></FORM>

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
