<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Title Page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
</head>
<style>
.aa {
	margin-top: 150px;
}
</style>

<body>


	<div class="col-xs-12 col-sm-4 ">
		<center>
			<a href="http://www.google.com"> <img src="images/logo.png"
				width="150px" height="150px">
			</a> <br>
			<br>
			<br>
			<p font-size="100px">
				<b> <a href="http://www.google.com"> 吃定我線上訂餐</a> > 登入
				</b>
			</p>
		</center>
	</div>

	<div class="col-xs-12 col-sm-8">
		<div class="col-xs-12 col-sm-5 aa">
			<div role="tabpanel">

				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#tab1"
						aria-controls="tab1" role="tab" data-toggle="tab">會員登入</a></li>
					<li role="presentation"><a href="#tab2" aria-controls="tab2"
						role="tab" data-toggle="tab">註冊</a></li>
				</ul>
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="tab1">
						<p class="well" align="center">
							<label for="帳號">帳號</label> <input type="text" name="帳號" id="帳號"
								placeholder="請輸入E-MAIL"> <br>
							<br> <label for="密碼">密碼</label> <input type="password"
								name="密碼" id="密碼" placeholder="請輸入密碼"> <br>
							<br> <a herf="">忘記密碼?</a> <br>
							<br> <a href="#" class="btn btn-info"><i
								class="glyphicon glyphicon-ok"></i> 送出</a>
						</p>
					</div>
					<div role="tabpanel" class="tab-pane" id="tab2">
						<div class="well" align="center">
						<form METHOD="post"
							ACTION="<%=request.getContextPath()%>/backend/mem/mem.do"
							name="form1">
							<label for="mem_mail">會員信箱</label> <input type="text"
								name="mem_mail" id="mem_mail" placeholder="請輸入E-MAIL"
								value="<%=(memberVO == null) ? "sadqwe" : memberVO.getMem_mail()%>">
							<br>
							<br> <label for="mem_pw">會員密碼</label> <input type="password"
								name="mem_pw" id="mem_pw" placeholder="請輸入密碼"
								value="<%=(memberVO == null) ? "1222212" : memberVO.getMem_pw()%>">
							<br>
							<br> <label for="確認密碼">確認密碼</label> <input type="password"
								name="密碼" id="密碼" placeholder="再輸入一次密碼"> <br>
							<br> <label for="mem_name"> 姓名</label> <input type="text"
								name="mem_name" id="mem_name" placeholder="請輸入姓名"
								value="<%=(memberVO == null) ? "老王" : memberVO.getMem_pw()%>">
							<br>
							<br> <label for="mem_phone"> 手機</label> <input type="text"
								name="mem_phone" id="mem_phone" placeholder="請輸入手機號碼"
								value="<%=(memberVO == null) ? "123" : memberVO.getMem_phone()%>">
							<br>
							<br> <input type="hidden" name="action" value="insert">
							<input type="submit" value="送出新增">
						</form>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
