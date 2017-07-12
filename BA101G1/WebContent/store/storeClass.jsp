<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.store_class.model.*"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>吃訂我線上訂餐系統</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
</head>
<body bgcolor='white'>
	<div id="page">
		<div id="header">
			<div id="logo">
				<a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/images/logo.png" alt="LOGO"></a>
				<span id="login"><a href="news.html">Login in</a></span>

				<ul>
					<li class="selected"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
					<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>熱門商家</a></li>
					<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>找商家</a></li>
					<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>找商品</a></li>
					<li><a href="news.html">最新消息</a></li>
				</ul>
			</div>
		</div>
		<div id="classcontents">
			<!-- 搜尋商家&地區 -->
			<div id="main">

				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/store/store.do">
					<b>搜尋商家:</b> <input type="text" name="store_name"> <input
						type="submit" value="送出"> <input type="hidden"
						name="action" value="get_store_b">
				</FORM>

				<%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
					<font color='red'>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li>${message}</li>
							</c:forEach>
						</ul>
					</font>
				</c:if>

				<%
					String store_zone = (String) request.getAttribute("store_zone");
				%>


				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/store/store.do">
					<b>選擇地區 :</b> <select size="1" name="store_zone">
						<option value="基隆市"<c:if test="${store_zone.equals('基隆市') }"> selected</c:if>>基隆市
						<option value="臺北市"<c:if test="${store_zone.equals('臺北市') }"> selected</c:if>>臺北市
						<option value="新北市"<c:if test="${store_zone.equals('新北市') }"> selected</c:if>>新北市
						<option value="桃園市"<c:if test="${store_zone.equals('桃園市') }"> selected</c:if>>桃園市
						<option value="新竹市"<c:if test="${store_zone.equals('新竹市') }"> selected</c:if>>新竹市
						<option value="新竹縣"<c:if test="${store_zone.equals('新竹縣') }"> selected</c:if>>新竹縣
						<option value="苗栗縣"<c:if test="${store_zone.equals('苗栗縣') }"> selected</c:if>>苗栗縣
						<option value="臺中市"<c:if test="${store_zone.equals('臺中市') }"> selected</c:if>>臺中市
						<option value="彰化縣"<c:if test="${store_zone.equals('彰化縣') }"> selected</c:if>>彰化縣
						<option value="南投縣"<c:if test="${store_zone.equals('南投縣') }"> selected</c:if>>南投縣
						<option value="雲林縣"<c:if test="${store_zone.equals('雲林縣') }"> selected</c:if>>雲林縣
						<option value="嘉義市"<c:if test="${store_zone.equals('嘉義市') }"> selected</c:if>>嘉義市
						<option value="嘉義縣"<c:if test="${store_zone.equals('嘉義縣') }"> selected</c:if>>嘉義縣
						<option value="臺南市"<c:if test="${store_zone.equals('臺南市') }"> selected</c:if>>臺南市
						<option value="高雄市"<c:if test="${store_zone.equals('高雄市') }"> selected</c:if>>高雄市
						<option value="屏東縣"<c:if test="${store_zone.equals('屏東縣') }"> selected</c:if>>屏東縣
						<option value="臺東縣"<c:if test="${store_zone.equals('臺東縣') }"> selected</c:if>>臺東縣
						<option value="花蓮縣"<c:if test="${store_zone.equals('花蓮縣') }"> selected</c:if>>花蓮縣
						<option value="宜蘭縣"<c:if test="${store_zone.equals('宜蘭縣') }"> selected</c:if>>宜蘭縣
						
					</select> <input type="submit" value="送出"> <input type="hidden"
						name="action" value="get_zone">
				</FORM>

			</div>

			<div id="items">
				<jsp:useBean id="scSvc" scope="page" class="com.store_class.model.StoreClassService" />
					<ul>
						<c:forEach var="scVO" items="${scSvc.all}" varStatus="loop">
						<li>
							<h3><IMG src="<%=request.getContextPath()%>/StoreClassReader?sc_id=${scVO.sc_id}" height="200"></h3>						
							<h3>${scVO.sc_id}</h3>
							<h3>
								<a href='<%=request.getContextPath()%>/store/store.do?action=getStoreClass&sc_id=<c:out value="${loop.index}" />'>${scVO.sc_name}</a>
							</h3>
						</li>
						</c:forEach>
					</ul>
			</div>
			
			
			<div id="footer">
				<ul class="navigation">
					<li class="selected"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
					<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>熱門商家</a></li>
					<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>找商家</a></li>
					<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>找商品</a></li>
					<li><a href="news.html">最新消息</a></li>
				</ul>
				<p id="footnote">Eternal Beauty Essentials 2012. All Rights Reserved.</p>
			</div>
		</div>
	</div>
</body>
</html>
