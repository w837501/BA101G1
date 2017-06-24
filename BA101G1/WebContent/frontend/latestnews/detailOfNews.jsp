<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ page import="java.util.*"%>

<%@ page import="com.news.model.*"%>
<%-- <%NewsVO newsVO = (NewsVO) request.getAttribute("newsVO"); %>  --%>
<!DOCTYPE html>
<html>
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

		p{
			padding-left: 250px;
		}
		
		div#outside{
			width: 1700px;
			padding-left: 350px;
		}
		div#outside #title{
			height:50px;
		}
		div#outside h1{
			float:left;
		}
		div#outside h2{
			float:right;
		}
		div#title{
			font-size: 50px;
		}

		div#time{
			padding-top: 35px;
			padding-left: 550px;  
			font-size: 25px;
		}
		
		div#content{
			font-size: 25px;
		}
	</style>

	</head>

	<body>
	<div id="page">
		<div id="header">
				<a href="index.html"><img src="https://api.fnkr.net/testimg/350x200/00CED1/FFF/?text=img+placeholder">
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
    

		<p><font size = "500px">
		<b style ="display:inline-block;"><a href="?????"> 廣告 </a>> 內容 </b>
		</font></p>
		
		<br>
		
		<div id ="outside" align="center"">
			<!-- <div id = "title" style="border: solid red;"></div> -->
			<!-- <div id="time" style="border: solid;"></div> -->
			<div id="title">
				<h1>${newsVO.news_name}</h1>
				<h2>${newsVO.news_time}</h2>
			</div>
			

			
			<hr style="border-color: red;">
			<div id="content">
				${newsVO.news_content} 
			</div>
		</div>

		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

	</body>
</html>
