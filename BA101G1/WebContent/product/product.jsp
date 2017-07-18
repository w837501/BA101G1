<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>�Y�q�ڽu�W�q�\�t��</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
<script src="<%=request.getContextPath()%>/js/mobile.js" type="text/javascript"></script>
</head>
<body>
	<div id="page">
		<div id="header">
			<jsp:include page="/header_member.jsp"></jsp:include>
		</div>

		<div id="contents">

			<!-- �\�I����  -->
			<jsp:useBean id="pcSvc" scope="page" class="com.product_class.model.ProductClassService" />
			<div id="sidebar">
				<h1>�\�I����</h1>
				<ul class="menu2">
					<c:forEach var="pcVO" items="${pcSvc.all}" varStatus="loop">
						<li class="selected"><a href='<%=request.getContextPath()%>/product/product.do?action=getProductClass&pc_id=${pcVO.pc_id}'>${pcVO.pc_name}</a></li>
					</c:forEach>
				</ul>
			</div>

			<!-- �j�M�Ӯa&�a�� -->
			<div id="main">


				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do" >
			        <b>��J�\�I����r:</b>
			        <input type="text" name="pro_name">
			        <input type="submit" value="�e�X">
			        <input type="hidden" name="action" value="getproduct_b">
			    </FORM>


				<%-- ���~��C --%>
				<c:if test="${not empty errorMsgs}">
					<font color='red'>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li>${message}</li>
							</c:forEach>
						</ul>
					</font>
				</c:if>

				<%if (request.getAttribute("productlist")!=null){%>
       				<jsp:include page="/product/listSearchProduct.jsp" />
				<%}%>

			</div>
		</div>

		<!-- footer -->
		<div id="footer">
			<jsp:include page="/footer.jsp"/>
		</div>

	</div>

</body>
</html>
