<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>STORE</title></head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>IBM Emp: Home</h3><font color=red>( MVC )</font></td>
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
        <input type="hidden" name="action" value="get_store">
    </FORM>
  </li>
  
	<% String store_zone=(String)request.getAttribute("store_zone"); %>

  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do" >
       <b>選擇地區 :</b>
       <select size="1" name="store_zone">
          <option value="基隆市" <c:if test="${store_zone.equals('基隆市') }"> selected</c:if>>基隆市
          <option value="臺北市" <c:if test="${store_zone.equals('臺北市') }"> selected</c:if>>臺北市
          <option value="新北市" <c:if test="${store_zone.equals('新北市') }"> selected</c:if>>新北市
          <option value="桃園市" <c:if test="${store_zone.equals('桃園市') }"> selected</c:if>>桃園市
          <option value="新竹市" <c:if test="${store_zone.equals('新竹市') }"> selected</c:if>>新竹市
          <option value="新竹縣" <c:if test="${store_zone.equals('新竹縣') }"> selected</c:if>>新竹縣
          <option value="苗栗縣" <c:if test="${store_zone.equals('苗栗縣') }"> selected</c:if>>苗栗縣
          <option value="臺中市" <c:if test="${store_zone.equals('臺中市') }"> selected</c:if>>臺中市
          <option value="彰化縣" <c:if test="${store_zone.equals('彰化縣') }"> selected</c:if>>彰化縣
          <option value="南投縣" <c:if test="${store_zone.equals('南投縣') }"> selected</c:if>>南投縣
          <option value="雲林縣" <c:if test="${store_zone.equals('雲林縣') }"> selected</c:if>>雲林縣
          <option value="嘉義市" <c:if test="${store_zone.equals('嘉義市') }"> selected</c:if>>嘉義市
          <option value="嘉義縣" <c:if test="${store_zone.equals('嘉義縣') }"> selected</c:if>>嘉義縣
          <option value="臺南市" <c:if test="${store_zone.equals('臺南市') }"> selected</c:if>>臺南市
          <option value="高雄市" <c:if test="${store_zone.equals('高雄市') }"> selected</c:if>>高雄市
          <option value="屏東縣" <c:if test="${store_zone.equals('屏東縣') }"> selected</c:if>>屏東縣
          <option value="臺東縣" <c:if test="${store_zone.equals('臺東縣') }"> selected</c:if>>臺東縣
          <option value="花蓮縣" <c:if test="${store_zone.equals('花蓮縣') }"> selected</c:if>>花蓮縣
          <option value="宜蘭縣" <c:if test="${store_zone.equals('宜蘭縣') }"> selected</c:if>>宜蘭縣
       </select>
       <input type="submit" value="送出">
       <input type="hidden" name="action" value="get_zone">
    </FORM>
  </li>
</ul>
 
<%if (request.getAttribute("storelist")!=null){%>
       <jsp:include page="/store/listSearchStore.jsp" />
<%} %>

</body>
</html>
