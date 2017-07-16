<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- 此頁練習採用 Script 的寫法取值 --%>
<%--
	ProductService proSvc1=new ProductService();
	String pro_name=(String)request.getAttribute("pro_name");
	List<ProductVO> list=proSvc1.getName(pro_name);
--%>
<%-- 取出 Concroller EmpServlet.java已存入request的EmpVO物件--%>
<%--  <%List<ProductVO> productVO = (List) request.getAttribute("productlist");%>--%>

<%-- <%StoreVO storeVO = (StoreVO) request.getAttribute("storeVO");%> --%>

<% 
	StoreVO storeVO=(StoreVO)request.getAttribute("storeVO");
	MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
%>


<jsp:useBean id="storeSvc" scope="page" class="com.store.model.StoreService" />
<jsp:useBean id="storeclassSvc" scope="page" class="com.store_class.model.StoreClassService" />

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>吃訂我線上訂餐系統</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
<script src="<%=request.getContextPath()%>/js/mobile.js" type="text/javascript"></script>
</head>
<body>
	<div id="page">
		<div id="header">
			<div id="logo">
				<div id="login">
						<a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/images/logo.png" alt="LOGO"></a>
						
						<c:if test="${empty memberVO && empty storeVO}">
			
							<span class="login" onmouseover="switchMenu( this, 'SubMenu1', 'MouseOver' )" onmouseout="hideMenu()">Login
								<div style="margin-left: -20px;">
								<span style="font-size:9px;">&#9660;</span>
								<ul id="SubMenu1" class="sub-menu" style="display:none;">
								    <li><a href="<%=request.getContextPath()%>/frontend/mem/LoginAndAddMem.jsp" target="_blank">會員登入</a></li>
									<li><a href="<%=request.getContextPath()%>/store/LoginAndAddStore.jsp" target="_blank">商家登入</a></li>
								</ul>
							</span>
			
						</c:if>
						
						<c:if test="${not empty memberVO || not empty storeVO}">
							<c:if test="${not empty memberVO}">
							<span class="login">
							
								<a href="<%=request.getContextPath()%>/backend/mem/mem.do?action=logout">Logout</a>  
								<div style="margin-left: 0px;">
							</span>
							<span class="name">
								你好，<%=memberVO.getMem_name() %>
							</span>
							</c:if>
<%-- 							<c:if test="${not empty storeVO}"> --%>
<!-- 							<span class="login"> -->
							
<%-- 								<a href="<%=request.getContextPath()%>/store/store.do?action=logout">Logout</a>   --%>
<!-- 								<div style="margin-left: 0px;"> -->
<!-- 							</span> -->
<!-- 							<span class="name"> -->
<%-- 								你好，<%=storeVO.getStore_name() %> --%>
<!-- 							</span> -->
<%-- 							</c:if> --%>
						</c:if>
						
				</div>
			</div>
					
			<div id="option">
				<ul class="navigation">
				<li class="selected"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
				<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>熱門商家</a></li>
				<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>找商家</a></li>
				<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>找商品</a></li>
				<li><a href="news.html">最新消息</a></li>
			</ul>
			</div>
		</div>
		
		<div id="contents">
			<div id="main">
				<div id="items">
					<h1>${storeVO.store_name}</h1>
					<ul>
						<c:forEach var="product" items="${productlist}">
						<li class="box">
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do">
							<IMG src="<%=request.getContextPath()%>/ProDBGifReader?pro_id=${product.pro_id}" height="186" width="178">
							<h3>${product.pro_name}</h3>
							<span class="price">$ ${product.pro_price}</span>
							<div>數量： <input type="text" name="quantity" size="3" value=1></div>
								<input type="submit" value="加入購物車"> 
							    <input type="hidden" name="pro_name" value="${product.pro_name}">
							    <input type="hidden" name="pro_price" value="${product.pro_price}">
							    <input type="hidden" name="pro_id" value="${product.pro_id}">
							    <input type="hidden" name="store_id" value="${storeVO.store_id}"> 
							    <input type="hidden" name="pro_content" value="${product.pro_content}">       
							    <input type="hidden" name="action"	value="getOne_In_ShoppingCart">
							</FORM>
						</li>
						</c:forEach>
					</ul>
				</div>
				
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do">
						<input type="submit" value="前往購物車" >
						<input type="hidden" name="action"	value="goto_ShoppingCart">
				</FORM>
			</div>
			<div id="store_sidebar">
				<div class="store_logo">
					<IMG src="<%=request.getContextPath()%>/StoreReader?store_id=${storeVO.store_id}" height="186" width="178">
				</div>
				<div class="introduction">
					<div id="title">
						<h1>餐點簡介</h1>
					</div>
					<span>${storeVO.store_content}</span>
				</div>
				<div class="information">
					<div id="title">
						<h1>餐廳資訊</h1>
					</div>
					<span>地址：${storeVO.store_addr} <br>
					電話：${storeVO.store_phone} <br>
					餐廳類型：
					<c:forEach var="storeclasslistVO" items="${storeclassSvc.all}">
						<c:if test="${storeVO.sc_id==storeclasslistVO.sc_id}">
		                    ${storeclasslistVO.sc_name}
	                    </c:if>
					</c:forEach>
					<br>
					<br>
					商店評價：<fmt:formatNumber type="number"  maxFractionDigits="1" value="${storeVO.store_star/storeVO.store_count}"/><br>
							
<%-- 						<c:if test="${storeVO.store_star >= 0 && storeVO.store_star < 20}"> --%>
<!-- 		              		★☆☆☆☆ -->
<%-- 	                    </c:if> --%>
<%-- 	                    <c:if test="${storeVO.store_star >= 20 && storeVO.store_star < 40}"> --%>
<!-- 		              		★★☆☆☆ -->
<%-- 	                    </c:if> --%>
<%-- 	                    <c:if test="${storeVO.store_star >= 40 && storeVO.store_star < 60}"> --%>
<!-- 		              		★★★☆☆ -->
<%-- 	                    </c:if> --%>
<%-- 	                    <c:if test="${storeVO.store_star >= 60 && storeVO.store_star < 80}"> --%>
<!-- 		              		★★★★☆ -->
<%-- 	                    </c:if> --%>
<%-- 	                    <c:if test="${storeVO.store_star >= 80}"> --%>
<!-- 		              		★★★★★ -->
<%-- 	                    </c:if> --%>
					<br>
					<a href="index.html">評論</a>&nbsp&nbsp&nbsp&nbsp
					<form method="post" action="<%=request.getContextPath()%>/frontend/mem/member_addMR.jsp">
							<input type="submit" value="檢舉">
							<input type="hidden" name="store_id" value="${storeVO.store_id}">
					</form>
					</span>
				</div>
				
			</div>
		</div>
		
		<div id="footer">
			<ul class="navigation">
					<li class="selected">
						<a href="index.html">Home</a>
					</li>
					<li>
						<a href="news.html">最新消息</a>
					</li>
					<li>
						<a href="cosmetics.html">熱門商家</a>
					</li>
					<li>
						<a href="skincare.html">找商家</a>
					</li>
					<li>
						<a href="fragrance.html">找商品</a>
					</li>	
			</ul>
			<p id="footnote">Eternal Beauty Essentials 2012. All Rights Reserved.</p>
		</div>
	</div>

	

</body>
</html>
