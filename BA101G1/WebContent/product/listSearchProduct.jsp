<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.product_class.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- �����m�߱ĥ� Script ���g�k���� --%>
<%--
	StoreService storeSvc = new StoreService();
	String store_id = (String)request.getAttribute("store_id");
	List<StoreVO> list = storeSvc.getOneStore(store_id);
 --%>
<%-- ���X Concroller EmpServlet.java�w�s�Jrequest��EmpVO����--%>
<%-- <%List<StoreVO> storeVO = (List) request.getAttribute("storelist");%> --%>


<jsp:useBean id="proSvc" scope="page" class="com.product.model.ProductService" />
<jsp:useBean id="pcSvc" scope="page" class="com.product_class.model.ProductClassService" />
<jsp:useBean id="storeSvc" scope="page" class="com.store.model.StoreService" />

<html>
<head>
</head>
<body>
	<div id="items">
	<h3>�ӫ~�j�M���G</h3>
		<ul>
			<c:forEach var="productVO" items="${productlist}">
			<li class="box">
					<a href="<%=request.getContextPath()%>/store/store.do?action=getProduct_By_Store&store_id=${productVO.store_id}">
						<IMG src="<%=request.getContextPath()%>/ProductClassReader?pro_id=${productVO.pro_id}" height="186" width="178">
					</a>
					<h3>${productVO.pro_name}</h3>
					<span class="price">$ ${productVO.pro_price}</span><br>
					
					<span>
						<c:forEach var="productclasslistVO" items="${pcSvc.all}">
		                    <c:if test="${productVO.pc_id==productclasslistVO.pc_id}">
			                    ${productclasslistVO.pc_name}
		                    </c:if>
		                </c:forEach>
					</span>
				</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>
