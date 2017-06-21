<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>IBM Push: Home</title></head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>IBM Push: Home</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

<p>This is the Home page for IBM Push: Home</p>

<h3>資料查詢:</h3>
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
  <li><a href='<%=request.getContextPath()%>/backend/push/ListAllPush.jsp'>List</a> all Pushes. </li> <br><br>
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/push/push.do" >
        <b>輸入推播編號 (如PUS-000001):</b>
        <input type="text" name="push_id">
        <input type="submit" value="送出">
        <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>

  <jsp:useBean id="pushSvc" scope="page" class="com.push.model.PushService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/push/push.do" >
       <b>選擇推播編號:</b>
       <select size="1" name="push_id">
         <c:forEach var="pushVO" items="${pushSvc.all}" > 
          <option value="${pushVO.push_id}">${pushVO.push_id}
         </c:forEach>   
       </select>
       <input type="submit" value="送出">
       <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/push/push.do" >
       <b>選擇管理員編號:</b>
       <select size="1" name="push_id">
         <c:forEach var="pushVO" items="${pushSvc.all}" > 
          <option value="${pushVO.man_id}">${pushVO.man_id}
         </c:forEach>   
       </select>
       <input type="submit" value="送出">
       <input type="hidden" name="action" value="getOne_For_Display">
     </FORM>
  </li>
  
</ul>


<h3>推播管理</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/backend/push/addPush.jsp'>Add</a> a new Push.</li>
</ul>


</body>

</html>
