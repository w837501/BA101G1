<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ad.model.*"%>
<%@ page import="java.util.*"%>
<%@page import="java.sql.Timestamp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
// AdVO adVO = (AdVO) request.getAttribute("adVO"); //Chatroom_MessageServlet.java(Concroller), 存入req的empVO物件
AdService adSvc=new AdService();
String ad_id=request.getParameter("ad_id");
AdVO adVO=adSvc.getOneAd(ad_id);
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>吃訂我線上訂餐系統</title>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
		<script src="<%=request.getContextPath()%>/js/mobile.js" type="text/javascript"></script>
		<style>
			table{
				font-size:25px;
				width:800px;
			}
			#content{
				padding-right:50px;
				padding-left:50px;
			}
			b{
				margin-left:20px;
			}
		</style>
	</head>

<body>
	<div id="page">
		<div id="header">
			<jsp:include page="/header_member.jsp"></jsp:include>
		</div>
		
		<div id="classcontents">
		
			<font size = "5">
				<b style ="display:inline-block;"> <a href="<%=request.getContextPath()%>/frontend/advertisement/browseAD.jsp">廣告瀏覽</a>  > 內容 </b>
			</font>
		
		
			<div id="items" style="padding-top:50px;">
				<div id="ad" align="center">
					<table>
						<tr>
							<td align="left">${adVO.ad_name}</td>
							<td align="right"><fmt:formatDate value="${adVO.ad_time}" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<td colspan="2">
								<hr style="border-color:#FFF;">
							</td>
						</tr>
					</table>		
					<img src="<%=request.getContextPath()%>/advertisement/DBGifReader.do?ad_id=${adVO.ad_id}"style="max-width: 250px; max-height: 250px;"></img>
				</div>
				<div id="content">
					<h3>${adVO.ad_content}</h3>
				</div>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="/footer.jsp"/>
		</div>
	</div>
</body>
</html>
