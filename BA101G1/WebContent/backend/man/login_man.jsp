<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>


<!DOCTYPE html>
<html lang="">
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
	</head>
	
	<body>

		
		<div class="container">
			<div class="login-container">
            	<div id="output"></div>
            	<div class="avatar"><img src="<%=request.getContextPath()%>/backend/assets/img/logo.png" style="width: 120px;"/></div>
            	<div class="form-box">
	                <form action="<%=request.getContextPath() %>/backend/man/man.do" method="post">
	                    <input type="text" name="loginUser" placeholder="username" id="loginAcc">
	                    <input type="password" name="loginPwd" placeholder="password" id="loginPas">
	                    <input type="hidden" name="action" value="loginCHK">
	                    <input type="submit" value="送出" class="btn btn-info " id="abc">
<!-- 	                    <button class="btn btn-info btn-block login" type="submit">送出</button> -->
	                </form>
            	</div>
            	<div><a href="addMan.jsp">加入我們</a></div>
            	
            		<%-- 錯誤表列 --%>
            		<p style="opacity:0.7">
						<c:if test="${not empty errorMsgs}">
							<font color='red'>
								<c:forEach var="message" items="${errorMsgs}">
									${message}
								</c:forEach>
							</font>
						</c:if>
					</p>
        	</div>
						<button onclick="myFunction1()">俊</button>
						<button onclick="myFunction2()">治</button>
						<button onclick="myFunction3()">家</button>
						<button onclick="myFunction4()">人</button>
						<button onclick="myFunction5()">宜</button>
						<button onclick="myFunction6()">哲</button>
        
		</div>
		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>
<!-- **********************************javascript************************************************** -->
<script type="text/javascript">
	$(function(){
			var textfield = $("input[name=user]");
            $('button[type="submit"]').click(function(e) {
                e.preventDefault();
                //little validation just to check username
                if (textfield.val() != "") {
                    //$("body").scrollTo("#output");
                    $("#output").addClass("alert alert-success animated fadeInUp").html("Welcome back " + "<span style='text-transform:uppercase'>" + textfield.val() + "</span>");
                    $("#output").removeClass(' alert-danger');
                    $("input").css({
                    "height":"0",
                    "padding":"0",
                    "margin":"0",
                    "opacity":"0"
                    });
                    //change button text 
                    $('button[type="submit"]').html("continue")
                    .removeClass("btn-info")
                    .addClass("btn-default").click(function(){
                    $("input").css({
                    "height":"auto",
                    "padding":"10px",
                    "opacity":"1"
                    }).val("");
                    });
                    
                    //show avatar
                    $(".avatar").css({
                        "background-image": "url('http://api.randomuser.me/0.3.2/portraits/women/35.jpg')"
                    });
                } else {
                    //remove success mesage replaced with error message
                    $("#output").removeClass(' alert alert-success');
                    $("#output").addClass("alert alert-danger animated fadeInUp").html("sorry enter a username ");
                }
                //console.log(textfield.val());

            });
});
	function myFunction1(){
		document.getElementById("loginAcc").value = "MAN-000001";
		document.getElementById("loginPas").value = "group1";
	}
	function myFunction2(){
		document.getElementById("loginAcc").value = "MAN-000002";
		document.getElementById("loginPas").value = "group1";
	}
	function myFunction3(){
		document.getElementById("loginAcc").value = "MAN-000004";
		document.getElementById("loginPas").value = "group1";
	}
	function myFunction4(){
		document.getElementById("loginAcc").value = "MAN-000005";
		document.getElementById("loginPas").value = "group1";
	}
	function myFunction5(){
		document.getElementById("loginAcc").value = "MAN-000003";
		document.getElementById("loginPas").value = "group1";
	}
	function myFunction6(){
		document.getElementById("loginAcc").value = "MAN-000006";
		document.getElementById("loginPas").value = "group1";
	}
</script>


<!-- **********************************CSS************************************************** -->
<style type="text/css">
	body{background: #eee url(http://subtlepatterns.com/patterns/sativa.png);}
html,body{
    position: relative;
    height: 100%;
}

.login-container{
    position: relative;
    width: 300px;
    margin: 80px auto;
    padding: 20px 40px 40px;
    text-align: center;
    background: #fff;
    border: 1px solid #ccc;
    color:black;
}

#output{
    position: absolute;
    width: 300px;
    top: -75px;
    left: 0;
    color: #fff;
}

#output.alert-success{
    background: rgb(25, 204, 25);
}

#output.alert-danger{
    background: rgb(228, 105, 105);
}


.login-container::before,.login-container::after{
    content: "";
    position: absolute;
    width: 100%;height: 100%;
    top: 3.5px;left: 0;
    background: #fff;
    z-index: -1;
    -webkit-transform: rotateZ(4deg);
    -moz-transform: rotateZ(4deg);
    -ms-transform: rotateZ(4deg);
    border: 1px solid #ccc;

}

.login-container::after{
    top: 5px;
    z-index: -2;
    -webkit-transform: rotateZ(-2deg);
     -moz-transform: rotateZ(-2deg);
      -ms-transform: rotateZ(-2deg);

}

.avatar{
    width: 100px;height: 100px;
    margin: 10px auto 30px;
/*     border-radius: 100%; */
/*     border: 2px solid #aaa; */
    background-size: cover;
    position:relative;
  	left:-10px;  
}

.form-box input{
    width: 100%;
    padding: 10px;
    text-align: center;
    height:40px;
    border: 1px solid #ccc;;
    background: #fafafa;
    transition:0.2s ease-in-out;

}

.form-box input:focus{
    outline: 0;
    background: #eee;
}

.form-box input[type="text"]{
    border-radius: 5px 5px 0 0;
}

.form-box input[type="password"]{
    border-radius: 0 0 5px 5px;
    border-top: 0;
}

.form-box button.login{
    margin-top:15px;
    padding: 10px 20px;
}

.animated {
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}

@-webkit-keyframes fadeInUp {
  0% {
    opacity: 0;
    -webkit-transform: translateY(20px);
    transform: translateY(20px);
  }

  100% {
    opacity: 1;
    -webkit-transform: translateY(0);
    transform: translateY(0);
  }
}

@keyframes fadeInUp {
  0% {
    opacity: 0;
    -webkit-transform: translateY(20px);
    -ms-transform: translateY(20px);
    transform: translateY(20px);
  }

  100% {
    opacity: 1;
    -webkit-transform: translateY(0);
    -ms-transform: translateY(0);
    transform: translateY(0);
  }
}
/********************************我自訂按鈕顏色**********************************/
 #abc{ 
 	background:#5bc0de;
 } 
.fadeInUp {
  -webkit-animation-name: fadeInUp;
  animation-name: fadeInUp;
}

</style>