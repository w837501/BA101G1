<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.member_report.model.*"%>
<%@ page import="com.store_report.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.store.model.*"%>
<%
StoreReportVO srVO = (StoreReportVO) request.getAttribute("srVO");
StoreVO storeVO=(StoreVO)session.getAttribute("storeVO");
String order_id=request.getParameter("order_id");
pageContext.setAttribute("order_id", order_id);
String sc_id=request.getParameter("sc_id");
pageContext.setAttribute("sc_id", sc_id);


%>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>吃訂我線上訂餐系統</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
<script src="<%=request.getContextPath()%>/js/mobile.js" type="text/javascript"></script>
</head>
<script language="JavaScript" src="js/pic_preview.js"></script>
<body bgcolor='white'>
	<div id="contents" >
			<div id="main"style="width:800px;">
				<div id="items">

<li class="box" style="width:500px;">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store_report/store_report.do" name="form1" enctype="multipart/form-data">
<table border="0">

	<tr>
		<td>商家編號:</td>
		<td><%=storeVO.getStore_id() %></td>
	</tr>
	<c:if test="${ not empty order_id}">
	<tr>
		<td>訂單編號:</td>
		<td><%=order_id %> 
		</td>
	</tr>
	</c:if>
	
	<c:if test="${not empty sc_id  }">
	<tr>
		<td>評論編號:</td>
		<td><%=sc_id %>
		</td>
	</tr>
	</c:if>
	
	<tr>
		<td>檢舉內容:</td>
		<td><input type="TEXT" name="sr_content" size="45"
			value="" /></td>
	</tr>
	<tr>
		<td>檢舉圖片:</td>
		<td>			
		<div id="demo">
	        <input id="upfile1" type="file"  name="sr_image"/>
	        <p>
	            <img id="image"  style="max-width: 150px; max-height: 150px;">
	        </p>
	    </div>
		</td>
	</tr>
	

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="hidden" name="store_id" value="${storeVO.store_id }">
<c:if test="${ order_id != null}">
	<input type="hidden" name="order_id" value="<%=order_id %>">
</c:if>
<c:if test="${ sc_id !=null}">
	<input type="hidden" name="sc_id" value="<%=sc_id %>">
</c:if>
<input type="submit" value="送出新增"></FORM>
</li>
</div>
</div>
</div>

</body>

</html>



