<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.store_report.model.*"%>
<%@ page import="java.util.*"%>
<% 
StoreVO storeVO=(StoreVO)session.getAttribute("storeVO");
StoreReportService storereportSvc=new StoreReportService();
String store_id=storeVO.getStore_id();
List<StoreReportVO> storereportVO=new LinkedList<StoreReportVO>();
storereportVO=storereportSvc.getReportByStore_id(store_id);
 pageContext.setAttribute("storereportVO",storereportVO);
%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
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
					<h3>商家檢舉資訊</h3>
 				</div> 
				<table border="1" bordercolor='#CCCCFF' cellpadding="5px" width="650px";>
					<tr>
						<th><font size="1">商家檢舉單號</font></th>
						<th><font size="1">商家編號</font></th>
						<th><font size="1">評論編號</font></th>
						<th><font size="1">訂單編號</font></th>
						<th><font size="1">管理員編號</font></th>
						<th><font size="1">檢舉內容</font></th>
						<th><font size="1">檢舉圖片</font></th>
						<th><font size="1">檢舉時間</font></th>
						<th><font size="1">檢舉審核狀態</font></th>
						<th><font size="1">檢舉結果</font></th>	
					</tr>
				 <c:forEach var="store_reportVO" items="${storereportVO}" >
					<tr align='center' valign='middle'>
						<td><font size="1">${store_reportVO.sr_id }</font></td>
				 		<td><font size="1">${store_reportVO.store_id }</font></td>
						<td><font size="1">${store_reportVO.sc_id }</font></td>
						<td><font size="1">${store_reportVO.order_id }</font></td>
						<td><font size="1">${store_reportVO.man_id }</font></td>
						<td><font size="1">${store_reportVO.sr_content}</font></td>
						<td><font size="1">${store_reportVO.sr_image }</font></td>
						<td><font size="1"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${store_reportVO.sr_time }"/></font></td>
						<td><font size="1">${store_reportVO.sr_state }</font></td>
						<td><font size="1">${store_reportVO.sr_result }</font></td>
					</tr>	
				</c:forEach>
				</table>
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
