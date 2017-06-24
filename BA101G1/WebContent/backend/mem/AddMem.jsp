<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%
	MemberVO memberVO=(MemberVO)request.getAttribute("memberVO");
%>
<html>
<head>
<title>會員資料新增 - AddMem.jsp</title></head>


<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='500'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><h3>會員資料新增 - addMan.jsp</h3></td>
			<td><a href="select_mem.jsp"><img src="images/tomcat.gif"	width="100" height="100" border="1"> 回首頁 </a></td></tr></table>

<h4>員工資料:<font color=red><b>*</b></font>為必填欄位</h4>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/mem/mem.do" name="form1">
<table border="0">

	<tr>
		<td>員工姓名:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="mem_name" size="45" 
			value="<%= (memberVO==null)? "老王" :memberVO.getMem_name() %>" /></td>
		
	</tr>
	<tr>
		<td>電話:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="mem_phone" size="45"
			 value="<%= (memberVO==null)? "123" :memberVO.getMem_phone() %>" /></td>
	</tr>
	<tr>
		<td>密碼:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="mem_pw" size="45"
			 value="<%= (memberVO==null)? "1222212" :memberVO.getMem_pw() %>" /></td>
	</tr>
	<tr>
		<td>信箱:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="mem_mail" size="45"
			 value="<%= (memberVO==null)? "sadqwe" :memberVO.getMem_mail() %>" /></td>
	</tr>


</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
</body>

</html>
