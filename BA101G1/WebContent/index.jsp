<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>Index</title></head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>吃訂我線上訂餐系統</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

<p>Index</p>


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

<IMG src="FakeInfo/LOGO.png" width="100px" height="100px">

<h3><font color=orange>Header</font></h3>

<ul>
  <li><a href='store/store.do?action=getStoreHot&store_star=80'>熱門商家</a></li>
  <li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>找商家</a></li>
  <li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>找商品</a></li>
</ul>


<h3><font color=orange>商家查詢</font></h3>
<ul>
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do" >
        <b>搜尋商家:</b>
        <input type="text" name="store_name">
        <input type="submit" value="送出">
        <input type="hidden" name="action" value="get_store">
    </FORM>
  </li>

  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do" >
       <b>選擇地區 :</b>
       <select size="1" name="store_zone">
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
       </select>
       <input type="submit" value="送出">
       <input type="hidden" name="action" value="get_zone">
    </FORM>
  </li>
</ul>




<!--  
  <IMG src="<%=request.getContextPath()%>/StoreClassReader?store_id=STO-000004">
-->

</body>
</html>
