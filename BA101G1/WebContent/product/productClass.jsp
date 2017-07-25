<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.product.model.*"%>
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
<!-- 			<div id="header"> -->
<%-- 				<jsp:include page="/header_member.jsp"></jsp:include> --%>
<!-- 			</div> -->
		<div id="header">
			<jsp:include page="/header_both.jsp" />
		</div>
	
			<div id="classcontents">
				<div id="main">
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do" >
						<b>輸入餐點關鍵字:</b>
						<input type="text" name="pro_name">
						<input type="submit" value="送出">
						<input type="hidden" name="action" value="getproduct_a">
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
				
				</div>
			
			
				<div id="items">
					<jsp:useBean id="pcSvc" scope="page" class="com.product_class.model.ProductClassService" />
						<ul>
							<c:forEach var="pcVO" items="${pcSvc.all}" varStatus="loop">
							<li>
								<IMG src="<%=request.getContextPath()%>/ProductClassReader?pc_id=${pcVO.pc_id}" height="200">
								<h3 font="red"><a href='<%=request.getContextPath()%>/product/product.do?action=getProductClass&pc_id=${pcVO.pc_id}'>${pcVO.pc_name}</a></h3>
							</li>
							</c:forEach>
						</ul>
				</div>
				
			</div>
		
			<div id="footer">
				<jsp:include page="/footer.jsp"/>
			</div>
	</div>
</body>
</html>
