<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mem.model.*" %>
<%@ page import="java.util.*" %>

<%
	MemberService memSvc=new MemberService();
	List<MemberVO> list=memSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<html>
<head>
  <title>吃訂我EatMe</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="<%=request.getContextPath() %>/backend/assets/css/bootstrap.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="<%=request.getContextPath() %>/backend/assets/css/custom.css" rel="stylesheet" />
        <!-- LOGIN STYLES -->
    <link href="<%=request.getContextPath() %>/backend/assets/css/login.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
    <div id="wrapper">
         
        
<c:if test="${not empty errorMsgs }">
	<font color='red'>修正以下錯誤
	<ul>
		<c:forEach var="message" items="${errorMsgs }">
			<li>${message }</li>
		</c:forEach>
	</ul>	
	</font>
</c:if>	

<table   width='800'>
	<tr>
		<th>會員編號</th>
		<th>會員姓名</th>
		<th>會員電話</th>
		<th>會員編密碼</th>
		<th>會員編信箱</th>
		<th>會員狀態</th>
	</tr>
	
	<c:forEach var="MemberVO" items="${list}" >
		<tr align="center" valign="middle" ${(MemberVO.mem_id==param.mem_id) ? 'bgcolor=#CCCCFF':''}>
			<td>${MemberVO.mem_id }</td>
			<td>${MemberVO.mem_name }</td>
			<td>${MemberVO.mem_phone }</td>
			<td>${MemberVO.mem_pw }</td>
			<td>${MemberVO.mem_mail }</td>
            <td width="30">
               <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/member/member.do" name="form1">
                   <select size="1" name="mem_state">
                      <option value="未認證" ${(MemberVO.mem_state=="未認證")?'selected':'' } >未認證
                      <option value="已認證" ${(MemberVO.mem_state=="已認證")?'selected':'' } >已認證
                      <option value="停權中" ${(MemberVO.mem_state=="停權中")?'selected':'' } >停權中
                   </select>
                   <input type="submit" value="送出">
                   <input type="hidden" name="mem_id" value="${MemberVO.mem_id}">
                   <input type="hidden" name="mem_mail" value="${MemberVO.mem_mail}">
                   <input type="hidden" name="action" value="updateMemberState">      
                </FORM>
            </td>			
		</tr>
	</c:forEach>
</table>





        
<!-- ****************內頁************************ -->

        </div>
        <!-- /. PAGE WRAPPER  -->

                  <!-- /. ROW  --> 
            </div>   
        </div>             
        <div class="footer">
        </div>
     <!-- /. WRAPPER  -->

    <!-- JQUERY SCRIPTS -->
    <script src="<%=request.getContextPath() %>/backend/assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="<%=request.getContextPath() %>/backend/assets/js/bootstrap.min.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="<%=request.getContextPath() %>/backend/assets/js/custom.js"></script>
    
    
</body>
</html>