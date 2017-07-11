<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.store.model.*"%>
<%
	StoreVO storeVO=(StoreVO)request.getAttribute("storeVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Update Store here</title>
<script language="JavaScript" src="js/pic_preview.js"></script>

</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>店家資料修改 - update_store_input.jsp</h3>
		<a href="ListAllStore.jsp"><img src="images/logo.png" width="100" height="32" border="0">回首頁</a></td>
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
<FORM METHOD="post" ACTION="store.do" name="form1" enctype="multipart/form-data">
<table border="0">
<tr>
		<td>商家編號:<font color=red><b>*</b></font></td>
		<td><%=storeVO.getStore_id() %></td>
	</tr>
	<tr>
		<td>商家名稱:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_name" size="45" value="<%=storeVO.getStore_name()%>" />
	</tr>
	<jsp:useBean id="storeclassSvc" scope="page" class="com.store_class.model.StoreClassService" />
	<tr>
		<td>商家類別:<font color=red><b>*</b></font></td>
		<td><select size="1" name="sc_id">
			<c:forEach var="StoreClassVO" items="${storeclassSvc.all}">
				<option value="${StoreClassVO.sc_id}" ${(storeVO.sc_id==StoreClassVO.sc_id)? 'selected':'' } >${StoreClassVO.sc_name}
			</c:forEach>
		</select></td>
	</tr>
	
	<tr>
		<td>商家簡介:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_content" size="45" value="<%=storeVO.getStore_content()%>" />
	</tr>
	<tr>
		<td>商家電話:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_phone" size="45" value="<%=storeVO.getStore_phone()%>" />
	</tr>
	<tr>
		<td>商家地址:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_addr" size="45" value="<%=storeVO.getStore_addr()%>" />
	</tr>
	<tr>
		<td>店家圖片:<font color=red><b>*</b></font></td>
			<td>
			<input type="file" name="store_image" id="upfile1">
			 <p>
    			<img src="<%=request.getContextPath()%>/StoreReader?store_id=${storeVO.store_id}" id="image" style="max-width: 150px; max-height: 150px;">
			</p>
			</td>
	</tr>
	<tr>
		<td>商家帳號:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_acc" size="45" value="<%=storeVO.getStore_acc()%>" />
	</tr>
	<tr>
		<td>商家密碼:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_pw" size="45" value="<%=storeVO.getStore_pw()%>" />
	</tr>
	<tr>
		<td>商家是否外送:<font color=red><b>*</b></font></td>
		<td><select name="store_out">
			<option value='有外送' ${(storeVO.store_out=='有外送') ? 'selected':''}>有外送</option>
			<option value='沒有外送' ${(storeVO.store_out=='沒有外送') ? 'selected':''}>沒有外送</option></select> </td>
	</tr>
	<tr>
		<td>商家地區 :<font color=red><b>*</b></font></td>
		<td><select size="1" name="store_zone">
						<option value="基隆市" ${(storeVO.store_zone=='基隆市') ? 'selected':''}>基隆市
						<option value="臺北市" ${(storeVO.store_zone=='臺北市') ? 'selected':''}>臺北市
						<option value="新北市" ${(storeVO.store_zone=='新北市') ? 'selected':''}>新北市
						<option value="桃園市" ${(storeVO.store_zone=='桃園市') ? 'selected':''}>桃園市
						<option value="新竹市" ${(storeVO.store_zone=='新竹市') ? 'selected':''}>新竹市
						<option value="新竹縣" ${(storeVO.store_zone=='新竹縣') ? 'selected':''}>新竹縣
						<option value="苗栗縣" ${(storeVO.store_zone=='苗栗縣') ? 'selected':''}>苗栗縣
						<option value="臺中市" ${(storeVO.store_zone=='臺中市') ? 'selected':''}>臺中市
						<option value="彰化縣" ${(storeVO.store_zone=='彰化縣') ? 'selected':''}>彰化縣
						<option value="南投縣" ${(storeVO.store_zone=='南投縣') ? 'selected':''}>南投縣
						<option value="雲林縣" ${(storeVO.store_zone=='雲林縣') ? 'selected':''}>雲林縣
						<option value="嘉義市" ${(storeVO.store_zone=='嘉義市') ? 'selected':''}>嘉義市
						<option value="嘉義縣" ${(storeVO.store_zone=='嘉義縣') ? 'selected':''}>嘉義縣
						<option value="臺南市" ${(storeVO.store_zone=='臺南市') ? 'selected':''}>臺南市
						<option value="高雄市" ${(storeVO.store_zone=='高雄市') ? 'selected':''}>高雄市
						<option value="屏東縣" ${(storeVO.store_zone=='屏東縣') ? 'selected':''}>屏東縣
						<option value="臺東縣" ${(storeVO.store_zone=='臺東縣') ? 'selected':''}>臺東縣
						<option value="花蓮縣" ${(storeVO.store_zone=='花蓮縣') ? 'selected':''}>花蓮縣
						<option value="宜蘭縣" ${(storeVO.store_zone=='宜蘭縣') ? 'selected':''}>宜蘭縣
						
					</select></td>
	</tr>
	<tr>
		<td>商家狀態:<font color=red><b>*</b></font></td>
		<td><select name="store_state">
			<option value='審核中' ${(storeVO.store_state=='審核中') ? 'selected':''}>審核中</option>
			<option value='開店中' ${(storeVO.store_state=='開店中') ? 'selected':''}>開店中</option>
			<option value='停業中' ${(storeVO.store_state=='停業中') ? 'selected':''}>停業中</option></select> </td>
	</tr>
	</table>
	<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="store_id" value="<%=storeVO.getStore_id() %>">
<input type="submit" value="送出修改"></FORM>
</body>
</html>