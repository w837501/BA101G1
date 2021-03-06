<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
	String tab2=request.getParameter("tab2");
	String url=request.getServletPath();
	session.getAttribute("errorMsgs");
	
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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css" type="text/css">
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	  if(window.location.hash != "") {
	      $('a[href="' + window.location.hash + '"]').click()
	  }
	});

$(function() {
    var param = document.getElementById("selectedTabInput").value;
    window.alert(param);
    if (param != 0) {
        $('#tabs').tabs({
            active : param
        });
    } else {
        $('#tabs').tabs();
    }
});
</script>
<style>
.aa {
	margin-top: 150px;
}
</style>

<body>

<a href="<%=request.getContextPath()%>/backend/mem/select_mem.jsp">會員</a>
<a href="<%=request.getContextPath()%>/backend/news/news_index.jsp">最新消息</a>
<a href="<%=request.getContextPath()%>/backend/rev/Select_Rev.jsp">商家月結</a>
<a href="<%=request.getContextPath()%>/backend/store/store_index.jsp">商家</a>
<a href='<%=request.getContextPath()%>/backend/store_class/listAllStoreClass.jsp'>商家類別</a> 
<a href="<%=request.getContextPath()%>/backend/store_commit/store_commit_index.jsp">商家評價</a>

	<div class="col-xs-12 col-sm-4 ">
		<center>
			<a href="<%=request.getContextPath() %>/index.jsp"> <img src="images/logo.png"
				width="150px" height="150px">
			</a> <br> <br> <br>
			<p font-size="100px">
				<b> <a href="<%=request.getContextPath() %>/index.jsp"> 吃定我線上訂餐</a> > LogIn
				</b>
			</p>
		</center>
	</div>

	<div class="col-xs-12 col-sm-8">
		<div class="col-xs-12 col-sm-5 aa">
			<div role="tabpanel">

				<ul class="nav nav-tabs" role="tablist" id="tabs">
					<li role="presentation" class="active"><a href="#tab1"
						aria-controls="tab1" role="tab" data-toggle="tab">會員登入</a></li>
					<li role="presentation"><a href="#tab2" aria-controls="tab2"
						role="tab" data-toggle="tab">註冊</a></li>
				</ul>
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="tab1">
						<p class="well" align="center">
							<label for="帳號">帳號</label> <input type="text" name="帳號" id="帳號"
								placeholder="請輸入E-MAIL"> <br> <br> <label
								for="密碼">密碼</label> <input type="password" name="密碼" id="密碼"
								placeholder="請輸入密碼"> <br> <br> <a herf="">忘記密碼?</a>
							<br> <br> <a href="#" class="btn btn-info"><i
								class="glyphicon glyphicon-ok"></i> 送出</a>
						</p>
					</div>
					<div role="tabpanel" class="tab-pane" id="tab2">
						<div class="well" align="center">
							<c:if test="${not empty errorMsgs}">
								<font color='red'>請修正以下錯誤:
									<ul>
										<c:forEach var="message" items="${errorMsgs}">
											<li>${message}</li>
										</c:forEach>
									</ul>
								</font>
							</c:if>
							<%session.removeAttribute("errorMsgs"); %>
							<form METHOD="post"
								ACTION="<%=request.getContextPath()%>/backend/member/member.do"
								name="form1">
								<label for="mem_mail">會員信箱</label> <input type="text"
									name="mem_mail" id="mem_mail" placeholder="請輸入E-MAIL"
									value="<%=(memberVO == null) ? "sadqwe" : memberVO.getMem_mail()%>">
								<br> <br> <label for="mem_pw">會員密碼</label> <input
									type="password" name="mem_pw" id="mem_pw" placeholder="請輸入密碼"
									value="<%=(memberVO == null) ? "1222212" : memberVO.getMem_pw()%>">
								<br> <br> <label for="mem_pw_again">確認密碼</label> <input
									type="password" name="mem_pw_again" id="密碼"
									placeholder="再輸入一次密碼"
									value="<%=(memberVO == null) ? "1222212" : memberVO.getMem_pw()%>">
								<br> <br> <label for="mem_name">
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp姓名</label> <input type="text"
									name="mem_name" id="mem_name" placeholder="請輸入姓名"
									value="<%=(memberVO == null) ? "老王" : memberVO.getMem_pw()%>">
								<br> <br> <label for="mem_phone">
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp手機</label> <input type="text"
									name="mem_phone" id="mem_phone" placeholder="請輸入手機號碼"
									value="<%=(memberVO == null) ? "123" : memberVO.getMem_phone()%>">
								<br> <br> <input type="hidden" name="requestURL"
									value="<%=request.getServletPath()%>"> 
								<br> <br> <input type="hidden" name="action"
									value="insert"> <input type="submit" value="送出新增">
									<input type="hidden" name="selectedTabInput"
									value="${requestScope.selectedTabInput}">
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
