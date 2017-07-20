<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.store_commit.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- �����m�߱ĥ� Script ���g�k���� --%>
<%--
	ProductService proSvc1=new ProductService();
	String pro_name=(String)request.getAttribute("pro_name");
	List<ProductVO> list=proSvc1.getName(pro_name);
--%>
<%-- ���X Concroller EmpServlet.java�w�s�Jrequest��EmpVO����--%>
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
<title>�Y�q�ڽu�W�q�\�t��</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
<script src="<%=request.getContextPath()%>/js/mobile.js" type="text/javascript"></script>
</head>
<style>
	#commit{
		float:right;
	}
</style>
<body>
	<div id="page">
		<div id="header">
			<jsp:include page="/header_member_nostore.jsp"></jsp:include>
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
							<div>�ƶq�G <input type="text" name="quantity" size="3" value=1></div>
								<input type="submit" value="�[�J�ʪ���"> 
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
				<c:if test="${shoppingcart !=null }">
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do">
						<input type="submit" value="�e���ʪ���" >
						<input type="hidden" name="action"	value="goto_ShoppingCart">
				</FORM></c:if>
				
			
			<%
				StoreCommitService scSvc=new StoreCommitService();
				String store_id=storeVO.getStore_id();
				List<StoreCommitVO> list=scSvc.getAllByStore_id(store_id);
				pageContext.setAttribute("list",list);
			%>
			<jsp:useBean id="memberSvc" scope="page" class="com.mem.model.MemberService"></jsp:useBean>
			
			<h3>�̷s�ө�����</h3>
			<c:forEach var="scVO" items="${list}" begin="0" end="1" step="1">
			<table align="left" border="0" width=300px cellspacing="0" style="margin-left:10px;">
				<tr>
					<td>${memberSvc.getOneMem(scVO.mem_id).mem_name}</td></tr>
				<tr>
					<td><font color="gray"><fmt:formatDate  pattern="yyyy�~MM��dd�� HH:mm:ss" value="${scVO.sc_time}"/>�s��</font></td></tr>
				<tr>
					<td>�����G${scVO.sc_score}
					<img src="<%=request.getContextPath()%>/images/star.jpg" height="15" width="15" alt="star">
					</td></tr>
				<tr>
					<td height="50px">${scVO.sc_content}</td></tr>
			</table>
			</c:forEach>
			
			<span id="commit">
				<a href="<%=request.getContextPath()%>/backend/store_commit/listStoreCommitByStore_id.jsp?store_id=${storeVO.store_id}">�d�ݥ�������</a>
			</span>
			
			</div>
		
			<div id="store_sidebar">
				<div class="store_logo">
					<IMG src="<%=request.getContextPath()%>/StoreReader?store_id=${storeVO.store_id}" height="186" width="178">
				</div>
				<div class="introduction">
					<div id="title">
						<h1>�\�I²��</h1>
					</div>
					<span>${storeVO.store_content}</span>
				</div>
				<div class="information">
					<div id="title">
						<h1>�\�U��T</h1>
					</div>
					<span>�a�}�G${storeVO.store_addr} <br>
					�q�ܡG${storeVO.store_phone} <br>
					���L�~�e�G${storeVO.store_out}<br>
					�\�U�����G
					<c:forEach var="storeclasslistVO" items="${storeclassSvc.all}">
						<c:if test="${storeVO.sc_id==storeclasslistVO.sc_id}">
		                    ${storeclasslistVO.sc_name}
	                    </c:if>
					</c:forEach>
					<br>
					<br>
					�ө������G<fmt:formatNumber type="number"  maxFractionDigits="1" value="${storeVO.store_star/storeVO.store_count}"/><br>
							
<%-- 						<c:if test="${storeVO.store_star >= 0 && storeVO.store_star < 20}"> --%>
<!-- 		              		���������� -->
<%-- 	                    </c:if> --%>
<%-- 	                    <c:if test="${storeVO.store_star >= 20 && storeVO.store_star < 40}"> --%>
<!-- 		              		���������� -->
<%-- 	                    </c:if> --%>
<%-- 	                    <c:if test="${storeVO.store_star >= 40 && storeVO.store_star < 60}"> --%>
<!-- 		              		���������� -->
<%-- 	                    </c:if> --%>
<%-- 	                    <c:if test="${storeVO.store_star >= 60 && storeVO.store_star < 80}"> --%>
<!-- 		              		���������� -->
<%-- 	                    </c:if> --%>
<%-- 	                    <c:if test="${storeVO.store_star >= 80}"> --%>
<!-- 		              		���������� -->
<%-- 	                    </c:if> --%>
					<br>
					<a href="<%=request.getContextPath()%>/backend/store_commit/listStoreCommitByStore_id.jsp?store_id=${storeVO.store_id}">����</a>&nbsp&nbsp&nbsp&nbsp
					<form method="post" action="<%=request.getContextPath()%>/frontend/mem/member_addMR.jsp">
							<input type="submit" value="���|">
							<input type="hidden" name="store_id" value="${storeVO.store_id}">
					</form>
					</span>
				</div>
				
			</div>
		</div>
		
		<div id="footer">
			<jsp:include page="/footer.jsp"/>
		</div>
	</div>

	

</body>
</html>
