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
<title>新增店家 AddStore</title>
<script language="JavaScript" src="js/pic_preview.js"></script>
</head>
<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='500'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><h3>新增店家 - AddStore.jsp</h3></td>
			<td><a href="<%=request.getContextPath() %>/store/store.jsp"><img src="<%=request.getContextPath() %>/images/logo.png"	width="100" height="100" border="1"> 回首頁 </a></td></tr></table>

<h4>員工資料:<font color=red><b>*</b></font>為必填欄位</h4>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message.value}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do" name="form1" enctype="multipart/form-data">
<table border="0">

	<tr>
		<td>商家名稱:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="store_name" size="45" 
			 value="<%= (storeVO==null)? "肯德基" :storeVO.getStore_name() %>"></td>
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
		<td><input type="TEXT" name="store_content" size="45" 
			  value="<%= (storeVO==null)? "我好吃好吃好吃唷" :storeVO.getStore_content() %>"></td>
	</tr>
	<tr>
		<td>商家電話:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="store_phone" size="45" 
			  value="<%= (storeVO==null)? "0912345678" :storeVO.getStore_phone() %>"></td>
	</tr>
	<tr>
		<td>商家地址:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="store_addr" size="45" 
			  value="<%= (storeVO==null)? "中央路" :storeVO.getStore_addr() %>"></td>
	</tr>
	<tr>
		<td>商家照片:<font color=red><b>*</b></font></td>
		<td><input type="file" name="store_image" id="upfile1" >
		 <p>
    	<img id="image"  style="max-width: 150px; max-height: 150px;">
			</p>
  		</td>
	</tr>
	<tr>
		<td>商家帳號:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="store_acc" size="45" 
			  value="<%= (storeVO==null)? "ab123456" :storeVO.getStore_acc() %>"></td>
	</tr>
	<tr>
		<td>商家密碼:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="store_pw" size="45" 
			  value="<%= (storeVO==null)? "123456789" :storeVO.getStore_pw() %>"></td>
	</tr>
	<tr>
		<td>商家是否外送:<font color=red><b>*</b></font></td>
		<td><select name="store_out">
					<option value='有外送'>有外送</option>
					<option value='沒有外送'>沒有外送</option></select> </td>
	</tr>
	<tr>
		<td>商家地區 :<font color=red><b>*</b></font></td>
		<td><select size="1" name="store_zone">
						<option value="基隆市">基隆市
						<option value="臺北市">臺北市
						<option value="新北市">新北市
						<option value="桃園市">桃園市
						<option value="新竹市">新竹市
						<option value="新竹縣">新竹縣
						<option value="苗栗縣">苗栗縣
						<option value="臺中市">臺中市
						<option value="彰化縣">彰化縣
						<option value="南投縣">南投縣
						<option value="雲林縣">雲林縣
						<option value="嘉義市">嘉義市
						<option value="嘉義縣">嘉義縣
						<option value="臺南市">臺南市
						<option value="高雄市">高雄市
						<option value="屏東縣">屏東縣
						<option value="臺東縣">臺東縣
						<option value="花蓮縣">花蓮縣
						<option value="宜蘭縣">宜蘭縣
						
					</select></td>
	</tr>
	</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
</body>
</html>