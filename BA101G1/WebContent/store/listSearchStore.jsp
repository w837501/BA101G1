<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.store_class.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- �����m�߱ĥ� Script ���g�k���� --%>
<%--
	ProductService proSvc1=new ProductService();
	String pro_name=(String)request.getAttribute("pro_name");
	List<ProductVO> list=proSvc1.getName(pro_name);
--%>
<%-- ���X Concroller EmpServlet.java�w�s�Jrequest��EmpVO����--%>
<%--  <%List<ProductVO> productVO = (List) request.getAttribute("productlist");%>--%>
<jsp:useBean id="storeSvc" scope="page" class="com.store.model.StoreService" />
<jsp:useBean id="storeclassSvc" scope="page" class="com.store_class.model.StoreClassService" />

<html>
<head>
</head>
<body>
	<div id="items">
		<h3>�j�M���G</h3>
		<ul>
			<c:forEach var="storeVO" items="${storelist}">

				<li class="box">
				<a href="store.do?action=getProduct_By_Store&store_id=${storeVO.store_id }">
					<IMG src="<%=request.getContextPath()%>/StoreReader?store_id=${storeVO.store_id}" height="186" width="178">
				</a>
				<h3>${storeVO.store_name}</h3>
				<span class="price">
					<c:forEach var="storeclasslistVO" items="${storeclassSvc.all}">
						<c:if test="${storeVO.sc_id==storeclasslistVO.sc_id}">
		                    ${storeclasslistVO.sc_name}
	                    </c:if>
					</c:forEach>
				</span><br>
				<span>
				${storeVO.store_zone} ${storeVO.store_addr}
				</span>
				</li>

			</c:forEach>
		</ul>
	</div>
</body>
</html>
