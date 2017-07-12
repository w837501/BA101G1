<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
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
					<li><a href="<%=request.getContextPath()%>/backend/mem/ListOneMem.jsp">³Ì·s®ø®§</a></li>
					
				</ul>
			</div>
=======
			<jsp:include page="/header.jsp" />
>>>>>>> branch 'ç¬¨' of https://github.com/w837501/BA101G1.git
		</div>
	

		<div id="contentsHome">
			<div id="main">
				<div id="adbox">
					<img src="<%=request.getContextPath()%>/images/Cuisine.jpg" alt="Img">
					<div class="info">
						<h1>¿ï¾Ü¦a°Ï</h1>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do">
							<select size="1" name="store_zone">
								<option value="°ò¶©¥«">°ò¶©¥«
								<option value="»O¥_¥«">»O¥_¥«
								<option value="·s¥_¥«">·s¥_¥«
								<option value="®ç¶é¥«">®ç¶é¥«
								<option value="·s¦Ë¥«">·s¦Ë¥«
								<option value="·s¦Ë¿¤">·s¦Ë¿¤
								<option value="­]®ß¿¤">­]®ß¿¤
								<option value="»O¤¤¥«">»O¤¤¥«
								<option value="¹ü¤Æ¿¤">¹ü¤Æ¿¤
								<option value="«n§ë¿¤">«n§ë¿¤
								<option value="¶³ªL¿¤">¶³ªL¿¤
								<option value="¹Å¸q¥«">¹Å¸q¥«
								<option value="¹Å¸q¿¤">¹Å¸q¿¤
								<option value="»O«n¥«">»O«n¥«
								<option value="°ª¶¯¥«">°ª¶¯¥«
								<option value="«ÌªF¿¤">«ÌªF¿¤
								<option value="»OªF¿¤">»OªF¿¤
								<option value="ªá½¬¿¤">ªá½¬¿¤
								<option value="©yÄõ¿¤">©yÄõ¿¤
							</select>
							<input type="submit" value="°e¥X"> <input type="hidden" name="action" value="get_zone">
						</FORM>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do">
							<b>·j´M°Ó®a:</b>
							<input type="text" name="store_name">
							<input type="submit" value="°e¥X">
							<input type="hidden" name="action" value="get_store_a">
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

					</div>
				</div>

				<!--¹Ï¤ù°Ï-->
				<div id="carousel">
					<li>
						<div class="shop">
							<a href="skincare.html"> <img
								src="<%=request.getContextPath()%>/images/mos.png" alt="Img"
								height="160" width="160"></a>
						</div>
					</li>
					<li>
						<div class="shop">
							<a href="skincare.html"> <img
								src="<%=request.getContextPath()%>/images/Hamburgers01.jpg"
								alt="Img" height="160" width="160"></a>
						</div>
					</li>
					<li>
						<div class="shop">
							<a href="skincare.html"> <img
								src="<%=request.getContextPath()%>/images/Hamburgers02.jpg"
								alt="Img" height="160" width="160"></a>
						</div>
					</li>
					<li>
						<div class="shop">
							<a href="skincare.html"> <img
								src="<%=request.getContextPath()%>/images/Hamburgers03.jpg"
								alt="Img" height="160" width="160"></a>
						</div>
					</li>
				</div>

				<!--¤p¶êÂI-->
				<div id="ol">
					<ul class="carousel-indicators" type="circle">
						<li id="circle">¡³</li>
						<li id="circle">¡³</li>
						<li id="circle">¡³</li>
					</ul>
				</div>


				<!--¼s§i°Ï-->
				<h2>¼s§i</h2>
				<ul id="promotions">
					<li>
						<div class="poster">
							<a href="fragrance.html"> <img
								src="<%=request.getContextPath()%>/images/AD_01.jpg" alt="Img"
								height="282" width="204"></a>
						</div> <a href="fragrance.html">Shop</a>
						<h2>§B®Ô¤À¨É¤é</h2>
						<p>¶¼«~¶R¤@°e¤@ ¡i¬¡°Ê¤é´Á¡j¡G2016/2/1¡B2/8¡B2/15¡B2/22¡B2/29
							¡i¬¡°Êªù¥«¡j¡G¥þªù¥«(³¡¥÷ªù¥«¬¡°Ê¤é¤£¦P¡A¸Ô°Ñª`·N¨Æ¶µ2¡B3¤§»¡©ú) ¡i¬¡°Ê¤º®e¡j¡G¤ZÁÊ¶R¶¼«~¥ô¤@ªM¡A¦AÃØ°e±z¶¼«~¤@ªM
							¡A»P±z¦n¤Í¤À¨É©@°Ø­»(µ²±bª÷ÃB¥H°ª»ù«~­p)</p>
					</li>
					<li>
						<div class="poster">
							<a href="cosmetics.html"> <img
								src="<%=request.getContextPath()%>/images/AD_02.jpg" alt="Img"
								height="282" width="204"></a>
						</div> <a href="cosmetics.html">Shop</a>
						<h2>¶g¥½¬£¹ïÀ\</h2>
						<p>
							21¥@¬ö­·¨ýÀ]«h¬O¤µ¦~ªº¨C¶g¤­¡B¤»¡B¤é¡A¥X¥Ü21¥@¬ö­·¨ýÀ]©xºôÀu´f°T®§(©ÎºI¹Ï)¡A§Y¥i¨É¦³¶g¥½¬£¹ïÀ\¡]21­»¯ó¯NÂû¡ÏÂA½­¨F©Ô¡Ï¤jÁ¦ÅQx2¡Ï¸Á»eºñ¯ù(L)x2¡^440¤¸¡A21­»¯ó¯NÂû³æÂIÀu´f»ù
							315¤¸¡C¬¡°Ê¶È¨ì¤µ¦~ªº12¤ë18¤é¡C</p>
					</li>
					<li>
						<div class="poster">
							<a href="skincare.html"> <img
								src="<%=request.getContextPath()%>/images/AD_03.jpg" alt="Img"
								height="282" width="204"></a> <span class="clearance"></span>
						</div> <a href="skincare.html">Shop</a>
						<h2>®L©]Âù¨É¨ü</h2>
						<p>¥»¬¡°Ê´Á¶¡¬°§Y¤é°_¦Ü2015¦~9¤ë30¤é¤§¨C¤é©]¶¡21:00~­â±á00:00
							¬¡°Ê´Á¶¡¤º¦Ü³Á·í³Ò®ø¶O¡A¤j¥]Á¦±ø²Ä¤G¥]$10
							¦¹«P¾PÀu´f­­©ó³æÂI¤j¥]Á¦±ø®É¨Ï¥Î¡AÂIÁÊ®MÀ\¥[»ù¤É¯Å¤jÁ¦®É¤£¾A¥Î¡A¥ç¤£±o»P©±¤º¨ä¥LÀu´f¦X¨Ö¨Ï¥Î</p>
					</li>
				</ul>

			</div>
		</div>

		<div id="footer">
			<jsp:include page="/footer.jsp"/>
		</div>

	</div>

</body>
</html>
