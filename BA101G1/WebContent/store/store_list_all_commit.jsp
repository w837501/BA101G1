<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.store_commit.model.*"%>
<%@ page import="java.util.*"%>
<% 
	StoreVO storeVO=(StoreVO)session.getAttribute("storeVO");
	StoreCommitService scSvc = new StoreCommitService();
	String store_id=storeVO.getStore_id();
	List<StoreCommitVO> list = scSvc.getAllByStore_id(store_id);
	pageContext.setAttribute("list", list);

%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<title>吃訂我線上訂餐系統</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
<style>
table{
  border-collapse: collapse;
  border-spacing: 0;
}
tr{
/*   border: 1px solid #E0607E; */
}
td{
  border: 1px solid #607ee0;
  padding: 10px 30px;
  background-color: #E0607E;
/*   border-radius: 10px; */
  color: #FFF;
}
td:first-child{
  border-top-left-radius: 10px;
  border-bottom-left-radius: 10px;
}

td:last-child{
  border-top-right-radius: 10px;
  border-bottom-right-radius: 10px;
}
</style>
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
					  <h1>所有評論</h1>
 				</div> 
 				<div class="col-xs-12 col-sm-7" >
 				<c:forEach var="scVO" items="${list}">
				<table border='0'>
						<tr align='center' valign='middle'>
							<td>${scVO.mem_id}</td>
							<td>${scVO.sc_score}</td>
							<td>${scVO.sc_content}</td>
							<td><fmt:formatDate  pattern="yyyy-MM-dd HH:mm:ss" value="${scVO.sc_time}"/></td>
						</tr>
				</table>
					</c:forEach>
 				
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
