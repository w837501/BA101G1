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
<title>會員檢舉資料新增 - addMR.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/pic_preview.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <link rel="stylesheet" href="js/timepicker.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script type="text/javascript" src="js/timepicker.js"></script>


<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>商家檢舉資料新增 - addMR.jsp</h3>
		</td>
	</tr>
</table>

<h3>會員檢舉資料:</h3>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

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
</body>

</html>



