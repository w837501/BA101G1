<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ad.model.*"%>
<%
	AdVO adVO=(AdVO)request.getAttribute("adVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Add Advertisement here</title>
</head>
<bbody bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='500'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><h3>員工資料新增 - addMan.jsp</h3></td>
			<td><a href="browseAD.jsp"><img src="images/logo.png"	width="100" height="100" border="1"> 回首頁 </a></td></tr></table>

<h4>廣告資料:<font color=red><b>*</b></font>為必填欄位</h4>
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
<FORM METHOD="post" ACTION= "<%=request.getContextPath()%>/frontend/advertisement/ad.do" name="form1">
<table border="0">

	<tr>
		<td>商店編號:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="store_id" size="45" 
			value="<%= (adVO==null)? "STP-000001" :adVO.getAd_id() %>" /></td>
		
	</tr>
	<tr>
		<td>廣告名字:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="ad_name" size="45"
			 value="<%= (adVO==null)? "肚子餓" :adVO.getAd_name() %>" /></td>
	</tr>
	<tr>
		<td>廣告內容:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="ad_content" size="45"
			 value="<%= (adVO==null)? "快來吃唷唷唷唷唷" :adVO.getAd_content() %>" /></td>
	</tr>
	<tr>
		<td>廣告圖片:<font color=red><b>*</b></font></td>
		<td>
			<FORM  method=post enctype="multipart/form-data" name="ad_image">
        		<input type="file" name="upfile1">
  			</FORM></td>
		</tr>
	<tr>
		<td>廣告時間:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="ad_time" size="45"
			 value="<%= (adVO==null)? "null" :adVO.getAd_time() %>" /></td>
	</tr>
	<tr>
		<td>是否推播:<font color=red><b>*</b></font></td>
		<td><select>
			<option value='1'>是</option>
			
			<option value='2'>否</option>
		</select>
		<input type="TEXT" name="ad_push_content" size="45" value="<%= (adVO==null)? "4654" :adVO.getAd_push_content() %>" /></td></td>
	</tr>


</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>


</body>
</html>