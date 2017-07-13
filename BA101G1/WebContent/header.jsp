<%@ page contentType="text/html;charset=UTF-8" pageEncoding="Big5"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<% 
	MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
%>		
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
<div id="logo">
	<div id="login">
			<a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/images/logo.png" alt="LOGO"></a>
			
			<!-- 登入 -->
			<c:if test="${empty memberVO && empty storeVO}">

				<span class="login" onmouseover="switchMenu( this, 'SubMenu1', 'MouseOver' )" onmouseout="hideMenu()">Login
					<div style="margin-left: -20px;">
					<span style="font-size:9px;">&#9660;</span>
					<ul id="SubMenu1" class="sub-menu" style="display:none;">
					    <li><a href="<%=request.getContextPath()%>/frontend/mem/LoginAndAddMem.jsp" target="_blank">會員登入</a></li>
						<li><a href="http://www.google.com.tw/" target="_blank">商家登入</a></li>
					</ul>
				</span>

			</c:if>
			
			<!-- 登出  -->
			<c:if test="${not empty memberVO || not empty storeVO}">
				<span class="login">
					<a href="<%=request.getContextPath()%>/backend/mem/mem.do?action=logout">Logout</a>  
					<div style="margin-left: 0px;">
				</span>
				<span class="name">
					你好，<%=memberVO.getMem_name() %>
				</span>
			</c:if>
			
	</div>
</div>
		
<div id="option">
	<ul>
		<li class="selected"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
		<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>���Ӯa</a></li>
		<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>��Ӯa</a></li>
		<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>��ӫ~</a></li>
		<li><a href='<%=request.getContextPath()%>/frontend/latestnews/browseLatestNews.jsp'>�̷s��</a></li>
	</ul>
</div>