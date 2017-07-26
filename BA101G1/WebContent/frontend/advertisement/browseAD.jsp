<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ad.model.*"%>
<%@ page import="java.util.*"%>
<%@page import="java.sql.Timestamp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	AdService adSvc = new AdService();
	List<AdVO> list = adSvc.getAll();
	pageContext.setAttribute("list", list);
%>


<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>�Y�q�ڽu�W�q�\�t��</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
<script src="<%=request.getContextPath()%>/js/mobile.js" type="text/javascript"></script>
</head>
<style>
	b{
		margin-left:20px;
	}
</style>
<body>
	<div id="page">
		<div id="header">
			<jsp:include page="/header_member.jsp"></jsp:include>
		</div>
		<div id="classcontents">
			<p>	
				<font size = "6">
					<b> �s�i�s�� </b>
				</font>
			</p>


			<div id="items">
				<%@ include file="pages/page1.file" %> 
					<ul>
						<c:forEach var="adVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1 %>">
							<li>
								<a href="ad.do?action=getOne_For_Display&ad_id=${adVO.ad_id }">
									<img src="<%=request.getContextPath()%>/advertisement/DBGifReader.do?ad_id=${adVO.ad_id}" style="max-width: 150px; max-height: 150px;">
									<h3>${adVO.ad_name}</h3><br>
									<h3><font color="#fff" size="2"><fmt:formatDate value="${adVO.ad_time}" pattern="yyyy-MM-dd"/></font></h3>
								</a>
							</li>
	    				</c:forEach>
	    			</ul>
	    	</div>
				<%@ include file="pages/page2.file" %>
		</div>
		<div id="footer">
			<jsp:include page="/footer.jsp"/>
		</div>
	</div>
</body>		
</html>