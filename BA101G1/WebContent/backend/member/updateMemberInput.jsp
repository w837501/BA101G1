<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mem.model.*"%>
<%
	MemberVO memberVO=(MemberVO) request.getAttribute("memberVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Update Mem here</title>
</head>
<body bgcolor='white'>

<a href="<%=request.getContextPath()%>/backend/mem/select_mem.jsp">會員</a>
<a href="<%=request.getContextPath()%>/backend/news/news_index.jsp">最新消息</a>
<a href="<%=request.getContextPath()%>/backend/rev/Select_Rev.jsp">商家月結</a>
<a href="<%=request.getContextPath()%>/backend/store/store_index.jsp">商家</a>
<a href='<%=request.getContextPath()%>/backend/store_class/listAllStoreClass.jsp'>商家類別</a> 
<a href="<%=request.getContextPath()%>/backend/store_commit/store_commit_index.jsp">商家評價</a>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>員工資料修改 - update_emp_input.jsp</h3>
	</tr>
</table>
<h3>資料修改:</h3>
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
<form action="<%=request.getContextPath() %>/backend/member/member.do" method='post' name='form1'>
<table border='0'>
	<tr>
		<td>會員編號:<font color='red'><b>*</b></font></td>
		<td><%=memberVO.getMem_id() %></td>
	</tr>
	<tr>
		<td>會員姓名:</td>
		<td><input type="TEXT" name="mem_name" size="45" value="<%=memberVO.getMem_name() %>"/></td>
	</tr>
	<tr>
		<td>會員電話:</td>
		<td><input type="TEXT" name="mem_phone" size="45" value="<%=memberVO.getMem_phone() %>"/></td>
	</tr>
	<tr>
		<td>會員密碼:</td>
		<td><input type="TEXT" name="mem_pw" size="45" value="<%=memberVO.getMem_pw() %>"/></td>
	</tr>
	<tr>
		<td>會員信箱:</td>
		<td><input type="TEXT" name="mem_mail" size="45" value="<%=memberVO.getMem_mail() %>"/></td>
	</tr>
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="mem_id" value="<%=memberVO.getMem_id()%>">
<input type="submit"  value="送出修改">

</form>

</body>
</html>