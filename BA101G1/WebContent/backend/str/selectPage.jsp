<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>IBM StoreReport: Home</title></head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>IBM StoreReport: Home</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

<p>This is the Home page for IBM StoreReport: Home</p>

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
  <li><a href='<%=request.getContextPath()%>/backend/str/listAllSR.jsp'>List</a> all StoreReports. </li> <br><br>
  <li><%=request.getContextPath()%>/store_report/store_report.do</li>
  <li>
  
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store_report/store_report.do" >
        <b>輸入商家檢舉單號 (如SR-000001):</b>
        <input type="text" name="sr_id">
        <input type="submit" value="送出">
        <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>

  <jsp:useBean id="srSvc" scope="page" class="com.store_report.model.StoreReportService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store_report/store_report.do" >
       <b>選擇商家檢舉單號:</b>
       <select size="1" name="sr_id">
         <c:forEach var="srVO" items="${srSvc.all}" > 
          <option value="${srVO.sr_id}">${srVO.sr_id}
         </c:forEach>   
       </select>
       <input type="submit" value="送出">
       <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>
   
  
<%--    <jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" /> --%>
  
<!--   <li> -->
<%--      <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store_report/store_report.do" > --%>
<!--        <b><font color=orange>選擇部門:</font></b> -->
<!--        <select size="1" name="deptno"> -->
<%--          <c:forEach var="deptVO" items="${deptSvc.all}" >  --%>
<%--           <option value="${deptVO.deptno}">${deptVO.dname} --%>
<%--          </c:forEach>    --%>
<!--        </select> -->
<!--        <input type="submit" value="送出"> -->
<!--        <input type="hidden" name="action" value="listEmps_ByDeptno_A"> -->
<!--      </FORM> -->
<!--   </li> -->
</ul>


<h3>商家檢舉單號管理</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/backend/str/addSR.jsp'>Add</a> a new StoreReport.</li>
</ul>

</body>

</html>
