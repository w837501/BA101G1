<%@page import="com.man.model.ManagerService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="com.man.model.*"%>
<%
	ManagerVO managerVO=(ManagerVO)request.getAttribute("managerVO");
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>吃訂我EatMe</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="<%=request.getContextPath() %>/backend/assets/css/bootstrap.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
	<div class="container">
	    <div class="row">
	        <div class="col-sm-6 col-md-4 col-md-offset-4">
	            <h1 class="text-center login-title">
					<img class="profile-img" src="<%=request.getContextPath() %>/images/Hamburgers01.jpg">
				</h1>
	            <div class="account-wall">
	                <img class="profile-img" src="<%=request.getContextPath() %>/backend/assets/img/logo.png">
	                <form class="form-signin" METHOD="post" ACTION="<%=request.getContextPath()%>/backend/man/man.do" name="form1">
		                <input type="text" class="form-control" name="man_name"  placeholder="員工姓名" value="<%= (managerVO==null)? "" :managerVO.getMan_name() %>" required autofocus id="empName">
		                <input type="text" class="form-control" name="man_phone" placeholder="09xxxxxxxx" value="<%= (managerVO==null)? "" :managerVO.getMan_phone() %>"  required id="empPhone">
		                <input type="text" class="form-control" name="man_mail" placeholder="xxx@gmail.com" value="<%= (managerVO==null)? "" :managerVO.getMan_mail() %>" required id="empEmail">
		                <input type="hidden" name="action" value="insert">
		                <button class="btn btn-lg btn-primary btn-block" type="submit">
		                   Create an account </button>
	
		                <a href="<%=request.getContextPath() %>/backend/man/login_man.jsp" class="pull-right need-help">Sign in </a><span class="clearfix"></span>
	                </form>
						<%-- 錯誤表列 --%>
						<c:if test="${not empty errorMsgs}">
							<font color='red'>請修正以下錯誤:
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li>${message}</li>
								</c:forEach>
							</ul>
							</font>
						</c:if>
	            </div>
	            <button onclick="myFunction1()">剛哥</button>
	            <button onclick="myFunction2()">邱X竣</button>
	            <button onclick="myFunction3()">王小傑</button>
	        </div>
	    </div>
	</div>

</body>
</html>
<script>
	function myFunction1(){
		document.getElementById("empName").value = "周阿剛";
		document.getElementById("empPhone").value = "0988589732";
		document.getElementById("empEmail").value = "java@gmail.com";
	}
	function myFunction2(){
		document.getElementById("empName").value = "邱小竣";
		document.getElementById("empPhone").value = "0912345678";
		document.getElementById("empEmail").value = "ex051240@gmail.com";
	}
	function myFunction2(){
		document.getElementById("empName").value = "王小傑";
		document.getElementById("empPhone").value = "0987043790";
		document.getElementById("empEmail").value = "w837501@gmail.com";
	}
</script>

<style type="text/css">
body{
	background-image:url("<%=request.getContextPath() %>/images/bg-body.jpg");
}
.form-signin
{
    max-width: 330px;
    padding: 15px;
    margin: 0 auto;
}
.form-signin .form-signin-heading, .form-signin .checkbox
{
    margin-bottom: 10px;
}
.form-signin .checkbox
{
    font-weight: normal;
}
.form-signin .form-control
{
    position: relative;
    font-size: 16px;
    height: auto;
    padding: 10px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.form-signin .form-control:focus
{
    z-index: 2;
}
.form-signin input[type="text"]
{
    margin-bottom: -1px;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
}
.form-signin input[type="password"]
{
    margin-bottom: 10px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}
.account-wall
{
    margin-top: 20px;
    padding: 40px 0px 20px 0px;
    background-color: #f7f7f7;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}
.login-title
{
    color: #555;
    font-size: 18px;
    font-weight: 400;
    display: block;
}
.profile-img
{
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}
.need-help
{
    margin-top: 10px;
}
.new-account
{
    display: block;
    margin-top: 10px;
}
</style>


