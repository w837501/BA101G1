<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.member_report.model.*"%>
<%@ page import="com.mem.model.*"%>
<%
MemberReportVO mrVO = (MemberReportVO) request.getAttribute("mrVO");
MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
String order_id=request.getParameter("order_id");
pageContext.setAttribute("order_id", order_id);
String sc_id=request.getParameter("sc_id");
pageContext.setAttribute("sc_id", sc_id);
String store_id=request.getParameter("store_id");
pageContext.setAttribute("store_id", store_id);

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



<h3>會員檢舉資料:</h3>


<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member_report/member_report.do" name="form1" enctype="multipart/form-data">
<table border="0">

	<tr>
		<td>會員編號:</td>
		<td><%=memberVO.getMem_id() %></td>
	</tr>
	<c:if test="${ not empty order_id}">
	<tr>
		<td>訂單編號:</td>
		<td><%=order_id %> 
		</td>
	</tr>
	</c:if>
	<c:if test="${not empty store_id  }">
	<tr>
		<td>商家編號:</td>
		<td><%=store_id %></td>
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
		<td><input type="TEXT" name="mr_content" size="45"
			value="" /></td>
	</tr>
	<tr>
		<td>檢舉圖片:</td>
		<td>			
		<div id="demo">
	        <input id="upfile1" type="file"  name="mr_image"/>
	        <p>
	            <img id="image"  style="max-width: 150px; max-height: 150px;">
	        </p>
	    </div>
		</td>
	</tr>
	

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="hidden" name="mem_id" value="${memberVO.mem_id }">

<c:if test="${order_id !=null }">
<input type="hidden" name="order_id" value="<%=order_id %>"></c:if>

<c:if test="${store_id !=null }">
<input type="hidden" name="store_id" value="<%=store_id %>"></c:if>

<c:if test="${sc_id !=null }">
<input type="hidden" name="sc_id" value="<%=sc_id %>"></c:if>

<input type="submit" value="送出新增"></FORM>
</body>

</html>



