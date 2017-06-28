<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%
	MemberVO memberVO=(MemberVO)request.getAttribute("memberVO");
%>
<html >
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>Title Page</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
			<style>
		.aa{
			margin-top: 40px;
		}

		#header{
			height: 200px;
			background-color: #F5F5DC;
		}
		/*LOGO*/
		#page div#header a img{
			float:left;
			margin:50px 0 0 50px;
			width:160px;
		}
		/*HOME 最新消息 找商家....的連結文字*/
		#page div#header ul{
			float:right;
			margin: 100px 320px;
			overflow: hidden;
			padding: 0;
			width: 900px;
			font-size: 25px;
		}
		/*HOME 最新消息 找商家....間距*/
		#page div#header ul li {
			float: left;
			padding: 30px;
			overflow: hidden;
		}
		/*HOME 最新消息 找商家....整個置右*/
		.signin{
			float: right;
			margin: 30px;
		}
	</style>
	</head>
	<body>
	<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
	<div id="page">
		<div id="header">
				<a href="index.html"><img src="images/logo.png">
				</a>
				<div class="signin">
					<input type="button" value="Sing in">
				</div>
				<ul>
					<li class="current">
						<a href="index.html">Home</a>
					</li>
					<li>
						<a href="menu.html">最新消息</a>
					</li>
					<li>
						<a href="locations.html">熱門商家</a>
					</li>
					<li>
						<a href="blog.html">找商家</a>
					</li>
					<li>
						<a href="about.html">找商品</a>
					</li>
				</ul>
			</div>
	</div>

		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-sm-offset-3">

					<!-- 
					1.在form-group外層添加一個 .form-horizontal
					2.在label添加一個格線以及一個control-label的class
					3.把input輸入欄位，包裹在一個格線當中 
					-->


					<form METHOD="post" ACTION="<%=request.getContextPath()%>/backend/mem/mem.do" name="form1">
						
						<div class="form-horizontal">
							<div class="form-group">
								<label for="mem_mail" class="col-xs-12 col-sm-3 control-label">
									電子信箱-帳號
								</label>
								<div class="col-xs-12 col-sm-9">
									<input type="text" name="mem_mail" id="aa" placeholder="email " class="form-control"  value="<%= (memberVO==null)? "sadqwe" :memberVO.getMem_mail() %>">
								</div>
							</div>
							<div class="form-group">
								<label for="mem_pw" class="col-xs-12 col-sm-3 control-label">
									密碼
								</label>
								<div class="col-xs-12 col-sm-9">
									<input type="text" name="mem_pw" id="bb" placeholder="password" class="form-control" value="<%= (memberVO==null)? "1222212" :memberVO.getMem_pw() %>">
								</div>
							</div>
							<div class="form-group">
								<label for="mem_name" class="col-xs-12 col-sm-3 control-label">
									姓名
								</label>
								<div class="col-xs-12 col-sm-9">
									<input type="text" name="mem_name" id="cc" placeholder="name" class="form-control" value="<%= (memberVO==null)? "老王" :memberVO.getMem_pw() %>">
								</div>
							</div>

							<div class="form-group">
								<label for="mem_phone" class="col-xs-12 col-sm-3 control-label">
									電話
								</label>
								<div class="col-xs-12 col-sm-9">
									<input type="text" name="mem_phone" id="dd" placeholder="phone" class="form-control" value="<%= (memberVO==null)? "123" :memberVO.getMem_phone() %>">
								</div>
							</div>
						</div>


						
						<input type="hidden" name="action" value="insert">
						<input type="submit" value="送出新增"></FORM>
				
				</div>
			</div>
		</div>


		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>