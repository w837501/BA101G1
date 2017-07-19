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
					<h3>�Ӯa���|��T</h3>
 				</div> 
				<table border="1" bordercolor='#CCCCFF' cellpadding="5px" width="650px";>
					<tr>
						<th><font size="1">�Ӯa���|�渹</font></th>
						<th><font size="1">�Ӯa�s��</font></th>
						<th><font size="1">���׽s��</font></th>
						<th><font size="1">�q��s��</font></th>
						<th><font size="1">�޲z���s��</font></th>
						<th><font size="1">���|���e</font></th>
						<th><font size="1">���|�Ϥ�</font></th>
						<th><font size="1">���|�ɶ�</font></th>
						<th><font size="1">���|�f�֪��A</font></th>
						<th><font size="1">���|���G</font></th>	
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
