<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<% 
	MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<title>吃訂我線上訂餐系統</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
</head>
<body>
	<div id="page">
		<div id="header">
			<jsp:include page="/header_member.jsp"></jsp:include>
		</div>

		<div class="container" style="margin-bottom:180px;">
			<div class="row">
				<div class="col-xs-12 col-sm-3">
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath() %>/frontend/mem/member_info_update.jsp" class="list-group-item">修改資料</a>
					</div>
					
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/frontend/mem/member_info_order.jsp " class="list-group-item">查詢訂單</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/frontend/mem/member_info_order.jsp " class="list-group-item">查詢檢舉</a>
					</div>
				</div>
				<div class="col-xs-12 col-sm-7" >

			
				<div class="page-header"> 
					  <h1>會員資料</h1>
 				</div> 
				
				 <jsp:include page="/backend/mem/ListOneMem.jsp" />
					

				</div>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="/footer.jsp"/>
		</div>

	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
