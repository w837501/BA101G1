<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.product_class.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 此頁練習採用 Script 的寫法取值 --%>
<%--
	StoreService storeSvc = new StoreService();
	String store_id = (String)request.getAttribute("store_id");
	List<StoreVO> list = storeSvc.getOneStore(store_id);
 --%>
<%-- 取出 Concroller EmpServlet.java已存入request的EmpVO物件--%>
<%-- <%List<StoreVO> storeVO = (List) request.getAttribute("storelist");%> --%>


<jsp:useBean id="proSvc" scope="page" class="com.product.model.ProductService" />
<jsp:useBean id="pcSvc" scope="page" class="com.product_class.model.ProductClassService" />
<jsp:useBean id="storeSvc" scope="page" class="com.store.model.StoreService" />

<html>
<head>
</head>
<body>
	<div id="items">
	<h3>商品搜尋結果</h3>
		<ul>
			<c:forEach var="productVO" items="${productlist}">
			<li class="box">
					<a href="<%=request.getContextPath()%>/store/store.do?action=getProduct_By_Store&store_id=${productVO.store_id}">

						<IMG src="<%=request.getContextPath()%>/ProDBGifReader?pro_id=${productVO.pro_id}" height="186" width="178">

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