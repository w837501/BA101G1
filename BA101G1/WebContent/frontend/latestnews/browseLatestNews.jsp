<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.news.model.*" %>

<%
	NewsService newsSvc = new NewsService();
	List<NewsVO> list = newsSvc.getAll();
	pageContext.setAttribute("list", list);
%>

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
    

		<p"><font size = "500px">
		<b> 最新消息 </b>
		</font></p>
		<%@ include file="pages/page1.file" %> 
		
		
		<c:forEach var="newsVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1 %>">
		
		<div class="col-xs-12 col-sm-3 aa" align="center">
		<a href="news.do?news_name=${newsVO.news_name}&news_time=${newsVO.news_time}&news_id=${newsVO.news_id}&action=getOne_For_Display">
		<img src="https://api.fnkr.net/testimg/350x200/00CED1/FFF/?text=img+placeholder"
		width="170px" height="170px" vspace="10px" style="display:block; margin:auto;border-radius: 25%;"></a>
		<br>
		<p>
		${newsVO.news_name}<br>
		${newsVO.news_time}
		${newsVO.news_id}    
		
		</p>
		</div>
	   </c:forEach>
	 
	   
	   
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
	<%@ include file="pages/page2.file" %>
</html>
