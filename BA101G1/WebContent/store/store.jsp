<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*" %>
<%
MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>¦Y­q§Ú½u¤W­qÀ\¨t²Î</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
<script src="<%=request.getContextPath()%>/js/mobile.js" type="text/javascript"></script>
</head>
<body>
	<div id="page">
		<div id="header">
<<<<<<< HEAD
			<div id="logo">
				<a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/images/logo.png" alt="LOGO"></a>
				<span id="login">
				<c:if test="${empty memberVO }">
				<a href="<%=request.getContextPath()%>/frontend/mem/LoginAndAddMem.jsp">Login</a>
				</c:if>
				<c:if test="${not empty memberVO }">
						<a href="<%=request.getContextPath()%>/backend/mem/mem.do?action=logout">Logout</a>  
					</c:if></span>

				<ul>
					<li class="selected"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
					<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>¼öªù°Ó®a</a></li>
					<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>§ä°Ó®a</a></li>
					<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>§ä°Ó«~</a></li>
					<li><a href="news.html">³Ì·s®ø®§</a></li>
				</ul>
			</div>
=======
			<jsp:include page="/header.jsp" />
>>>>>>> branch 'ç¬¨' of https://github.com/w837501/BA101G1.git
		</div>

		<div id="contents">

			<!-- À\ÆUÃþ«¬  -->
			<jsp:useBean id="scSvc" scope="page" class="com.store_class.model.StoreClassService" />
			<div id="sidebar">
				<h1>À\ÆUÃþ«¬</h1>
				<ul class="menu2">
					<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>¼öªù°Ó®a</a></li>
					<c:forEach var="scVO" items="${scSvc.all}" varStatus="loop">
						<li class="selected"><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreClass&sc_id=<c:out value="${loop.index}" />'>${scVO.sc_name}
						</a></li>
					</c:forEach>
				</ul>
			</div>

			<!-- ·j´M°Ó®a&¦a°Ï -->
			<div id="main">


				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do">
					<b>·j´M°Ó®a:</b>
					<input type="text" name="store_name">
					<input type="submit" value="°e¥X">
					<input type="hidden" name="action" value="get_store_b">
				</FORM>


				<%-- ¿ù»~ªí¦C --%>
				<c:if test="${not empty errorMsgs}">
					<font color='red'>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li>${message}</li>
							</c:forEach>
						</ul>
					</font>
				</c:if>

				<% String store_zone = (String) request.getAttribute("store_zone"); %>


				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do">
					<b>¿ï¾Ü¦a°Ï :</b> <select size="1" name="store_zone">
						<option value="°ò¶©¥«"
							<c:if test="${store_zone.equals('°ò¶©¥«') }"> selected</c:if>>°ò¶©¥«
						
						<option value="»O¥_¥«"
							<c:if test="${store_zone.equals('»O¥_¥«') }"> selected</c:if>>»O¥_¥«
						
						<option value="·s¥_¥«"
							<c:if test="${store_zone.equals('·s¥_¥«') }"> selected</c:if>>·s¥_¥«
						
						<option value="®ç¶é¥«"
							<c:if test="${store_zone.equals('®ç¶é¥«') }"> selected</c:if>>®ç¶é¥«
						
						<option value="·s¦Ë¥«"
							<c:if test="${store_zone.equals('·s¦Ë¥«') }"> selected</c:if>>·s¦Ë¥«
						
						<option value="·s¦Ë¿¤"
							<c:if test="${store_zone.equals('·s¦Ë¿¤') }"> selected</c:if>>·s¦Ë¿¤
						
						<option value="­]®ß¿¤"
							<c:if test="${store_zone.equals('­]®ß¿¤') }"> selected</c:if>>­]®ß¿¤
						
						<option value="»O¤¤¥«"
							<c:if test="${store_zone.equals('»O¤¤¥«') }"> selected</c:if>>»O¤¤¥«
						
						<option value="¹ü¤Æ¿¤"
							<c:if test="${store_zone.equals('¹ü¤Æ¿¤') }"> selected</c:if>>¹ü¤Æ¿¤
						
						<option value="«n§ë¿¤"
							<c:if test="${store_zone.equals('«n§ë¿¤') }"> selected</c:if>>«n§ë¿¤
						
						<option value="¶³ªL¿¤"
							<c:if test="${store_zone.equals('¶³ªL¿¤') }"> selected</c:if>>¶³ªL¿¤
						
						<option value="¹Å¸q¥«"
							<c:if test="${store_zone.equals('¹Å¸q¥«') }"> selected</c:if>>¹Å¸q¥«
						
						<option value="¹Å¸q¿¤"
							<c:if test="${store_zone.equals('¹Å¸q¿¤') }"> selected</c:if>>¹Å¸q¿¤
						
						<option value="»O«n¥«"
							<c:if test="${store_zone.equals('»O«n¥«') }"> selected</c:if>>»O«n¥«
						
						<option value="°ª¶¯¥«"
							<c:if test="${store_zone.equals('°ª¶¯¥«') }"> selected</c:if>>°ª¶¯¥«
						
						<option value="«ÌªF¿¤"
							<c:if test="${store_zone.equals('«ÌªF¿¤') }"> selected</c:if>>«ÌªF¿¤
						
						<option value="»OªF¿¤"
							<c:if test="${store_zone.equals('»OªF¿¤') }"> selected</c:if>>»OªF¿¤
						
						<option value="ªá½¬¿¤"
							<c:if test="${store_zone.equals('ªá½¬¿¤') }"> selected</c:if>>ªá½¬¿¤
						
						<option value="©yÄõ¿¤"
							<c:if test="${store_zone.equals('©yÄõ¿¤') }"> selected</c:if>>©yÄõ¿¤
						
					</select> <input type="submit" value="°e¥X"> <input type="hidden"
						name="action" value="get_zone">
				</FORM>


			
				<!-- include·j´Mµ²ªG -->
				<%if (request.getAttribute("storelist") != null) {%>
					<jsp:include page="/store/listSearchStore.jsp" />
				<%}%>

			</div>
		</div>

		<!-- footer -->
		<div id="footer">
			<ul class="navigation">
				<li class="selected"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
				<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>¼öªù°Ó®a</a></li>
				<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>§ä°Ó®a</a></li>
				<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>§ä°Ó«~</a></li>
				<li><a href="news.html">³Ì·s®ø®§</a></li>
			</ul>
			<p id="footnote">Eternal Beauty Essentials 2012. All Rights Reserved.</p>
		</div>

	</div>



</body>
</html>
