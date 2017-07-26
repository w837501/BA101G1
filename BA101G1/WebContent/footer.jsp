<%@ page contentType="text/html;charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul class="navigation">
	<li class="selected"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
	<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>熱門商家</a></li>
	<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>找商家</a></li>
	<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>找商品</a></li>
	<li><a href="<%=request.getContextPath()%>/frontend/advertisement/browseAD.jsp">最新消息</a></li>
</ul>
<p id="footnote">Eternal Beauty Essentials 2012. All Rights Reserved.</p>