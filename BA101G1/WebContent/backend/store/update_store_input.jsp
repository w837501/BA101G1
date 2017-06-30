<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.store.model.*"%>
<%-- <%
	StoreVO storeVO = (StoreVO) request.getAttribute("storeVO"); //EmpServlet.java (Concroller), 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>  --%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Update man here</title>
</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>員工資料修改 - update_emp_input.jsp</h3>
		<a href="select_man.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></td>
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

<FORM METHOD="post" ACTION="store.do" name="form1">
<table border="0">
	<tr>
		<td>商店編號:<font color=red><b>*</b></font></td>
		<td>${storeVO.store_id} </td>
	</tr>
	<tr>
		<td>商店名稱:</td>
		<td><input type="TEXT" name="store_name" size="45" value="${storeVO.store_name}" /></td>
	</tr>
	<tr>
		<td>商店地址:</td>
		<td><input type="TEXT" name="store_addr" size="45"	value="${storeVO.store_addr}" /></td>
	</tr>
	
	<tr>
		<td>商家電話:</td>
		<td><input type="TEXT" name="store_phone" size="45"	value="${storeVO.store_phone }" /></td>
	</tr>
	<tr>
		<td>狀態:</td>
		<td><select name="store_state" value="${storeVO.store_state}">
					<option value='審核中'>審核中</option>
					<option value='開店中'>開店中</option>
					<option value='停業'>停業</option>
			</select>
		</td>
	</tr>
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="store_id" value="${storeVO.store_id}">
<input type="submit" value="送出修改"></FORM>


</body>
</html>