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
			<jsp:include page="/header_member.jsp"></jsp:include>
		</div>

		<div class="contents" style="margin-top:30px;margin-bottom:500px;">
			
				<div id="mem-button" style="margin-left:50px;float:left;">
						
						<h1>我的帳戶</h1><br>
						
						<a href="<%=request.getContextPath() %>/frontend/mem/member_info_update.jsp" class="list-group-item">
							<div>修改資料</div>
						</a>
						<a href="<%=request.getContextPath()%>/frontend/mem/member_info_order.jsp " class="list-group-item">
							<div>查詢訂單</div>
						</a>
						<a href="<%=request.getContextPath()%>/frontend/mem/member_report.jsp " class="list-group-item">
							<div>查詢檢舉</div>
						</a>
				</div>
				
				<div style="width:650px;float:right;margin-top:20px;margin-right:50px;">
					<div> 
						<h3>會員資料</h3>
						<hr color="#FFFFFF">
	 				</div> 
					 <jsp:include page="/backend/mem/ListOneMem.jsp" />
				</div>
			
		</div>
		<div id="footer">
			<jsp:include page="/footer.jsp"/>
		</div>

	</div>
</body>
</html>
