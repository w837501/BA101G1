<%@page import="com.mem.model.MemberService"%>
<%@ page import="com.man.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
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
         <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="adjust-nav">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="" href="<%=request.getContextPath() %>/backend/index.jsp">
                        <img src="<%=request.getContextPath() %>/backend/assets/img/LOGO_2.png" style="width: 180px;"/>

                    </a>
                    
                </div>
                
                <span class="logout-spn" >
                	${manVO.man_id} ${manVO.man_name}
                  <a href="<%=request.getContextPath() %>/backend/man/login_man.jsp">登出</a>  
                </span>
                
                
            </div>
        </div>
        </div>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                 

                    <li class="active-link">
                        <a href="<%=request.getContextPath() %>/backend/member/select_mem.jsp" ><i class="fa fa-desktop "></i>會員管理 </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/store/store_index.jsp"><i class="fa fa-bar-chart-o"></i>商家會員管理</a>
                    </li>      
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/store/store_index.jsp"><i class="fa fa-bar-chart-o"></i>員工管理no</a>
                    </li>                                    
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/memr/select_page.jsp"><i class="fa fa-bar-chart-o"></i>會員檢舉  </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/str/selectPage.jsp"><i class="fa fa-bar-chart-o "></i>商家檢舉 </a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-qrcode "></i>審核商家no</a>
                    </li>     
                    <li>
                        <a href="<%=request.getContextPath()%>/frontend/selectOrder/selectOrder.jsp"><i class="fa fa-table "></i>一般訂單查詢</a>
                    </li>  
                    <li>
                        <a href="#"><i class="fa fa-qrcode "></i>管理儲值交易no</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-qrcode "></i>銷售/統計no</a>
                    </li>      
                    <li>
                        <a href="#"><i class="fa fa-qrcode "></i>錢包管理no</a>
                    </li>                                                                      
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/push/selectPage.jsp"><i class="fa fa-edit "></i>推播</a>
                    </li>                  
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/news/news_index.jsp"><i class="fa fa-bar-chart-o"></i>刊登最新消息</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/ad/listAllUncheckedAd.jsp"><i class="fa fa-bar-chart-o"></i>廣告管理</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/rev/Select_Rev.jsp"><i class="fa fa-bar-chart-o"></i>商家月結算</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/man/select_man.jsp"><i class="fa fa-bar-chart-o"></i>管理員管理</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/man/select_man.jsp"><i class="fa fa-bar-chart-o"></i>權限管理</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/backend/store_commit/store_commit_index.jsp"><i class="fa fa-bar-chart-o"></i>商家評價管理</a>
                    </li>





                    
                </ul>
              </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                     	<h2>後端管理者平台</h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                <div class="row">
                <!-- ******************select_man.jsp原先內容********************* -->
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>IBM Member_Report: Home</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

<p>This is the Home page for IBM Member_Report: Home</p>

<h3>會員檢舉資料查詢:</h3>
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
	<form action="member_report.do" method="post">
		<a href="javascript:;" onclick="parentNode.submit();">List</a>
		<input type="hidden" name="action" value="listAll">
	</form> 
  </li>
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/memr/member_report.do" >
        <b>輸入會員檢舉單號 (如MR-000001):</b>
        <input type="text" name="mr_id">
        <input type="submit" value="送出">
        <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>

  <jsp:useBean id="mrSvc" scope="page" class="com.member_report.model.MemberReportService" />
   
  <li>
     <FORM METHOD="post" ACTION="member_report.do" >
       <b>選擇會員編號:</b>
       <select size="1" name="mr_id">
         <c:forEach var="mrVO" items="${mrSvc.all}" > 
          <option value="${mrVO.mr_id}">${mrVO.mr_id}
         </c:forEach>   
       </select>
       <input type="submit" value="送出">
       <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="member_report.do" >
       <b>選擇會員檢舉單號:</b>
       <select size="1" name="mr_id">
         <c:forEach var="mrVO" items="${mrSvc.all}" > 
          	<option value="${mrVO.mr_id}">${mrVO.mr_id}
         </c:forEach>   
       </select>
       <input type="submit" value="送出">
       <input type="hidden" name="action" value="getOne_For_Display">
     </FORM>
  </li>
  
  
<%--    <jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" /> --%>
  
<!--   <li> -->
<%--      <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/dept/dept.do" > --%>
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


<h3>會員檢舉資料管理</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/backend/memr/addMR.jsp'>Add</a> a new MemberReport.</li>
</ul>
				<!-- ******************select_man.jsp原先內容********************* -->

                </div>
<!-- *********************include頁面******************* -->
<%if ("列出所有會員檢舉"==request.getAttribute("whichPage")){%>
       <jsp:include page="listAllMR.jsp" />
<%} %>
<%if ("列出單一會員檢舉"==request.getAttribute("whichPage")){%>
       <jsp:include page="listOneMR.jsp" />
<%} %>

<%if ("修改單一會員檢舉"==request.getAttribute("whichPage")){%>
       <jsp:include page="update_mr_input.jsp" />
<%} %>

<!-- *********************include頁面******************* -->

                  <!-- /. ROW  --> 
            </div>   
        </div>             
        <div class="footer">
      
    
            <div class="row">
                <div class="col-lg-12" >
                    &copy;  2014 yourdomain.com | More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
                </div>
            </div>
        </div>
          

     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="<%=request.getContextPath() %>/backend/assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="<%=request.getContextPath() %>/backend/assets/js/bootstrap.min.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="<%=request.getContextPath() %>/backend/assets/js/custom.js"></script>
    

</body>
</html>


