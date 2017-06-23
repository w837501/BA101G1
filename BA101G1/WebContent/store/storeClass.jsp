<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.store_class.model.*"%>
<html>
<head><title>STORE</title></head>
<body bgcolor='white'>

<%! int i = 0 ; %>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>STORE CLASS</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

<p>STORE</p>

<h3>商家查詢:</h3>
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

<ul>
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do" >
        <b>搜尋商家:</b>
        <input type="text" name="store_name">
        <input type="submit" value="送出">
        <input type="hidden" name="action" value="get_store_b">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do" >
       <b>選擇地區
       :</b>
       <select size="1" name="store_zone">
          <option value="0">基隆市
          <option value="1">臺北市
          <option value="2">新北市
          <option value="3">桃園市
          <option value="4">新竹市
          <option value="5">新竹縣
          <option value="6">苗栗縣
          <option value="7">臺中市
          <option value="8">彰化縣
          <option value="9">南投縣
          <option value="10">雲林縣
          <option value="11">嘉義市
          <option value="12">嘉義縣
          <option value="13">臺南市
          <option value="14">高雄市
          <option value="15">屏東縣
          <option value="16">臺東縣
          <option value="17">花蓮縣
          <option value="18">宜蘭縣
       </select>
       <input type="submit" value="送出">
       <input type="hidden" name="action" value="get_zone">
    </FORM>
  </li>
</ul>


<jsp:useBean id="scSvc" scope="page" class="com.store_class.model.StoreClassService" />

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>圖片</th>
		<th>類別編號</th>
		<th>商家類別</th>
	</tr>
	
	<c:forEach var="scVO" items="${scSvc.all}">
		<tr align='center' valign='middle'>
			<td></td>
			<td>${scVO.sc_id}</td>
			<td><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreClass&sc_id=<%= i++ %>'>${scVO.sc_name}</a></td>
		</tr>
	</c:forEach>
</table>


</body>
</html>
