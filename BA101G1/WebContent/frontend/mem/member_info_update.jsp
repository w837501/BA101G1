<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.order.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="java.util.*"%>
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
						  <h3>會員資料修改</h3>
						  <hr color="#FFFFFF">
	 				</div> 
	 				
					<form action="<%=request.getContextPath()%>/backend/mem/mem.do" method='post' name='form1'>
						<table border='0'>
							<tr>
								<td>會員編號：</td>
								<td><%=memberVO.getMem_id() %></td>
							</tr>
							<tr>
								<td>會員姓名：</td>
								<td><input type="TEXT" name="mem_name" size="45" value="<%=memberVO.getMem_name() %>"/></td>
							</tr>
							<tr>
								<td>會員電話：</td>
								<td><input type="TEXT" name="mem_phone" size="45" value="<%=memberVO.getMem_phone() %>"/></td>
							</tr>
							<tr>
								<td>會員密碼：</td>
								<td><input type="password" name="mem_pw" size="45" value="<%=memberVO.getMem_pw() %>"/></td>
							</tr>
							<tr>
								<td>會員信箱：</td>
								<td><%=memberVO.getMem_mail() %></td>
							</tr>
						</table>
						<br>
						<input type="hidden" name="action" value="update">
						<input type="hidden" name="mem_id" value="<%=memberVO.getMem_id()%>">
						<input type="hidden" name="mem_mail" value="<%=memberVO.getMem_mail()%>">
						<input type="submit"  value="送出修改">
					</form>
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
