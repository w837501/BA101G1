<%@ page contentType="text/html;charset=UTF-8" pageEncoding="Big5"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.store.model.*"%>
<% 
	MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
	StoreVO storeVO=(StoreVO)session.getAttribute("storeVO");
%>		
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
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
					<%session.removeAttribute("storeVO"); %>
					<span class="login">
						<a href="<%=request.getContextPath()%>/backend/mem/mem.do?action=logout">Logout</a>  
						<div style="margin-left: 0px;">
					</span>
				
					<span class="name">
						<a href="<%=request.getContextPath()%>/frontend/mem/member_info.jsp">你好，<%=memberVO.getMem_name() %></a>
					</span>
				</c:if>
				<c:if test="${not empty storeVO}">
					<%session.removeAttribute("memberVO"); %>
					<span class="login">
						<a href="<%=request.getContextPath()%>/store/store.do?action=logout">Logout</a>  
						<div style="margin-left: 0px;">
					</span>
					
					<span class="name">
						<a href="<%=request.getContextPath()%>/store/store_info.jsp">你好，<%=storeVO.getStore_name() %></a>	
					</span>
				
				</c:if>
			</c:if>
			
	</div>
</div>
		
<div id="option">
	<ul>
		<li class="selected"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
		<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>熱門商家</a></li>
		<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>找商家</a></li>
		<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>找商品</a></li>
		<li><a href='<%=request.getContextPath()%>/frontend/advertisement/browseAD.jsp'>廣告瀏覽</a></li>
	</ul>
</div>