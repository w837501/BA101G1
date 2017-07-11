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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<title>吃訂我線上訂餐系統</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
</head>
<body>
	<div id="page">
		<div id="header">
			<div id="logo">
				<a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/images/logo.png" alt="LOGO"></a>
				<span id="login"><a href="<%=request.getContextPath()%>/frontend/mem/LoginAndAddMem.jsp">Login in</a></span>
				<% boolean flag=true; %>
				<ul>
					<li class="selected"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
					<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>熱門商家</a></li>
					<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>找商家</a></li>
					<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>找商品</a></li>
					<li><a href="<%=request.getContextPath()%>/backend/mem/ListOneMem.jsp">最新消息</a></li>
					<li>
					<c:if test="${not empty memberVO }">
						<a href="<%=request.getContextPath()%>/backend/mem/mem.do?action=logout">登出</a>  
						<% flag=false;%>
					</c:if>
					<c:if test="${empty memberVO}">
					<a href="<%=request.getContextPath()%>/frontend/mem/LoginAndAddMem.jsp">login</a> 
					<% flag=true;%>
					</c:if>
					 </li>
				</ul>
			</div>
		</div>

		<div class="container" style="margin-bottom:180px;">
			<div class="row">
				<div class="col-xs-12 col-sm-3">
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath() %>/frontend/mem/member_info_update.jsp" class="list-group-item">修改資料</a>
					</div>
					
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/frontend/selectOrder/order.do?action=getOne_For_Display&mem_id=<%=memberVO.getMem_id() %> " class="list-group-item">查詢訂單</a>
					</div>
				</div>
				<div class="col-xs-12 col-sm-7" >


				<div class="page-header"> 
					  <h1>會員資料修改</h1>
 				</div> 
				<form action="<%=request.getContextPath()%>/backend/mem/mem.do" method='post' name='form1'>
<table border='0'>
	<tr>
		<td>會員編號:<font color='red'><b>*</b></font></td>
		<td><%=memberVO.getMem_id() %></td>
	</tr>
	<tr>
		<td>會員姓名:</td>
		<td><input type="TEXT" name="mem_name" size="45" value="<%=memberVO.getMem_name() %>"/></td>
	</tr>
	<tr>
		<td>會員電話:</td>
		<td><input type="TEXT" name="mem_phone" size="45" value="<%=memberVO.getMem_phone() %>"/></td>
	</tr>
	<tr>
		<td>會員密碼:</td>
		<td><input type="TEXT" name="mem_pw" size="45" value="<%=memberVO.getMem_pw() %>"/></td>
	</tr>
	<tr>
		<td>會員信箱:</td>
		<td><input type="TEXT" name="mem_mail" size="45" value="<%=memberVO.getMem_mail() %>"/></td>
	</tr>
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="mem_id" value="<%=memberVO.getMem_id()%>">
<input type="submit"  value="送出修改">

</form>
					


				</div>
			</div>
		</div>
		<div id="footer">
			<ul class="navigation">
				<li class="selected"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
				<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>熱門商家</a></li>
				<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>找商家</a></li>
				<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>找商品</a></li>
				<li><a href="news.html">最新消息</a></li>
			</ul>
		</div>

	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
